
/**
 * Based on code from Keith Peters (www.bit-101.com)
 * 
 * The arm follows the position of the mouse by
 * calculating the angles with atan2(). 
 */



import oscP5.*;
import netP5.*;

OscP5 osc;
String myMessage;
float myX, myY;


int tentNum=27;

Tent[] myTent = new Tent[tentNum];
Tent2[] myTent2 = new Tent2[tentNum];
Tent3[] myTent3 = new Tent3[tentNum];
Tent4[] myTent4 = new Tent4[tentNum];
//CenterT[] myCenterT = new CenterT[tentNum];

void setup() {
  
    osc = new OscP5(this, 8000); //start oscP5, listen to incoming messages at port 8000

  size(800, 800);
  smooth(); 

for (int i=0; i<tentNum;i++){
    myTent[i] = new Tent(i*30, 0);
    myTent2[i] = new Tent2(i*30, height);
    myTent3[i] = new Tent3(0, i*30);
    myTent4[i] = new Tent4(width, i*30);
//myCenterT[i] = new CenterT(width, i*30);
}

}

void draw() {
  background(0);
for (int i=0; i<tentNum;i++){
    myTent[i].draw(myX, myY);
  
}
for (int i=0; i<tentNum;i++){
    myTent2[i].draw(myX,myY);
  
}

for (int i=0; i<tentNum;i++){
    myTent3[i].draw(myX, myY);
  
}
for (int i=0; i<tentNum;i++){
    myTent4[i].draw(myX, myY);
  
}

}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //  print("### received an osc message.");
  //  print(" addrpattern: "+theOscMessage.addrPattern());
  //  println(" typetag: "+theOscMessage.typetag());

  myMessage = theOscMessage.addrPattern();
  println(myMessage);

  myX = theOscMessage.get(0).floatValue();
  myY = theOscMessage.get(1).floatValue();

  println("x:" + myX);
  println("y"+ myY);
}

