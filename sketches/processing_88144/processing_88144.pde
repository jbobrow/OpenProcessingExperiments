

float v; 
float easing = 0.2;  // Between 0 and 1, higher means sharper movement
float volumeScalar = 650;  // Higher means more movement
boolean sound = true;  // set to false to test with the mouse, true for sound
void setup() {
  size(854, 480);
  smooth();
  if (sound) setupVolume();
}
void draw() {
  background(255);
  if (sound) getVolume();
  if (sound == false) {
    v = mouseX; 
  }
  testFace();
}
String name = "Reshmie Punwasi";
void testFace() {
 
  background(255);
  
  //hat
  
  
  beginShape();
  fill(0);
  ellipse(427, 75, 100, 50);
  rect(360, 75, 125, 40);
   
endShape(CLOSE);
    
 
  // Face
  strokeWeight(0);
  fill(150);
  ellipse(width/2, 400, 600, 600);
 
 
 //moustaches
 

  pushMatrix();
    
    fill(0);
    translate(488, 365);
    //this is changing the origin to basically the center so the coordinates need to change
    rotate(radians(0-v*4/20));
     beginShape();
  ellipse(0, 0, 90, 90);
  arc(63, -30, 240, 195, radians(0), radians(150));
  fill(150);
  stroke(150);
  ellipse(112, -75, 182, 175);
endShape(CLOSE);
  popMatrix();


pushMatrix();   
  fill(0);
    translate(366, 365);
    rotate(radians(0+v*4/20));
beginShape();
  ellipse(0, 0, 90, 90);
  arc(-63, -30, 240, 195, radians(30), radians(180));
  fill(150);
  stroke(150);
  ellipse(-112, -75, 182, 175);
endShape(CLOSE);
  popMatrix();
 
 
 
  // Eyes
  fill(0);
  ellipse(300, 220, 20+v/10, 20+v/5);
  
  // Monocle
  smooth();
  fill(255);
  stroke(0);
  strokeWeight(5);
  ellipse(530, 200, 150, 150);
  

 
  // Mouth
  fill(0);
  ellipse(427, 440, 20+v/10, 20+v/5);
  
  
  //Eyebrow
  
  noFill();
  strokeWeight(5);
  stroke(0);
  arc(300, 230-v/5, 125, 100, radians(180), radians(360));
  
  //Monocle String
  
  noFill();
  noStroke();
  line(602, 189, 630, 204);
  line(640, 185, 640, 185);
  stroke(100);
  bezier(602, 189, 630, 204, 640, 185, 640, 485);
  
  
  // Credits
  fill(0);
  translate(427, 240);
  text("Reshmie Punwasi", -427+20, 240-20);
  fill(255);
 
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
  in = minim.loadFile("Nickteavoice.mp3", 2048);  // your sound filename goes here!
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


