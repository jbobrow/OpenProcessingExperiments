

 // Processing UDP example to send and receive string data from Arduino 
 // press any key to send the "Hello Arduino" message
 
 
 import hypermedia.net.*;
 
 UDP udp;  // define the UDP object
 
 
 void setup() {
 udp = new UDP( this, 6000 );  // create a new datagram connection on port 6000
 //udp.log( true );         // <-- printout the connection activity
 udp.listen( true );           // and wait for incoming message  
 }
 
 void draw()
 {
 }
 
 void keyPressed() {
 String ip       = "172.18.50.202"; // the remote IP address
 int port        = 8888;        // the destination port
 
 udp.send("Hello World", ip, port );   // the message to send
 
 }
 
 void receive( byte[] data ) {          // <-- default handler
 //void receive( byte[] data, String ip, int port ) {   // <-- extended handler
 
 for(int i=0; i < data.length; i++) 
 print(char(data[i]));  
 println();   
 }

