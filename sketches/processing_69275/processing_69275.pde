
import hypermedia.net.*;
 import processing.serial.*;
 import java.awt.MouseInfo;
 import java.awt.Point;

 Point mouse1, mouse2, mouse3;
 UDP udp;
 Serial port;
 float di;
 float d1;
 float d2;
 int d;
 int d3 = 1;
 int time1 = 0;
 int time2;
 String b;
 
 void setup() {
 mouse1 = MouseInfo.getPointerInfo().getLocation();
 udp = new UDP(this, 49550);
 udp.listen(true);
 background(0);
 udp.send("3", "nimavakili.getmyip.com", 49500);
 }

 void sendudp(int d) {
  time2 = millis();
  if ((time2 - time1) > 150) {
  println(d);
  b = str(d);
  udp.send(b, "nimavakili.getmyip.com", 49500);
  //udp.send(b, "67.20.208.58", 49500);
  time1 = time2;
  //d3 = d;
  }
 }

 void draw() {
 mouse2 = MouseInfo.getPointerInfo().getLocation();
  d1 = pow((mouse2.x - mouse1.x),2);
  d2 = pow((mouse2.y - mouse1.y),2);
  di = sqrt(d1 + d2);
  d = constrain(int(di),0,160);
  colorMode(RGB, 160);
  if (di > 10 && 10 < d && d <= 60) {
    sendudp(1);
   mouse1 = mouse2;
  }
  else if (di > 10 && 60 < d && d <= 110) {
    sendudp(2);
   mouse1 = mouse2;
  }
  else if (di > 10 && 110 < d && d <= 160) {
    sendudp(3);
   mouse1 = mouse2;
  }
  background(d);
  delay(50);
 }
