
PFont f1;
float a=170;
float b=1;
PImage img;

void setup(){
  size(500,500);
  background(0);
  smooth();
  f1=createFont("verdana",100);
  textSize(26);
  img=loadImage("sad_man.png");
}

void draw(){
  noStroke();
  fill(255);
  pushMatrix();
  rotate(-radians(mouseX/4.5));
  triangle(0,0,-200,700,0,800);
  popMatrix();
  
  stroke(0);
  fill(0);
  text("Just turn off the light,",a,b);
  text("and give me a break.",a,b+30);
  b=random(210,212);
  image(img,a+60,b+40);
  
  rotate(-radians(mouseX/4.5));
  noStroke();
  fill(0);
  rect(0,0,800,800);
  quad(0,0,-600,-100,-1000,500,-200,700);
  
  
  
}

