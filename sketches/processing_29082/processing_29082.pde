
import processing.opengl.*;
PImage im;
float xoff, xoff2, incX, incY, sz;

void setup(){
 size(500,450, OPENGL);

im = loadImage("angel.jpeg");
//im.resize(im.width/2, im.height/2);

}

void draw(){
background(0); 
image(im, 0, 0, im.width, im.height); 


im.loadPixels();
 incX=abs(width/2-mouseX-40);
 incY=abs(height/2-mouseY-40);
 incX =map(incX, 0, width, 10,30);
 incY =map(incY, 0, height, 10,30);

for(int i=0; i<im.width; i+=incX){
 for (int j=0; j<im.height; j+=incY){
 int pColor =  im.get(i,j);
 //float sz = brightness(pColor)/10;
  xoff = xoff + 0.00007;
  xoff2= xoff2+1;
  sz = 4+(dist(mouseX,mouseY,i,j)*noise(xoff)*50)/50;
  fill(pColor,200);
  noStroke();
  ellipse(i+noise(xoff2),j+noise(xoff2), sz, sz);
   
 }//j
}//i


}

