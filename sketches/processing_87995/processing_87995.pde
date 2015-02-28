
//Learning processing.
//
//float xpos = 50;
//float ypos= 100.5;
//float rad=50;
//
import java.util.Random;
Random gen;
void setup(){
  size(400,400);
  frameRate(24);
  gen = new Random();
}

//float mean = .5;
//float stddiv = .2;
float temp;
void draw(){
float rand=(float)gen.nextGaussian();
//rand*=50;
//rand+=100;
float stddev = 80;
float mean =width/2;
float xpos = (rand*stddev)+mean;
////float xpos = width/2;
//  background(255);
//  noFill();
//  ellipse(xpos,ypos,rad,rad);
//  rad= rad+1;
////float xpos = width/2;
//  ellipse(xpos,ypos,rad+20,rad+20);
//  rad= rad+1; 
//colorMode(RGB,255);
//  float fillin = random(1);
//  colorMode(RGB,255);
//  background(255,0,0);
 // strokeWeight(abs(rand/2));
//  stroke(0);
//  fill(rand,random(100)*100,rand+rand);
//  rectMode(CENTER);
//  rect(width/2,height/2,rand,rand);
//  temp = min(temp,rand);
//  println(rand);
float alpha=1;
noStroke();
fill(0,alpha);
rectMode(CENTER);
rect(xpos,height/2,50,10);
stddev = 60;
xpos = (rand*stddev)+mean;
rect(xpos,height/2-10,50,10);
stddev = 40;
xpos = (rand*stddev)+mean;
rect(xpos,height/2-20,50,10);
stddev = 20;
xpos = (rand*stddev)+mean;
rect(xpos,height/2-30,50,10);
stddev = 10;
xpos = (rand*stddev)+mean;
rect(xpos,height/2-40,50,10);
}




