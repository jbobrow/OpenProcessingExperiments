
// load the P5 libraries:
import oscP5.*;
import netP5.*;

// create the objects we need:
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  // start oscP5:
  oscP5 = new OscP5(this, 11111);
  // set up the address we will send messages to:
  // "127.0.0.1" means 'send to the same machine this is running on'
  // 12345 is the port number Max is listening on
  myRemoteLocation = new NetAddress("127.0.0.1", 12345);
  size(900, 600);
  smooth(8);
  background(225, 225, 225);
}
 
void mainbrush(){
  pushMatrix();
    noFill();
    stroke(0);
    strokeWeight(20 -dist(mouseX, mouseY, pmouseX, pmouseY)/2);
    line(mouseX, mouseY, pmouseX, pmouseY);
    popMatrix();
}
void blur(){
   pushMatrix();
    noFill();
    stroke(10, random(30,40));
    strokeWeight(20 -dist(mouseX, mouseY, pmouseX, pmouseY)/2 +random(5,10));
    line(mouseX, mouseY, pmouseX, pmouseY);
    popMatrix();
}
void drawbrush(){
  mainbrush();
  blur();
  blur();
  blur();
  blur();
}
  void draw() {
  pushMatrix();
  translate(800,500);
  noFill();
  stroke(175,15,15);
  strokeWeight(5);
  rect(0,0,80,80);
  line(35,10,15,25);
  line(15,25,15,60);
  line(15,40,35,40);
  line(15,60,35,60);
  line(45,15,45,70);
  line(45,15,65,15);
  line(65,15,65,55);
  line(65,55,53,50);
  popMatrix();
  if(mousePressed) {
    drawbrush();
  }
 
}
void mouseDragged(){
  OscMessage myMessage = new OscMessage("/draw");
  myMessage.add(mouseX); 
  myMessage.add(mouseY); 
  myMessage.add(pmouseX); 
  myMessage.add(pmouseY);
  oscP5.send(myMessage, myRemoteLocation);
}
