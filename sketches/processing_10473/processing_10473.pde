
/*--------------------------------------------------------------*/
/*----------------------- 3D Fractal Fun -----------------------*/
/*---------------------- Daan van Hasselt ----------------------*/
/*--------------------------------------------------------------*/
// use mouseX to control one of the parameters

import processing.opengl.*;

boolean DRAWBOX = true;
boolean DRAWLINE = false;
boolean HELP = true;

ArrayList segments = new ArrayList();
float viewAngle = 0;
PFont font;

void setup(){
   size(700,700, P3D);
   smooth();
   
   font = loadFont("AmericanTypewriter-48.vlw"); 
   textFont(font); 
   
   PVector pos = new PVector(width/2, height/2, 0);
   PVector dir = new PVector(PI/3, PI/2, 7);
   Segment segment = new Segment(pos, dir, 0, 0.5, 1);
   segments.add(segment);
}


void draw(){
  background(240);
  lights();
  
  if(HELP){
    strokeWeight(1);
    stroke(100,100);
    noFill();
    rect(0, 0, 200, 95);
    fill(20);
    textSize(14);
    text("b : toggle boxes", 20, 20);
    text("l : toggle lines", 20, 40);
    text("space : render new shape", 20, 60);
    text("? : toggle help", 20, 80);
  }
  
  translate(width/2, height/2);
  rotateX(viewAngle);
  rotateY(viewAngle * 10);
  viewAngle += 0.001;
  viewAngle = viewAngle % TWO_PI;
  translate(-width/2, -height/2);

  for(int i = 0; i < segments.size(); i++){
    Segment segment = (Segment) segments.get(i);
    segment.rad = ((float)mouseX/(float)width)/40;
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
  if(key == ' '){
    for(int i = 0; i < segments.size(); i++){
      Segment segment = (Segment) segments.get(i);
      segment.off = random(TWO_PI);
    }
  }
  if(key == '?' || key == '/'){
    HELP = !HELP;
  }
}


class Segment{
  
  PVector pos, dir, nextPos, nextDir;
  int gen, nextGen, maxGen;
  float rad, dec, off;
  boolean horny = true;
  
 public Segment(PVector _pos, PVector _dir, int _gen, float _rad, float _dec){
   pos = _pos;
   dir = _dir;
   gen = _gen;
   rad = _rad;
   dec = _dec;
   off = random(TWO_PI);
   maxGen = 2000;
   
   nextPos = new PVector();
   nextDir = new PVector();
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
   nextDir.z = (dir.z * dec);
   
   if(DRAWBOX){
     stroke(((float)gen/(float)maxGen)*150,100);
     noFill();
     strokeWeight(1);
     pushMatrix();
     translate(pos.x, pos.y, pos.z);
     box(3);
     popMatrix();
   }
   if(DRAWLINE){
     stroke(((float)gen/(float)maxGen)*150,100);
     strokeWeight(3);
     line(pos.x, pos.y, pos.z, nextPos.x, nextPos.y, nextPos.z);
   }
   if(horny){
     reproduce(nextPos, nextDir, nextGen, rad, dec);
   }
 }
 
 void reproduce(PVector _pos, PVector _dir, int _gen, float _rad, float _dec){
   Segment segment = new Segment(_pos, _dir, _gen, _rad, _dec);
   segments.add(segment);
   horny = false;
 }
  
}

