
//image transformations
//ethan dale
//math, programming & art CCA SP2011 
//P111
PImage img;

void setup() {

size(600,120);
img = loadImage("motorcycle.png");
}

void draw(){

pushMatrix();
image(img, 0,0);
translate(0,0);
rotate(PI);
translate(-190,-105);
image(img, 0,0);
popMatrix();

pushMatrix();
image(img, 85,0);
translate(0,0);
rotate(PI);
translate(-275,-105);
image(img, 0,0);
popMatrix();

pushMatrix();
image(img, 85*2,0);
translate(0,0);
rotate(PI);
translate(-350,-105);
image(img, 0,0);
popMatrix();

pushMatrix();
image(img, 85*3,0);
translate(0,0);
rotate(PI);
translate(-440,-105);
image(img, 0,0);
popMatrix();

pushMatrix();
image(img, 85*4,0);
translate(0,0);
rotate(PI);
translate(-525,-105);
image(img, 0,0);
popMatrix();


noLoop();
}

