
import processing.opengl.*; // imports openGL library

import ddf.minim.*; // imported Mimim Library
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;//end import =
AudioPlayer player;
Minim minim; // audio context

PImage bg;
int leng = 10;  //elements in the array
int[] xPos = new int[leng];
int[] yPos = new int[leng];
float[] zPos = new float[leng];
int e = 0;
float r = 0;
float speed = .05;
//zPos [0] = -200;
//zPos [1] = -300;
//zPos [2] = -150;
//zPos [3] = -150;
//zPos [4] = -450;
//zPos [5] = -50;
//zPos [6] = 150;


void keyPressed(){
  if(key == BACKSPACE){
  e=0;}
  if(keyCode == RIGHT){
  r=r+speed;
  }
  if(keyCode == LEFT){
  r=r-speed;
  }
}


void mouseClicked(){
   //Array element
   xPos[e] = mouseX;
   yPos[e] = mouseY;
   if(e<(leng-1)){
     e=e+1;}
//   if (e>=leng){
//     e=0;   
//   }
   
}

void setup(){
  size(800,600,P3D);
  bg = loadImage("OrionNebula.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Music.mp3", 2048);
  player.play();
  zPos [0] = -200;
zPos [1] = -300;
zPos [2] = -150;
zPos [3] = -150;
zPos [4] = -450;
zPos [5] = -50;
zPos [6] = 150;
  
}
void draw(){
  background(bg);
  translate(width/2,0,0);
  rotateY(r);
  for(int i=0; i<e;i++){
      points(xPos[i],yPos[i],zPos[i],30);     
  }
  
  for (int i=0; i<(e); i++){
        for(int j=0; j<(e); j++){
          float d = dist(xPos[i],yPos[i],xPos[(j)],yPos[(j)]);
          stroke(255);
          strokeWeight(d/300);
         line(xPos[i], yPos[i],zPos[i], xPos[j],yPos[j],zPos[j]);
        }
      }
   }


void points(int x, int y, float z, int dia) {
  noStroke();
  pushMatrix();
    fill(255);
    translate(x,y,z);
    sphereDetail(15);
    sphere(dia/20);
  popMatrix();
  pushMatrix();
    fill(0,0,255,50);
    translate(x,y,z);
    sphereDetail(200);
    sphere(dia);
  popMatrix();
  
}



