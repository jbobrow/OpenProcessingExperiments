

/* @pjs preload="beer-icon.png"; */
int s;
int i;
float v, inc;
int x,y;
PImage img;


void setup(){
  size(480,480);
  background(255);
}

void draw(){
  img =loadImage("beer-icon.png");
  fill(255);
 noStroke(); 
 rect(0,0,480,480);
  noStroke();
  
  fill(150);
  quad(225,135,220,177,260,177,255,135);
  rect(200,180,80,100);
  x=mouseX;
  y=mouseY;
  noFill();
  stroke(170);
  strokeWeight(10);
  
  bezier(200,180,x,180,0,y,x,y);
  bezier(280,180,480-x,180,480,y,x,y);
  ellipse(x-12,y,8,8);
  ellipse(x+12,y,8,8);
  line(210,280,210,350);
  line(270,280,270,350);
  quad(200,350,190,360,215,360,215,350);
  quad(280,350,290,360,265,360,265,350);
  image(img,x-20,y-20,40,40);
  
  
}
  


