
//Ian L.: DMA252A - Assignment #2, Part A - Collage Generator (blue boxes & blue and purple post-it notes)

float lastax = random(640);
float lastay = random(480);
float lastbx = random(640);
float lastby = random(480);
float lastgx = random(640);
float lastgy = random(480);

void setup() {
  size(640,480,P3D);
  background(#FFFFFF);
  smooth();
}

void draw(){

  noStroke();
  fill(#FFFFFF,100);
  rect(0,0, width, height);
  noFill();
  
translate(width/4, height/4);

for(int i=0; i<90; i+=10){  
rotateY(map(i,0,width, -PI, PI));
rotateX(map(0,i,height, -PI, PI));

  float ax = random(640);
  float ay = random(480);
  float bx = random(640);
  float by = random(480);
  float gx = random(640);
  float gy = random(480);

 stroke(#FFFFFF);  
  strokeWeight(0.5);
  fill(#0099FF);
  translate(gx, gy, 0); 
  rotateY(0.5);
  rotateX(0.5);
  box(20,20,20);
  stroke(#FFFFFF);  
  strokeWeight(1);
  line(gx, gy, lastgx, lastgy);

PImage img;

  img = loadImage("blue.png");
  image(img, ax, ay, 20, 20);
  
  img = loadImage("purple.png");
  image(img, bx, by, 20, 20);

  lastgx = gx;
  lastgy = gy;
}
}




