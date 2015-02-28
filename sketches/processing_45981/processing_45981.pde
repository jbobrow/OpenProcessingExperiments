
import netscape.javascript.*;

PImage img1,img2,img3;
 
void setup(){
  size (620,430);
  background(245,245,245);
  img3=loadImage("nuvem.png");
  img1=loadImage("Tree_Silhouettes_clip_art_hight.png");
  img2=loadImage("maca.png");
  image(img3,0,0);
  image(img1,0,0);
  
  PFont fonte1;
fonte1=loadFont("Bauhaus93-48.vlw");
  textFont(fonte1); 
  }
  
void draw(){
  noStroke();
  fill(0,10,255);
  textSize(60);
  text("Y",200,400);
  textSize(30);
  noStroke();
  text("   ou CAN change",200,400);
  textSize(30);  
  fill(255);
  text("      The World",205,425);
  textSize(50);
  }

void mousePressed(){
 //tint(random(245),random(245),random(425));
 image(img2,mouseX,mouseY,50,50); 
 }

