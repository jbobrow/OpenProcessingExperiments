
import controlP5.*;
import peasy.*;

/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */
ControlP5 cp;
color choosedColor;
PImage a;  // Declare variable "a" of type PImage
PImage b;
PImage c;
PImage d;
float pas;
PeasyCam cam;
float coeff;
boolean tourne1=false;
boolean tourne2=false;

void setup() {
  size(750, 548,P3D);
  background(255);
  smooth();
  noStroke();
  frameRate(100);
  coeff=.12;
  pas=5;
  cam = new PeasyCam(this, 800);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2500);
  a = loadImage("024.jpg");
  b = loadImage("025.jpg"); 
  c = loadImage("023.jpg");
  //d = loadImage("023.jpg");
  a.resize(width,height); 
  b.resize(width,height);
  c.resize(width,height);
  //d.resize(width,height);
  a.loadPixels();
  b.loadPixels();
  c.loadPixels();
  cp=new ControlP5(this);
}

void draw() {
  background(255);
//  cam.beginHUD();
//  cp.draw();
//  cam.endHUD();
  translate((-b.width)/2,(-b.height)/2,0);
  if(tourne2)image(c, 0, 0);
  for (int x = b.width-1; x>=pas; x-=pas) {
    for (int y = 0; y < b.height-pas; y+=pas ) {
      // Pixel location and color
      int loc = x + y*b.width;
      //stroke(b.pixels[loc]); 
        fill(b.pixels[loc]);        
        pushMatrix();        
        translate(x-pas,y+pas,10);
        if(tourne1){
        rotateY((float)(brightness(a.pixels[loc]))/100+(float)(frameCount)/5);
        }
        if(tourne2){
        rotateX((float)(brightness(c.pixels[loc]))/100+(float)(frameCount)/5);///d);//(b.height));   
        }
       //line(0,0,.1*brightness(b.pixels[loc]),0,0,brightness(b.pixels[loc]));
  rect(0,0,pas,pas);
        popMatrix();
    }
  }
  
}

void coeff(float value){
  coeff=value;
}
float distance(int X1,int Y1,int X2, int Y2){
  return sqrt(pow(X2-X1,2)+pow(Y2-Y1,2));
}
void mouseReleased(){
  if(mouseButton==LEFT){
  tourne1=!tourne1;
  }else
  {
    tourne2=!tourne2;
  }
}

