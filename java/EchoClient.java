import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;

import java.io.BufferedReader; 
import java.io.InputStreamReader;

import transmission_object.TransmissionObjectOuterClass.TransmissionObject; 
import transceiver.TransceiverOuterClass.EchoRequest;
import transceiver.TransceiverOuterClass.EchoResponse;
import transceiver.TransceiverOuterClass.UpperCaseRequest;
import transceiver.TransceiverOuterClass.UpperCaseResponse;
import transceiver.TransceiverGrpc;


public class EchoClient {

    public static void main (String args[]) {
        System.out.println("Spinning up the Echo Client in Java...");

        try {

            final BufferedReader commandLineInput = new BufferedReader(
                    new InputStreamReader(System.in)
                    );

            System.out.println("Waiting on input from the user...");

            final String inputFromUser = commandLineInput.readLine();
            if (inputFromUser != null) {
                System.out.println("Received by Java: " + inputFromUser);
                ManagedChannel channel = ManagedChannelBuilder
                    .forAddress("localhost", 1234)
                    .usePlaintext()
                    .build();

                TransceiverGrpc.TransceiverBlockingStub stub = TransceiverGrpc.newBlockingStub(channel); 
                EchoRequest request = EchoRequest.newBuilder()
                    .setFromClient(
                            TransmissionObject.newBuilder()
                            .setMessage(inputFromUser)
                            .setValue(3.145f)
                            .build())
                    .build();
                System.out.println("A");
                EchoResponse response = stub.echo(request);
                System.out.println("B");

                GsonBuilder builder = new GsonBuilder(); 
                Gson gson = builder.create();

                System.out.println("Received Message from server: ");
                System.out.println(response);

                UpperCaseRequest upperCaseRequest = UpperCaseRequest.newBuilder().setOriginal(inputFromUser).build();
                UpperCaseResponse upperCaseResponse = stub.upperCase(upperCaseRequest); 

                System.out.println("Received upper cased:"); 
                System.out.println(upperCaseResponse);

                System.out.println("response jsonify:");
                System.out.println(gson.toJson(upperCaseResponse));

                channel.shutdownNow();
            }
        } catch (Exception e) {
            System.err.println("Error: " + e); }
    } 
}
