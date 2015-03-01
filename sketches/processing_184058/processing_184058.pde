
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PImage img;

//Variables
int pilotes = 15;
float mida = 10;
float R = 255;
float G = 150;
float B = 145;
float tinta1 = 40;
float tinta2 = 70;


//Matrius pilotes
float[] posX = new float[pilotes];
float[] posY = new float[pilotes];
float[] velX = new float[pilotes];
float[] velY = new float[pilotes];


void setup() {
  size(800, 400);
  
  //foto fons
  img = loadImage("laboratori.jpg");
 
  //Inicialització
  for (int i = 0; i<pilotes; i++){
    posX[i] = width/2;
    posY[i] = 102;
    velX[i] = random(0, 5);
    velY[i] = random(0, 5);
    
    frameRate(160);
  }
 
}

void draw() {
    
  background(0);
  
  image(img,0,0,width,height);
  tint(random(100,200), random(300,400)); 
  
  stroke(0);
  fill(R,G,B);

  //Bucle per actualització
  for (int i = 0; i<pilotes; i++){
    posX[i] += velX[i];
    posY[i] += velY[i];

  //Rebots
    //eix x
    if ((posX[i]<387)||(posX[i]>412)){
      velX[i] = -velX[i];
       
    } 
    
     //eix y
    if ((posY[i]<102)||(posY[i]>345)){
      velY[i] = -velY[i];
    } 
       
    ellipse(posX[i],posY[i],mida,mida);
  }
}


void mousePressed(){
   for (int i = 0; i<pilotes; i++) {
    //posX[i] = mouseX;
    //posY[i] = mouseY;
    velX[i] = random(1, 4);
    velY[i] = random(1, 4);
    R = random(255);
    G = random(255);
    B = random(255);
    mida = random(2,15);
  } 
}



