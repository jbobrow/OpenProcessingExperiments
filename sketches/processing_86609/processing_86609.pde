
/* @pjs preload = "Will.JPG"; */                                                                    
                                             
color c = color(255, 0, 0, 0);
float x = 200;
float y = 148;
float speed = 1;
PImage img;


void setup(){
  size(400, 400);
  img = loadImage("Will.JPG");
  tint(255,200);
 }
   
void draw(){
  image(img, 0,0);
   strokeWeight(5);
   stroke(250,210,101);
  beginShape(); //bottom portion of face
   fill(250,218,129);
   vertex(180, 240);
   vertex(180, 290);
   vertex(220, 290);
   vertex(220, 240);
  endShape();
    strokeWeight(5);
    stroke(250,210,101);
  beginShape(); 
    fill(250,218,129);
    arc(200,150,150,200, 0, PI);
  endShape();
  strokeWeight(2);
    stroke(0);
  beginShape();
    fill(250,101,136);//mouth
    arc(200,220,45,50, 0, PI);
  endShape();
    stroke(0);//left eye
    fill(255);
  ellipse(180, 180, 20, 30);
  point(180, 180);
  fill(255);//right eye
  ellipse(220, 180, 20, 30);
  point(220, 180);
  fill(14,75,16);
  rectMode(CENTER);
  rect(200, 400, 200, 220);
  move();
  display();
 }
 
 void move(){
   x = x + speed;
   if (x > width){
     x = 0;
   }
 }
 
 void display(){
  beginShape();//cranium
  strokeWeight(5);
  stroke(250,210,101);
  fill(250,218,129);
  arc(x,y,150,150, -PI, 0);
  endShape();
  stroke(252, 172, 10);//hair
  fill(252, 172, 10);
  ellipse(x, 100, 113, 70);
  smooth();
  triangle(x+15, 70, x+90, 120, x, 100);
  triangle(x-20, 80, x+80, 130, x+10, 120);
  triangle(x-30, 100, x+80, 150, x, 140);
  }


