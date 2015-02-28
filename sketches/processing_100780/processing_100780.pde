


import processing.video.*;
Movie myMovie;
PImage img;
PImage face;
PImage r1;
PImage r2;
PImage r3;
PImage eyes;
PImage pupil;


int circle_x;
int circle_y; //where is the circle? x and y position
int circle_diameter = 300; //how wide and tall the circle is.
boolean overCircle = false;
boolean showimage = false;

float incr = 0.01;
float rot = PI/2;
float offset = 0;
float easing = 0.05;



void setup(){
  smooth();
  size(600,600,P2D);
  background(245);
  rectMode(CENTER);
  img = loadImage("HEAD.png");
  r1= loadImage("r1.png");
  r2= loadImage("r2.png");
  r3= loadImage("r3.png");
  face= loadImage("circle.png");
  eyes= loadImage("eyes.png");
  pupil= loadImage("pupil.png");
  myMovie = new Movie(this, "rainbow.m4v");

  
  circle_x = width/2;
  circle_y = height/2;

}

void draw(){
  imageMode(CORNERS);
 
 image(face,0,0);

  //image(myMovie, 0, 0);
   circle_x = 300;
  circle_y = 300;
  
 
  
  
  
  if ( dist(circle_x, circle_y, mouseX, mouseY) < circle_diameter/2) {
   
   pushMatrix();
  translate(300, 300);
  rotate(rot);
  imageMode(CENTER);
  image(r1,0,0);
   popMatrix();
   rot =  dist(mouseX, 0, 0,0);
 
 
 
  pushMatrix();
  translate(300, 300);
  rotate(rot);
  imageMode(CENTER);
  image(r2,0,0);
  popMatrix();
   rot =  dist(mouseX-100, 0, 0,0);
   
   pushMatrix();
  translate(300, 300);
  rotate(rot);
  imageMode(CENTER);
   image(r3,0,0);
   

  
  myMovie.play();
  
   popMatrix();
   rot =  dist(mouseY, 0, 0,0);
   
   
   
   
    if (mousePressed){ image(myMovie, 205,305);
   
    myMovie.play();

  }
   
   overCircle=true;
   
   
   
   
   
     
   } else {
overCircle=false;
 image(face,0,0);
  myMovie.stop();
    };
    
 
    
    
   imageMode(CORNERS);
   image(img,0,0);
   image(eyes,0,0);
   
   imageMode(CENTER);
  
   float ax = map (mouseX, 0, width, 290, 310);
  fill(0,0,0);
  image(pupil, ax,300);
}

