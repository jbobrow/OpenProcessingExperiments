



import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(400,400);
fill(60,0,255);
  
    minim= new Minim(this);
  player = minim.loadFile("sly.mp3");
  
}

void draw() {
       player.play();


randomSeed(0);
for(int i=1; i < 500; i++) {
 float r = random(100, 155);
stroke(r);
line(300, i, i, 500);
  
}

randomSeed(0);
for(int i=1; i < 500; i++) {
 float r = random(100, 155);
  stroke(r);
  line(300, i, i, 300);
  
}


randomSeed(0);
for(int i=1; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  line(300, 400, i, i);
  
}

randomSeed(0);
for(int i=1; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  rect(300, i, i, 300);
 
}


randomSeed(0);
for(int i=1; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(100, i, i, 100);
 
}

randomSeed(0);
for(int i=1; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(i, i, i, i);
 
}

randomSeed(0);
for(int i=1; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(i, i, 30, i);
 
}

randomSeed(0);
for(int i=1; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(i, 100, 70, 90);
 
}

randomSeed(0);
for(int i=10; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(i, i, 270, 340);
 
}

randomSeed(0);
for(int i=1; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(i, 0, 80, 90); //Very top upper Speed lines
 
}

randomSeed(0);
for(int i=1; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(i, 170, 70, 40); // Lower Horizontal // Speed lines
 
}

randomSeed(0);
for(int i=1; i < 500; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(i, 70, 70, 40); // upper Horizontal// speed lines
 
}

randomSeed(0);
for(int i=1; i < 200; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(30, i, 40, 10); // First Verticle Cylinder // Bass strum 1
 
}

randomSeed(0);
for(int i=1; i < 100; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(90, i, 20, 10); // First Verticle Cylinder // Bass strum 2
 
}

randomSeed(0);
for(int i=1; i < 120; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(120, i, 20, 10); // First Verticle Cylinder // Bass strum 3
 
}

randomSeed(0);
for(int i=1; i < 150; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(150, i, 20, 10); // First Verticle Cylinder // Bass strum 4
 
}

//randomSeed(0);
for(int i=1; i < 200; i++) {
  float r = random(100, 155);
  stroke(r);
  ellipse(200, i, 20, 10); // First Verticle Cylinder // Bass strum 5
 
}
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}



//The original code was taken from a processing website e and heavily modified...Heavily.

