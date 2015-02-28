
float myrect;
float v; 
float easing = 0.9;  // Between 0 and 1, higher means sharper movement
float volumeScalar = 500;  // Higher means more movement
boolean sound = true;  // set to false to test with the mouse, true for sound
void setup() {
  size(854, 480);
  smooth();
  if (sound )setupVolume();
  myrect=165;
}
void draw() {
  background(255);
  if (sound) getVolume();
  if (sound == false) {
    v = mouseX;
  }
  testFace();
}


String name = "Brian Washington";//: Fire Prelude Kevin MacLeod(incompetech.com)";
void testFace() {

  background(map(v, 0, width, 255, 0));

  translate(width/4+X, height/4);

  int X = 25;

  // Face
  noStroke();
  fill(255, 0, 0);
  beginShape ();
  pushMatrix();
  vertex (72.28-v/60, 63.44-v/10);
  vertex (91.19, 73.62);
  vertex (105.01-v/80, 64.89-v/10);
  vertex (114.11, 75.44);
  vertex (122.48-v/100, 64.89-v/10);
  vertex (133.39, 71.07);
  vertex (141.75-v/120, 67.44-v/10);
  vertex (147.21, 71.07);
  vertex (172.31-v/150, 54-v/10);
  vertex (193.09, 79.44);
  vertex (203.23+v/200, 71.07-v/10);
  vertex (210.5, 75.8);
  vertex (224.32+v/150, 66.71-v/10);
  vertex (238.82, 46.32);
  vertex (248.69+v/100, 74.35-v/10);
  vertex (263.24, 64.89);
  vertex (275.97+v/90, 65.62-v/10);
  vertex (295.98, 63.8);
  vertex (307.26+v/80, 63.8-v/22);
  popMatrix();
  vertex (283.35, 97.63);
  vertex (339.99, 97.63);
  vertex (339.99, 127.46);
  vertex (283.25, 127.46);
  bezierVertex(283, 180, 280, 228, 364, 266.04);
  //bezierVertex (width/2+(283/2-width/4),height/2+(180/2-height/4),width/2+(280/2-width/4),height/2+(228/2-height/4),364,266.04);
  vertex (10.31, 266.04);
  bezierVertex (90, 217, 90, 220, 91.46, 125.57);
  vertex(34.74, 125.57);
  vertex (34.83, 97.67);
  vertex (91.19, 97.63);
  endShape (CLOSE);
  //fill(0);
  //ellipse(0, 0, 400+v/3, 400+v/3);
  //fill(255,0,0);

  // Eyes

  stroke(141, 198, 63);
  strokeWeight(6);
  line(161.25, 203.29, 214.73, 203.29); 


  beginShape();
  vertex(109.02, 92.17);
  vertex(114.47, 105.99);
  vertex(119.93, 97.67);
  vertex(127.2, 101.99);
  vertex(134.48, 105.99);
  vertex(139.57, 97.67);
  vertex(143.57, 88.9);
  vertex(151.94, 92.45);
  vertex(155.21, 112.45);
  vertex(165.55, 99.45);
  vertex(165.55, 92.9);
  vertex(174.85, 103.81);
  vertex(183.58, 102.17);
  vertex(190.68, 97.67);
  vertex(198.86, 101.17);
  vertex(209.04, 97.67);
  vertex(213.05, 101.81);
  vertex(221.05, 92.54);
  vertex(225.78, 101.87);
  vertex(233.05, 90.01);
  vertex(238.87, 101.27);
  vertex(250.15, 101.63);
  vertex(265.79, 101.63);
  endShape();
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(180));
  noStroke();
  fill(255, 0, 0);
  rect(155, 120, myrect, 35);
  if (myrect > .2) {
    myrect=myrect-.07;
  }
  popMatrix();

  pushMatrix();
  translate(width/4-X, height/4);

  // Mouth
  fill(255, 0, 0);
  noStroke();
  ellipse(-90, 70, 10+v/2, 10+v/2);
  ellipse(90, 70, 10+v/2, 10+v/2);
  fill(141, 198, 63);
  ellipse(0, 82, v/2, v/2);
  // Credits
  fill(150);
  text(name, -width/2+40, height/2-20);
  fill(255);
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
  in = minim.loadFile("heart.wav", 2048);  // your sound filename goes here!
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


