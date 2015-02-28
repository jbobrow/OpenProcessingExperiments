
import hypermedia.net.*;

int port = 8000;
String ip ="217.129.134.170";
String message =new String("Hello");
UDP udpTX;

void setup(){
udpTX=new UDP(this, port, ip);
udpTX.log(true);
noLoop();
}

void draw(){
udpTX.send(message,ip,port);
delay(5000);
loop();
}
