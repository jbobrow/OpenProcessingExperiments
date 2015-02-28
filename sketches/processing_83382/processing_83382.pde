
/////////////////////////
//
//      Stereo-Vision
//
//     Hackpact_MX 2012
//
//          #5
//         NOMBRE
////////////////////////

import colorLib.calculation.*;
import colorLib.*;
import colorLib.webServices.*;


class Bicho{
  float R;
  float r;
  float n,nx,ny;
  float v,vx,vy;
  PVector pos;
  color col;
  
  Bicho(float x, float y){
   R = random(10,100); 
   r = random(10,100);
   pos = new PVector(x,y,0);
   n = 0;
   nx = 0;
   ny = 0;
   v = random(0.001,0.0085);
   vx = random(0.0001,0.005);
   vy = random(0.0001,0.005);
   col = p1.getColor(int(random(p1.totalSwatches())));
  }
  
  void display(){
   strokeWeight(random(1,3.8));
   stroke(col,80);
   for( int i = 0; i < 360; i += 5){
   pushMatrix();
   translate(pos.x+width/4*noise(nx),pos.y+height/4*noise(ny));
   translate(R*cos(degrees(i)),R*sin(degrees(i)));
   line(0,0,(r+20*noise(n))*cos(degrees(i)),(r+20*noise(n))*sin(degrees(i)));
   popMatrix();

   n += v;
   nx += vx;
   ny += vy;
  }

  }
  
};

int t = 0;
ArrayList bichos;
PImage img;
Palette p1;
color bck;

void setup(){
 size(600,700); 
 background(0);
 smooth();
 float r = 200;
 
 img = loadImage("cointreau.jpg");
 p1 = new Palette(this,img);
 
 bichos = new ArrayList();
 for( int i = 0; i < 100; i ++){
   bichos.add(new Bicho(random(-width,width),random(-height,height)));
 }
 
 bck = p1.getColor(int(random(p1.totalSwatches())));
 
/* for( int i = 0; i < 360; i += 5){
  bichos.add(new Bicho(r*cos(degrees(i)),r*sin(degrees(i))));
 }
*/
}

void draw(){
  
  noStroke();
  rectMode(CORNER);
//  fill(0,50);
  fill(bck,10);
  rect(0,0,width,height);
    
  translate(width/2,height/2);
  scale(0.4);
  rotate(radians(mouseX)%TWO_PI);
  
/*  if( random(1) < 0.3){
  rotate(radians(random(TWO_PI)));
  }*/


//  stroke(255,80);
  
  for( int i = 0; i < bichos.size(); i ++){
   Bicho bicho = (Bicho) bichos.get(i);
  bicho.display();
  if( t%100 == 0 && random(1) < 0.8){
   bicho.R = random(10,200);
  }
  }
  t += 10;
}

void keyPressed(){
 if( key == ' '){
  save("capturas/img"+frameCount+".png");  
 }
 if( key == 'a'){
   bck = p1.getColor(int(random(p1.totalSwatches())));
 } 
  
}

