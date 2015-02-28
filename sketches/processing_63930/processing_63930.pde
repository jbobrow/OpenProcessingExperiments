



import processing.video.*;
 
Capture video;
//Capture videoB;
color trackColor;


void setup()
{
 
  size(400,400, P3D);
  frameRate(30);
  colorMode(HSB, 255, 255, 255, 100);
    
   video = new Capture(this, 240,180);
trackColor = color(255, 0, 0);
 
 
 
 

  
  noFill();
  smooth();
  strokeWeight(4.0);
  stroke(0);
}
 
 void captureEvent(Capture camera)
{
  video.read();
  
}

 


void draw()
{
  background(255);
  int angle=10;
  int po=5;
  int kan=60;
  translate(200, 200);

 

 
  for (int i=0; i<36; i++) {
    noStroke();
    fill(i*10, 360, 360);
 
 
 
 pushMatrix();
rotate(radians(random(10,200)));
 rect(200,200 ,50, 50);
 popMatrix();
 
 
    rotateX(radians(mouseX));
    pushMatrix();
    rotate(radians(i*kan));
    translate(180, 0);
 image(video, 0, -300);
 
    rect(0,0, 10,10);
 
    popMatrix();
    frameRate(40);
    rotateY(radians(mouseY));
    pushMatrix();
    rotateX(random(200,800));
    //rotate(radians(i*angle));
    translate(90, 0);
    rect(0,0, 10, 10);
    //translate(10, 0);
    rect(0, 0, 10,10);
    translate(20, 0);
    rect(0, 0, 10, 10);
    translate(5, 0);
    rect(0, 0, 10, 10);
    //image(video, 0, -300);
    popMatrix();
    
     pushMatrix();
//rectMode(CENTER);

 rect(0,0,50,50);
 popMatrix();
    
    
    
  }
 
   loadPixels();
  for (int i=0; i<36; i++)
    rotate(radians(i*angle));
  translate(50, 0);  
  

 
}
 
void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}
 


