
import netscape.javascript.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
AudioPlayer player;
Minim minim; // audio context

PImage bg;
int leng = 10;  //elements in the array
int[] xPos = new int[leng];
int[] yPos = new int[leng];
int e = 0;


void mouseClicked(){
   //Array element
   xPos[e] = mouseX;
   yPos[e] = mouseY;
   e=e+1;
   if (e>=leng){
     e=0;   
   }
   
}

void setup(){
  size(800,600);
  bg = loadImage("OrionNebula.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Music.mp3", 2048);
  player.play();
}
void draw(){
  background(bg);
  for(int i=0; i<e;i++){
    points(xPos[i],yPos[i]);
  }
  for (int i=0; i<(e); i++){
        for(int j=0; j<(e); j++){
          float d = dist(xPos[i],yPos[i],xPos[(j)],yPos[(j)]);
          stroke(255);
          strokeWeight(d/400);
          line(xPos[i], yPos[i], xPos[j],yPos[j]);
        }
      }
   }

void points(int x, int y){
  ellipseMode(CENTER);
  noStroke();
  fill(0,0,255,100);
  ellipse(x,y,100,100);
  fill(255);
  ellipse(x,y,5,5);

}



