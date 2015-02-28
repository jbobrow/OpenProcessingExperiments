
float v; 
float easing = 0.2;  // Between 0 and 1, higher means sharper movement
float volumeScalar = 3000;  // Higher means more movement
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
String name = "Juno Lee";
void testFace() {
 
 background(255-v/10);
  //Cloud base
  noStroke();
  fill(180-v/5);
  translate(width/2, height/2);
  ellipse(0, 0, 400, 200);//Base Ellipse
  ellipse(80, 100, 90+v/10, 90+v/10);// Bottom Right
  ellipse(150, 200/2, 100+v/15, 100+v/15);//2
  ellipse(0, 200/2, 100+v/10, 100+v/10);//3
  ellipse(-100, 200/2, 100+v/15, 100+v/15);//4
  ellipse(-50, 130, 50+v/10, 50+v/10);//small almost bottom middle left
  ellipse(-170, 80, 75+v/15, 75+v/15);
  ellipse(-200, 100/2, 100+v/10, 100+v/10);//Bottom Left
  ellipse(-200, 0, 75+v/15, 75+v/15);//6
  ellipse(-180, -70, 80+v/10, 80+v/10);//Top Left
  ellipse(-110, -60, 75+v/15, 75+v/15);//
  ellipse(-70, -80, 75+v/10, 75+v/10);//
  ellipse(-20, -80, 100+v/15, 100+v/15);//Top Middle
  ellipse(60, -100, 75+v/10, 75+v/10);
  ellipse(100, -70, 75+v/15, 75+v/15);
  ellipse(60, -100, 75+v/10, 75+v/10);
  ellipse(140, -80, 75+v/15, 75+v/15);
  ellipse(180, -40, 75+v/10, 75+v/10);//Top Right
  ellipse(200, 20, 80+v/15, 90+v/15);//Right
  ellipse(200, 70, 70+v/10, 70+v/10);
 
  //Cloud Face
 
  noStroke();
  fill(255-v/10);
  pushMatrix();
  translate(-80, -80);
  rotate(radians(v/30));
  rectMode(CENTER);
  rect(15, 0, 70+v/40, 5+v/40);
  popMatrix();
  pushMatrix();
  translate(80, -80);
  rotate(radians(-v/30));
  rect(-15, 0, 70+v/40, 5+v/40);
  popMatrix();
 
  ellipse(-70, -40+v/40, 5+v/40, 40+v/40);//left eye
  ellipse(70, -40+v/40, 5+v/40, 40+v/40);//right eye
  rectMode(CORNER);
 
  rect(-80, 40-v/100, 160, 5+v/7);//mouth

  
  
  // Credits
  fill(150);
  text(name, -width/2+20, height/2-20);
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
  in = minim.loadFile("Shouting5.wav", 2048);  // your sound filename goes here!
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


