
 /*****************************************
 * Assignment #6
 * Name:         Amanda Guadalupe
 * E-mail:       aguadalupe@brynmawr.edu
 * Course:       CS 110 - Section #2
 * Submitted:   4/10/2012
 * Using my wacom tablet, I manually drew the familiar faces of Prince and his cousins from the game 
 * Beautiful Katamari as my images! Four of the cousins have disguised them selves using image processing! 
 * When you press 'r', Prince does what he knows best, Roll the katamari as he and his cousins dance to the 
 * music! It's a Damacy! We love Katamari! 
 * Music slows the program down a bit, but it will load!! 
 * References were used from class examples and image processing tutorial links that were given! 
 ***********************************************/ 



float v = 1.0/9.0;
float[][] blurr = { 
  { v, v, v }, 
  { v, v, v }, 
  { v, v, v } };
float [][] edge = { { -1, -1 ,-1 },
                    { -1, 9, -1 },
                    {-1, -1, -1 } };
import ddf.minim.*; //importing music files using Minim
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioSample katamari8bit;

String headline = "We Love Katamari!";
PFont font;
float fox, foy;
float w;
float fs = 32;

float speedX, speedY;
float RollX,RollY;
void setup() {
  size(600, 600);
  minim = new Minim(this);
  katamari8bit = minim.loadSample("Cosmic Lounge.mp3");
  font = createFont("Arial",fs, true);
  textAlign(CENTER);
  fox = width/2;
  foy = height/2;
  speedX = 3.0;
  speedY = 0.6;
  RollX = .90;
  RollY = .25;
  
   imageMode(CENTER);
  //prince
  Prince(width/2, height/2);
  //opeo
  Opeo(width/2-200, height/2+200);
  //princess
  Princess(width/2-200, height/2-200);
  //Marny
  Marny(width/2+200, height/2-200);
  //dipp
  Dipp(width/2+200, height/2);
  //june
  June(width/2-200, height/2);
  //ichigo
  Ichigo(width/2, height/2-200);
  //kuro
  Kuro(width/2+200, height/2+200);
  //marcy
  Marcy(width/2, height/2+200);
  
 
}
void draw() {
  if(key == 'r'){ //starts poiltillism ! 
    RoyalPoint();
    }
    if(key == 'r'){ //we love katamari! 
    textFont(font, fs);
  w = textWidth(headline);
  stroke(0);
  fill(255);
  text(headline, fox, foy);
  fox = fox - 3;
  if( fox < -w){
    fox =width;
    fs = (int)random(20,48);
  }
    }
    
    if(key == 'r'){//moves prince and his katamari! 
      pushMatrix();
      translate(RollX, RollY);
      PImage imgB = loadImage("katamari.gif");
      RollX += speedX;
      if(RollX>width){
        RollX *= -1;
      } 
      else if (RollX < -width){
        RollX *= -1;
      }
     
      image(imgB, width/2, height/2+200);
      popMatrix();
    }
}

void keyPressed(){
   if(key == 'r'){
    katamari8bit.trigger();//start music!
  }
}
  

void Pointillism() {
  int x = (int)random(width);
  int y = (int)random(height);
  int i = x+width*y;
  color c = pixels[i];
  fill(c);
  ellipse(x, y, 7, 7);
}

void Prince(float x, float y) {
  PImage imgP = loadImage("prince.png");
  image(imgP, width/2, height/2);
 
}

void RoyalPoint(){ //pointillism
  imageMode(CENTER);
  PImage img = loadImage("we love katamari.png");
  image(img,width/2,height/2);
  noStroke();
  loadPixels();
  for (int i=0; i<20000; i++) Pointillism();
    
  
  }



void Princess(float x, float y) { //negative
  PImage imgPp = loadImage("princess.png");
  image(imgPp, width/2-200, height/2-200);
  imgPp.loadPixels();
  for (int i=0; i<imgPp.pixels.length; i++){
    color c = imgPp.pixels[i];
    imgPp.pixels[i] = color(255-red(c), 255-green(c), 255-blue(c));
  }
  imgPp.updatePixels();
  image(imgPp, width/2-200, height/2-200);
}

void Opeo(float x, float y) { //blur
  PImage imgO = loadImage("opeo.png");
  image(imgO, width/2-200, height/2+200);
  imgO.loadPixels();
  PImage edgeImg = createImage(imgO.width, imgO.height, RGB);
  for (int yy = 1; yy < imgO.height-1; yy++) { 
    for (int xx = 1; xx < imgO.width-1; xx++) {
      float sum = 0; // Kernel sum for this pixel
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
           int pos = (yy + ky)*imgO.width + (xx + kx);
            float val = red(imgO.pixels[pos]);
            sum += blurr[ky+1][kx+1] * val;
        }  
      }
       edgeImg.pixels[yy*imgO.width + xx] = color(sum);
    }
  }
  edgeImg.updatePixels();
image(edgeImg, width/2-200, height/2+200);
}



void Marny(float x, float y) { //edge detection
  PImage imgY = loadImage("marny.png");
  image(imgY, width/2+200, height/2-200);
  imgY.loadPixels();
  PImage edgeImg = createImage(imgY.width, imgY.height, RGB);
  for (int my = 1; my < imgY.height-1; my++) {
    for (int mx = 1; mx < imgY.width-1; mx++) {
      float sum = 0;
        for (int ky = -1; ky <= 1; ky++) {
          for (int kx = -1; kx <= 1; kx++) {
             int pos = (my + ky)*imgY.width + (mx + kx);
                float val = red(imgY.pixels[pos]);
                 sum += edge[ky+1][kx+1] * val;
          }
        }
  edgeImg.pixels[my*imgY.width + mx] = color(sum);
    }
  }
  edgeImg.updatePixels();
  image(edgeImg,width/2+200, height/2-200);
}
                
  


void Dipp(float x, float y) {
  PImage imgD = loadImage("dipp.png");
  image(imgD, width/2+200, height/2);
}

void Ichigo(float x, float Y) {
  PImage imgI = loadImage("ichigo.png");
  image(imgI, width/2, height/2-200);
}

void June(float x, float y) {
  PImage imgJ = loadImage("june.png");
  image(imgJ, width/2-200, height/2);
}

void Kuro(float x, float y) { //sepia
  PImage imgK = loadImage("kuro.png");
  image(imgK, width/2+200, height/2+200);
  for (int i = 0; i < imgK.pixels.length; i++) {
    color c = imgK.pixels [i];
    imgK.pixels[i] = color(0.3*red(c)+ 0.59*green(c)+ 0.11*blue(c));
  }
  imgK.updatePixels ();
  image (imgK, width/2+200, height/2+200);
  imgK.loadPixels ();
  for (int i = 0; i < imgK.pixels.length; i++) {
    color c = imgK.pixels [i];
     float r = red(c)*0.393+green(c)*0.769+blue(c)*0.189;
    float g = red(c)*0.349+green(c)*0.686+blue(c)*0.168;
    float b = red(c)*0.272+green(c)*0.534+blue(c)*0.131;
    imgK.pixels[i]=color(r,g,b);
  }
  imgK.updatePixels();
  image(imgK,width/2+200, height/2+200);
}

void Marcy(float x, float y) {
  PImage imgM = loadImage("marcy.png");
  image(imgM, width/2, height/2+200);
}


