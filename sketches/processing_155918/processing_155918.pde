
float r;
float g;
float b;
float angle;
int circleX=0;
int circleY=45;
int circleX1=30;
int circleY1=40;
int circleX2=15;
int circleY2=45;
int circleX3=14;
int circleY3=33;

void setup() {
  size(480,300);
 PImage img;
img = loadImage("Untitled-1.jpg");
background(img);
 rectMode(CENTER);

}

void draw(){
  
PImage img;
img = loadImage("Untitled-1.jpg");
background(img);

  noStroke();
  fill(255,193,193);
  ellipse(240,170,mouseX,mouseY);
  
  noStroke();
  fill(205,155,155);
  rect(240,190,50,30);
  
  fill(0);
  rect(230,190,8,17);
  rect(250,190,8,17);
  
  stroke(10);
 fill(255);
  ellipse(200,150,35,35);
  
  stroke(10);
 fill(255);
  ellipse(270,150,35,35);
  
  noStroke();
  fill(0);
  ellipse(205,155,10,10);
  
  noStroke();
  fill(0);
  ellipse(265,155,10,10);
  
  noStroke();
  fill(135,206,250);
   ellipse(circleX,circleY,32,32);
     circleX = circleX + 1;
  
  noStroke();
  fill(135,206,250);
   ellipse(circleX1,circleY1,32,32);
     circleX1 = circleX1 + 1;
     
    noStroke();
  fill(135,206,250);
   ellipse(circleX2,circleY2,40,40);
     circleX2 = circleX2 + 1;
     
    noStroke();
  fill(135,206,250);
   ellipse(circleX3,circleY3,30,30);
     circleX3 = circleX3 + 1;
     
angle+=0.01;
  translate(425, 250);
  rotate(angle);
  fill(mouseX,mouseY,mouseY,255);
  rect(0, 0, 30, 30);
  
 
  


}


