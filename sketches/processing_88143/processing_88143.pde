
float v; 
float easing = 0.1;  // Between 0 and 1, higher means sharper movement
float volumeScalar = 875;  // Higher means more movement
boolean sound = true;  // set to false to test with the mouse, true for sound
void setup() {
  size(854, 480);
  smooth();
  if (sound) setupVolume();
}
void draw() {
  background(255);
  if (sound) getVolume();
  else v = mouseX; 
  testFace();
}
//wav mix from
//http://beta.freesound.org/people/Questiion/sounds/166392/
//http://beta.freesound.org/people/vataaa/sounds/148873/

String name = "Diana Willits";
void testFace() {

  int head;
  float speakercircy;
  float speakercircx;
  float circwidth;
  float movewidth;

  background(0);
  ////////////////////////////////////////LEFT EAR/////////////////////////////////////////////
  drawSpeaker(180, 258);
  
  //////////////////////////////////////RIGHT EAR//////////////////////////////////////////////
  drawSpeaker(width-180,258);

  //////////////////////////////////////MIDDLEHEAD/////////////////////////////////////////////
  fill(150);
  noStroke();
  head = width/4;
  ellipse(width/2, height/2, head, head);

  //left eye
  fill(240);
  ellipse(width/2-head/6, height/2, 30, 30);

  //right eye
  fill(0);
  rectMode(CENTER);
  rect(width/2+head/6, height/2, 30, 30);

  //eyebrow
  rectMode(CENTER);
  rect(width/2, height/2.5, 100, 30);

  //TRUNK
  fill(150);
  triangle(380, 320, 427, 428, 474, 320);  

  ellipse(width/2, 425, v/3, v/3);        //circle trunk end
  fill(0);
  ellipse(width/2-v/30, 425, v/9, v/9);      //tiny left circle on trunk
  ellipse(width/2+v/30, 425, v/9, v/9);      //tiny right circle on trunk

  //////////////////////////////////////CREDITS//////////////////////////////////////////////
  fill(255);
  text(name, 20, height-20);
  fill(255);
}


  ///////////////////////////////////VOID drawSpeaker////////////////////////////////////////
void drawSpeaker(float x, float y) {
  pushMatrix();
  translate(x,y);
  
  float speakercircy;
  float speakercircx;
  float circwidth;
  float movewidth;
  float rightearplacement;
 
  noStroke();
  fill(150);
  rightearplacement = width/1.05-140+v/17;

  //right ear
  ellipse(0, 0, width/3+v/2, width/3+v/2);

  //SPEAKERS (from big to small)
  //big gray
  fill(90);
  noStroke();
  rect(0, 0, width/5+v/2.4, width/5+v/2.4);

  //big white square
  fill(240);
  noStroke();
  rect(0,0, width/6+v/2.4, width/6+v/2.4);

  //RIGHT SPEAKERCIRCLES
  speakercircx = width/2+179.5+width/8+v/50;
  speakercircy = height/2.38;
  circwidth = 180; //width/32+v/7;
  fill(0);


  scale(v/700);
  
  //middle speaker grid
  stroke(10);
  fill(180);
  rect(0, 0, circwidth*4+v/700, circwidth*4+v/700);

  fill(0);
  //1st row speakercircles
  ellipse(-270, -270, circwidth, circwidth);  
  ellipse(-90, -270, circwidth, circwidth); 
  ellipse(90, -270, circwidth, circwidth);
  ellipse(270, -270, circwidth, circwidth);  

  //2nd row speakercircles
  ellipse(-270, -270+circwidth, circwidth, circwidth);  
  ellipse(-90, -270+circwidth, circwidth, circwidth); 
  ellipse(90, -270+circwidth, circwidth, circwidth);
  ellipse(270, -270+circwidth, circwidth, circwidth);  

  //3rd row speakercircles
  ellipse(-270, circwidth/2, circwidth, circwidth);  
  ellipse(-90, circwidth/2, circwidth, circwidth); 
  ellipse(90, circwidth/2, circwidth, circwidth);
  ellipse(270, circwidth/2, circwidth, circwidth);  

  //4th row speakercircles
  ellipse(-270, 270, circwidth, circwidth);  
  ellipse(-90, 270, circwidth, circwidth); 
  ellipse(90, 270, circwidth, circwidth);
  ellipse(270, 270, circwidth, circwidth);  


  popMatrix();
}

import ddf.minim.*;
Minim minim;
//AudioInput in;
AudioPlayer in;
float s_volume;
float volume;
void setupVolume() {
  minim = new Minim(this);
  //in = minim.getLineIn(Minim.MONO, 512);
  in = minim.loadFile("elephant.wav", 2048);  // your sound filename goes here!
  in.play();
}
void getVolume() {
  s_volume = in.right.level() * volumeScalar;
  // println(s_volume);
  float d_volume = s_volume - volume;
  if (abs(d_volume) > 1) {
    volume += d_volume * easing;
  }
 
  v = volume;
}
void stop() {
  in.close();
  minim.stop();
  super.stop();
}


