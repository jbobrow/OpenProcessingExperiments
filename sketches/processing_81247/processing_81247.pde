
PImage img1;

 void setup(){
   size (600,397);
   background(102);
   img1 = loadImage("shirt.JPG");
   image(img1,0,0);
   noStroke();  
   smooth();
   // img variable will be this image
 }
 
 void draw(){ 
  float fillColor1 = random (0,255);
  float fillColor2 = random (70,225);
  float fillColor3 = random (67,200);
  float sizex = random (10,60);
  float sizey = random (10,60);
   if(mousePressed) {
  ellipse(mouseX, mouseY, sizex, sizey);
  fill(fillColor1,fillColor2,fillColor3,100);
  } else {
   
  }
 }
 
 

