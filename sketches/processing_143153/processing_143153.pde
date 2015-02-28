
/*
Konkuk University
 SOS iDesign
 Name: Joo Yong Gill
 ID: 201420108
 */

void setup() {
  size (600, 600);
  setupAudio();
  smooth();
  colorMode(RGB, 255);
  background(255);
}

void draw() {
  println(mouseX + " : " + mouseY);

  fill(237, 0, 0);
  triangle (242, 145, 286, 192, 317, 178);
  triangle (303, 183, 345, 184, 290, 129);

  stroke (0);
  fill(237, 0, 0);
  strokeWeight (4);
  ellipse (319, 310, 280, 280);

  fill (255, 184, 72);
  noStroke();
  ellipse (319, 414, 150, 75);

  float mx1 = map (mouseX, 0, width, 384, 423);
  float mx2 = map (mouseX, 0, width, 324, 366);
  float my = map (mouseY, 0, height, 316, 330);

  fill (255);
  stroke(0);
  strokeWeight(2);
  ellipse (346, 318, 55, 55);
  ellipse (406, 318, 50, 50);

  strokeWeight (4);
  fill (93, 66, 0);
  ellipse (370, 391, 62, 62);

  fill (255, 228, 0);
  triangle (377, 333, 329, 380, 435, 381);
  triangle (329, 385, 361, 437, 409, 406);

  noStroke();
  fill(0, 0, 0);
  quad(313, 267, 301, 292, 378, 316, 381, 308);
  quad(381, 308, 380, 316, 454, 295, 438, 269);
  ellipse (mx1, my, 8, 8);
  ellipse (mx2, my, 8, 8);

  fill (0);
  quad(155, 278, 181, 308, 183, 295, 168, 269);
  triangle (137, 287, 133, 309, 180, 305);
  quad(147, 327, 161, 337, 186, 309, 176, 304);

  if (mousePressed) {
    fill (random(255), 0, 0);
    quad(155, 278, 181, 308, 183, 295, 168, 269);
    triangle (137, 287, 133, 309, 180, 305);
    quad(147, 327, 161, 337, 186, 309, 176, 304);

    stroke(0);
    strokeWeight(1);

    fill (171, 242, 0);
    ellipse (mouseX, mouseY, 70, 70);

    fill (255);
    ellipse (mouseX-15, mouseY, 20, 20);
    ellipse (mouseX+15, mouseY, 20, 20);

    fill (0);
    ellipse (mouseX-15, mouseY, 10, 10);
    ellipse (mouseX+15, mouseY, 10, 10);

    fill (29, 219, 22);
    ellipse (mouseX, mouseY+15, 30, 15);

    fill (255);
    ellipse (mouseX+10, mouseY+15, 5, 5);
    ellipse (mouseX-10, mouseY+15, 5, 5);

    fill (random(255), random(255), random(255));
    triangle (377, 333, 329, 380, 435, 381);
    triangle (329, 385, 361, 437, 409, 406);
  }

  getVolume(); 
  float Y = map(volume, 0, 200, 2, 100); 
  float X = map(volume, 0, 200, 2, 200); 
  noStroke();
  fill(255, 220, 0);
  translate(width, height);
  ellipse(0, 0, X-50, Y-50);
}

void keyPressed() {
  background(random(255), random(255), random(255));
}

import ddf.minim.*;

Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0;

void setupAudio() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
}

void getVolume() {
  volumeF = in.right.level()*1000;
  volume = 0.8*volume + 0.8*volumeF;
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}/*
Konkuk University
 SOS iDesign
 
 Name: Joo Yong Gill
 ID: 201420108
 */

PImage img;

void setup() {
  size (600, 600);
  setupAudio();
  smooth();
  colorMode(RGB, 255);
  background(255);
}

void draw() {
  println(mouseX + " : " + mouseY);

  fill(237, 0, 0);
  triangle (242, 145, 286, 192, 317, 178);
  triangle (303, 183, 345, 184, 290, 129);

  stroke (0);
  fill(237, 0, 0);
  strokeWeight (4);
  ellipse (319, 310, 280, 280);

  fill (255, 184, 72);
  noStroke();
  ellipse (319, 414, 150, 75);

  float mx1 = map (mouseX, 0, width, 384, 423);
  float mx2 = map (mouseX, 0, width, 324, 366);
  float my = map (mouseY, 0, height, 316, 330);

  fill (255);
  stroke(0);
  strokeWeight(2);
  ellipse (346, 318, 55, 55);
  ellipse (406, 318, 50, 50);

  strokeWeight (4);
  fill (93, 66, 0);
  ellipse (370, 391, 62, 62);

  fill (255, 228, 0);
  triangle (377, 333, 329, 380, 435, 381);
  triangle (329, 385, 361, 437, 409, 406);

  noStroke();
  fill(0, 0, 0);
  quad(313, 267, 301, 292, 378, 316, 381, 308);
  quad(381, 308, 380, 316, 454, 295, 438, 269);

  ellipse (mx1, my, 8, 8);
  ellipse (mx2, my, 8, 8);

  fill (0);
  quad(155, 278, 181, 308, 183, 295, 168, 269);
  triangle (137, 287, 133, 309, 180, 305);
  quad(147, 327, 161, 337, 186, 309, 176, 304);

  if (mousePressed) {
    fill (random(255), 0, 0);
    quad(155, 278, 181, 308, 183, 295, 168, 269);
    triangle (137, 287, 133, 309, 180, 305);
    quad(147, 327, 161, 337, 186, 309, 176, 304);

    stroke(0);
    strokeWeight(1);

    fill (171, 242, 0);
    ellipse (mouseX, mouseY, 70, 70);

    fill (255);
    ellipse (mouseX-15, mouseY, 20, 20);
    ellipse (mouseX+15, mouseY, 20, 20);

    fill (0);
    ellipse (mouseX-15, mouseY, 10, 10);
    ellipse (mouseX+15, mouseY, 10, 10);

    fill (29, 219, 22);
    ellipse (mouseX, mouseY+15, 30, 15);

    fill (255);
    ellipse (mouseX+10, mouseY+15, 5, 5);
    ellipse (mouseX-10, mouseY+15, 5, 5);

    fill (random(255), random(255), random(255));
    triangle (377, 333, 329, 380, 435, 381);
    triangle (329, 385, 361, 437, 409, 406);
  }

  getVolume(); 
  float Y = map(volume, 0, 200, 2, 100); 
  float X = map(volume, 0, 200, 2, 200);
  noStroke();
  fill(255, 220, 0);
  translate(width, height);
  ellipse(0, 0, X-50, Y-50);
}

void keyPressed() {
  background(random(255), random(255), random(255));
}

import ddf.minim.*;

Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0;

void setupAudio() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
}

void getVolume() {
  volumeF = in.right.level()*1000;
  volume = 0.8*volume + 0.8*volumeF; 
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
