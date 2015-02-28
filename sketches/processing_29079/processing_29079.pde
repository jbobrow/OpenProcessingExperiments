
import processing.opengl.*;
PImage im;
float xoff, xoff2, incX, incY, sz;
float d, y;

void setup(){
 size(600,450, P3D);

im = loadImage("angel4.jpg");
//im.resize(im.width/2, im.height/2);

}

void draw(){
background(100); 


translate(width/1.9, height/3, -300);
rotateX(y);
rotateY(d);
translate(-width/2,-height/2);

//image(im, 0, 0, im.width, im.height); 


im.loadPixels();


for(int i=0; i<im.width; i+=8){
 for (int j=0; j<im.height; j+=8){

 int pColor =  im.get(i,j);




  float d = map(dist(mouseX+10,mouseY+10, i, j), 0, width, 25, 0);
  fill (pColor);
  noStroke();
  
  //xoff = frameCount;
  xoff2 = xoff+frameCount;
  
  rectMode(CENTER);
  
  pushMatrix();
  translate(i,j);
  box(d+2*noise(xoff),d+2*noise(xoff), (brightness(pColor)-80+d/5)+noise(xoff2));
  
  popMatrix();
  
 }//j
}//i


}

void mouseDragged(){
 d=radians(mouseX*2); 
 y=radians(mouseY*2);
}

