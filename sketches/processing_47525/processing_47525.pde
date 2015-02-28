
PImage im;
 
void setup(){
  size (600,670);
  im =loadImage("portrait.jpg");
  im.resize(im.width,im.height);
}
void draw(){
  background(0);
   
 //image (im,0,0,im.width,im.height);
   
 im.loadPixels();
 
 
  for (int i =0;i<im.width;i+=10){
     
  for (int j =0;j<im.height;j+=12){
 pushMatrix();
    int pColor = im.get (i,j);
     
     
 
// float d= map (dist(mouseX,mouseY,i,j),0,width,10,0);
 
 float ang = atan2 (j-mouseY,i-mouseX);
 
  noStroke();
  fill (pColor);
  rectMode (RIGHT);
  translate (i,j);
  rotate (ang);
  rect(0,0,9,9);
  popMatrix();
 
} }
}



