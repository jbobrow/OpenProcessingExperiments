
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int amount = 100;

int[] xpos = new int[amount];
int[] ypos = new int[amount];
int[] wid = new int[amount];
int[] hei = new int[amount];


Minim m;
AudioPlayer tornado;

void setup(){
  size (700,400);
  background (255);
  strokeWeight(1);
  stroke(0);
  smooth();
  noFill();
  
  m = new Minim(this);
  tornado = m.loadFile("tornado.wav");
}

void draw(){
  background(255);
  
 int i = 0;
 int x = 350;
 int y = 0;
 int w = 200;
 
 while (i < amount){ 
 xpos[i] = mouseX;
 ypos[i] = mouseY + y;
 wid[i] = (height - ypos[i])/2; 
 hei[i] = 20;
 
 ellipse(xpos[i], ypos[i], wid[i], hei[i]);
 y = y + 5;
 w = w - 5;
 i = i + 1;
 
}
//float distance = dist(mouseY, pageHei)

}

void mouseClicked(){
  tornado.loop();
}

