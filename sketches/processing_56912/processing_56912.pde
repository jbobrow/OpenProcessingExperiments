


import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
/**
 * Zoom. 
 * 
 * Move the cursor over the image to alter its position. Click and press
 * the mouse to zoom and set the density of the matrix by typing numbers 1-5.
 * This program displays a series of lines with their heights corresponding to 
 * a color value read from an image. 
 */

PImage img;
PImage blurimg;
//boolean onetime = true;
int[][] imgPixels;
float sval = 1.0;
float nmx, nmy;
int res = 5;
float getloc(float val,int wd,String what){
  
float  retval = 0;
if (what=="X"){
  
}
 return retval; 
}
void maketile(PVector A,PVector B,PVector C,PVector D,int wd){
  

  
}
void setup() 
{
  size(640, 360, P3D);
  //smooth();
  cam = new PeasyCam (this,width/2);
  noFill();
  stroke(255);
  img = loadImage("sky.png");
   blurimg = loadImage("sky.png");
   img.resize(img.width/2,img.height/2);
  blurimg.resize(blurimg.width/2,blurimg.height/2); 
   blurimg.filter(BLUR,2);
  imgPixels = new int[img.width][img.height];
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      imgPixels[j][i] = img.get(j, i);
    }
  }
 
}

void draw() 
{
   translate(100,0);
  background(0);

  nmx = nmx + (mouseX-nmx)/20; 
  nmy += (mouseY-nmy)/20; 

  if(mousePressed) { 
    sval += 0.005; 
  } 
  else {
    sval -= 0.01; 
  }

//  sval = constrain(sval, 1.0, 2.5);
//
//  translate(width/2 + nmx * sval-100, height/2 + nmy*sval - 200, -50);
//  scale(sval);
//  rotateZ(PI/9 - sval + 1.0);
//  rotateX(PI/sval/8 - 0.125);
//  rotateY(sval/8 - 0.125);

  translate(-width/2, -height/2, 0);

//  for (int i = 0; i < img.height; i += res) {
 //   for (int j = 0; j < img.width; j += res) {
   int _w = img.width;
   float _z =0;
   float _j =0;
   for (int k=0;k<img.pixels.length;k++){
     int i = k/_w;
     int j = k-(i*_w);
      int pos = i+_w*j;
      float rr = (imgPixels[j][i])>>16&255; 
      float gg = (imgPixels[j][i])>>8&255;
      float bb = (imgPixels[j][i])&255;
      color c = blurimg.get(i,j);
      float tt = c>>16&255;
     // float tt = rr+gg+bb;
      stroke(rr, gg, bb,rr);
     // point(i,j,tt/10);
     float zz = tt/10;
     if(j<_w && j>1){
      line(j,i,_z,_j,i,_z+1);

     }
          _j = j;
          _z = zz; 
          
     // line(i, j, tt/10-20, i, j, tt/10 );
 //   }
  }
}

void keyPressed() {
  if(key == '1') {
    res = 1;
  } 
  else if (key == '2') {
    res = 2; 
  } 
  else if (key == '3') {
    res = 3;
  } 
  else if (key == '4') {
    res = 4;
  } 
  else if (key == '5') {
    res = 5;
  }
}







