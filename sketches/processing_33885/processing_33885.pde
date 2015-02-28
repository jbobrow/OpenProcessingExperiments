

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float lhx, lhy, rhx, rhy, hx, hy; // coordinates
float rex, rey, lex, ley, rfx, rfy;
float lfx, lfy, rkx, rky, lkx, lky, tx, ty;


void setup() {

  size(640, 480);
  frameRate(25);
  oscP5 = new OscP5(this, 12345);

  myRemoteLocation = new NetAddress("127.0.0.1", 12346);

}


void draw() {
  background(0); 
  sendData(); //refresh
  ellipse(hx, hy, 40, 60);
  fill(255, 50, 50);
  ellipse(lhx, lhy, 30, 30);
  fill(50, 50, 255);
  ellipse(rhx, rhy, 30, 30);
  stroke(255, 255, 255);
  

  ellipse(rex, rey, 30, 30);
  ellipse(lex, ley, 30, 30);
  ellipse(rfx, rfy, 20, 20);
  ellipse(lfx, lfy, 20, 20);
  ellipse(rkx, rky, 30, 30);
  ellipse(lkx, lky, 30, 30);
  ellipse(tx, ty, 30, 30);
  
  float d = dist(tx,ty,hx,hy);
  
  line(hx,hy+d/3,lex,ley);
  line(hx,hy+d/3,rex,rey);
  
  
  strokeWeight(2);
  line(lex,ley,lhx,lhy);
  line(rex,rey,rhx,rhy);
  line(hx,hy,tx,ty);
  line(tx,ty,rkx,rky);
  line(tx,ty,lkx,lky);
  line(lkx,lky,lfx,lfy);
  line(rkx,rky,rfx,rfy);


 
}

void sendData() {

  OscMessage myMessage = new OscMessage("/righthand_trackjointpos");
  OscMessage myMessage2 = new OscMessage("/lefthand_trackjointpos");
  OscMessage myMessage3 = new OscMessage("/head_trackjointpos");
  OscMessage myMessage4 = new OscMessage("/rightelbow_trackjointpos");
  OscMessage myMessage5 = new OscMessage("/leftelbow_trackjointpos");
  OscMessage myMessage6 = new OscMessage("/rightfoot_trackjointpos");
  OscMessage myMessage7 = new OscMessage("/leftfoot_trackjointpos");
  OscMessage myMessage8 = new OscMessage("/rightknee_trackjointpos");
  OscMessage myMessage9 = new OscMessage("/leftknee_trackjointpos");
  OscMessage myMessage10 = new OscMessage("/torso_trackjointpos");




  myMessage.add(3);
  myMessage2.add(3);
  myMessage3.add(3);
  myMessage4.add(3);
  myMessage5.add(3);
  myMessage6.add(3);
  myMessage7.add(3);
  myMessage8.add(3);
  myMessage9.add(3);
  myMessage10.add(3);




  oscP5.send(myMessage, myRemoteLocation); 
  oscP5.send(myMessage2, myRemoteLocation); 
  oscP5.send(myMessage3, myRemoteLocation);
  oscP5.send(myMessage4, myRemoteLocation); 
  oscP5.send(myMessage5, myRemoteLocation); 
  oscP5.send(myMessage6, myRemoteLocation);
  oscP5.send(myMessage7, myRemoteLocation); 
  oscP5.send(myMessage8, myRemoteLocation); 
  oscP5.send(myMessage9, myRemoteLocation);
  oscP5.send(myMessage10, myRemoteLocation);
}


/* incoming osc message. */
void oscEvent(OscMessage theOscMessage) {
  // print("### received an osc message."+theOscMessage);
  //print(" addrpattern: "+theOscMessage.addrPattern());
  // println(" typetag: "+theOscMessage.typetag());

  String v=theOscMessage.addrPattern();



  if (v.equals("/righthand_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    rhx=x;
    rhy=y;
  }

  if (v.equals("/lefthand_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    lhx=x;
    lhy=y;
  }

  if (v.equals("/head_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    hx=x;
    hy=y;
  }

  if (v.equals("/rightelbow_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    rex=x;
    rey=y;
  }

  if (v.equals("/leftelbow_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    lex=x;
    ley=y;
  }

  if (v.equals("/rightfoot_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    rfx=x;
    rfy=y;
  }

  if (v.equals("/leftfoot_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    lfx=x;
    lfy=y;
  }

  if (v.equals("/rightknee_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    rkx=x;
    rky=y;
  }

  if (v.equals("/leftknee_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    lkx=x;
    lky=y;
  }

  if (v.equals("/torso_pos_screen")) {
    float x = theOscMessage.get(0).floatValue();  
    float y = theOscMessage.get(1).floatValue();
    tx=x;
    ty=y;
  }
}


