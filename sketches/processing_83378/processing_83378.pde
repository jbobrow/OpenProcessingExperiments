

/////////////////////////
//
//      Stereo-Vision
//
//     Hackpact_MX 2012
//
//          #4
//         Flores
////////////////////////

import colorLib.calculation.*;
import colorLib.*;
import colorLib.webServices.*;

class Arco{
 
 PVector pos;
 float st;
 float end;
 float w;
 color col;

 Arco(int x, int y){
   pos = new PVector(x,y,0);
   st = random(0,PI/2);
   end = random(PI/2,TWO_PI);   
//   w = 50;
   w = 25;
   col = p1.getColor(int(random(p1.totalSwatches())));
 }
  
 void display(float t){
   
   arc(pos.x,pos.y,w,w,st,radians(t)%end);
   
 }
  
};

float t=0;
int s = 50;
float c = 5;
int d = 100;

boolean b_w = false;
boolean b_c = false;

PImage img;
Palette p1;
  
ArrayList arcos;

void setup(){
 size(800,600);
 background(0);
 smooth();
 
// img = loadImage("lengrand_frog.jpg");
 img = loadImage("big_cat.jpg");
 p1 = new Palette(this,img);
 
 arcos = new ArrayList();
 
 for(int i = -width/2; i < width/2; i += s){
   for(int j = -height/2; j < height/2; j += s){
     arcos.add(new Arco(i,j));
   }     
  }
   
}


void draw(){
  
  rectMode(CORNER);
  fill(0,25);
  noStroke();
  rect(0,0,width,height);
  
  translate(width/2,height/2);
  
  noFill();
//  stroke(255,50);
  
  //noFill();  
//  fill(255,5);
  d = int(map(mouseY,0,height,10,100));
  
  for( int i = 0; i < arcos.size(); i ++){
   Arco arco = (Arco) arcos.get(i);
   stroke(arco.col,50);
   fill(arco.col,30);
   arco.display(t);
   if( frameCount % d == 0){
     if( b_w == true){
     arco.w = random(10,115);
     }
     else {
//      arco.w = 50; 
      arco.w = 25;       
     }
     if( b_c == true){
     arco.col = p1.getColor(int(random(p1.totalSwatches())));
     }     
   }
  } 
 
 c = map(mouseX,0,width,1,20);
  
 t += c; 
  
}

void keyPressed(){
 if( key == ' '){
  save("capturas/img"+frameCount+".png");  
 } 
 if( key == 'a'){
   b_w = !b_w; 
 } 
 if( key == 's'){
   b_c = !b_c; 
 } 

}



