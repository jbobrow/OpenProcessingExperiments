
/*--------------------------------------------------------------*/
/*--------------------- 3D Tree Generator ----------------------*/
/*---------------------- Daan van Hasselt ----------------------*/
/*--------------------------------------------------------------*/


import processing.opengl.*;

boolean DRAWBOX = false;
boolean DRAWLINE = true;
boolean HELP = false;

ArrayList segments = new ArrayList();
float viewAngle = 0;
PFont font;

void setup(){
   size(700, 700, P3D);
   smooth();
   
   font = loadFont("AmericanTypewriter-48.vlw"); 
   textFont(font); 
   
   PVector pos = new PVector(width/2, height/2, 0);
   PVector dir = new PVector(0, 0, 100);
   Segment segment = new Segment(pos, dir, 0, 0.5, 1);
   segments.add(segment);
     
   pos = new PVector(width/2, height/2, 0);
   dir = new PVector(-PI, -PI, 100);
   segment = new Segment(pos, dir, 0, 0.5, 1);
   segments.add(segment);
   
   pos = new PVector(width/2, height/2, 0);
   dir = new PVector(0, -PI, 100);
   segment = new Segment(pos, dir, 0, 0.5, 1);
   segments.add(segment);
   
   pos = new PVector(width/2, height/2, 0);
   dir = new PVector(-PI, 0, 100);
   segment = new Segment(pos, dir, 0, 0.5, 1);
   segments.add(segment);
   
   pos = new PVector(width/2, height/2, 0);
   dir = new PVector(PI/2, PI/2, 100);
   segment = new Segment(pos, dir, 0, 0.5, 1);
   segments.add(segment);
     
   pos = new PVector(width/2, height/2, 0);
   dir = new PVector(-PI/2, -PI/2, 100);
   segment = new Segment(pos, dir, 0, 0.5, 1);
   segments.add(segment);
   
   pos = new PVector(width/2, height/2, 0);
   dir = new PVector(PI/2, -PI/2, 100);
   segment = new Segment(pos, dir, 0, 0.5, 1);
   segments.add(segment);
   
   pos = new PVector(width/2, height/2, 0);
   dir = new PVector(-PI/2, PI/2, 100);
   segment = new Segment(pos, dir, 0, 0.5, 1);
   segments.add(segment);
}


void draw(){
  background(40);
  lights();
  
  if(HELP){
    strokeWeight(1);
    stroke(100,100);
    fill(140);
    rect(0, 0, 200, 75);
    fill(20);
    textSize(14);
    text("b : toggle boxes", 20, 20);
    text("l : toggle lines", 20, 40);
    text("? : toggle help", 20, 60);
  }
  
  translate(width/2, height/2);
  rotateX(viewAngle);
  rotateY(viewAngle * 10);
  viewAngle += 0.001;
  viewAngle = viewAngle % TWO_PI;
  translate(-width/2, -height/2);

  for(int i = 0; i < segments.size(); i++){
    Segment segment = (Segment) segments.get(i);
//    segment.dec = (((float)mouseX/(float)width) * 0.4 ) + 0.6;
    segment.dec = abs(sin(viewAngle*5));
    segment.rad = viewAngle*6;
    segment.off = viewAngle*4;
    segment.draw(); 
  }
}


void keyPressed(){
  if(key == 'b'){
    DRAWBOX = !DRAWBOX;
  }
  if(key == 'l'){
    DRAWLINE = !DRAWLINE;
  }
  if(key == '?' || key == '/'){
    HELP = !HELP;
  }
}


class Segment{
  
  PVector pos, dir, nextPos, nextDir, nextDir2;
  int gen, nextGen, maxGen;
  float rad, dec, off;
  boolean horny = true;
  
 public Segment(PVector _pos, PVector _dir, int _gen, float _rad, float _dec){
   pos = _pos;
   dir = _dir;
   gen = _gen;
   rad = _rad;
   dec = _dec;
//   off = random(PI/8);
   off = 0;
   maxGen = 8;
   
   nextPos = new PVector();
   nextDir = new PVector();
   nextDir2 = new PVector();
   nextGen = gen+1;
   
   if(gen >= maxGen){
     horny = false;
   }
 } 
 
 void draw(){
   nextPos.x = (pos.x + ((sin(dir.x)*cos(dir.y))*dir.z));
   nextPos.y = (pos.y + ((sin(dir.x)*sin(dir.y))*dir.z));
   nextPos.z = (pos.z + (cos(dir.y)*dir.z));
   nextDir.x = (dir.x + rad);
   nextDir.y = (dir.y + off);
   nextDir.z = (dir.z * dec * 0.8);
   nextDir2.x = (dir.x - rad);
   nextDir2.y = (dir.y - off);
   nextDir2.z = (dir.z * dec * 0.8);
   
   if(DRAWBOX){
     stroke(((float)gen/(float)maxGen)*150,100);
     noFill();
     strokeWeight(1);
     pushMatrix();
     translate(pos.x, pos.y, pos.z);
     box(2);
     popMatrix();

   }
   if(DRAWLINE){
     stroke(((float)gen/(float)maxGen)*300, ((float)gen/(float)maxGen)*500, ((float)gen/(float)maxGen)*200 + 100, 100);
     strokeWeight(1);
     line(pos.x, pos.y, pos.z, nextPos.x, nextPos.y, nextPos.z);
   }
   if(horny){
     reproduce(nextPos, nextDir, nextDir2, nextGen, rad, dec);
   }
 }
 
 void reproduce(PVector _pos, PVector _dir, PVector _dir2, int _gen, float _rad, float _dec){
   Segment segment = new Segment(_pos, _dir, _gen, _rad, _dec);
   segments.add(segment);
   segment = new Segment(_pos, _dir2, _gen, _rad, _dec);
   segments.add(segment);
   horny = false;
 }
  
}

