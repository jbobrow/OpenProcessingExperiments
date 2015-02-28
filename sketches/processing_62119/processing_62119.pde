
//space invaders series: photo taken by Ceci Catalano
//******to make a movie********
//import processing.video.*;
//MovieMaker mm;
//*****************************

PImage img;
int p=24;

void setup(){
  size(336,336);
  img=loadImage("antibes_france.jpg");
  frameRate(25);
  
  //*****movie******************************************************
//  mm = new MovieMaker(this, width, height, "antibes.mov",
//                     25, MovieMaker.ANIMATION, MovieMaker.HIGH);
//******************************************************************
}

void draw(){
  for (int dx=0;dx<=width;dx+=p){
    for (int dy=0;dy<=height;dy+=p){
  copy(img, int(random(448)), int(random(298)), p,p,dx,dy,p,p);
  }
  }
  
  invader();
  
//******movie*****************************
//  mm.addFrame();
//  if (frameCount ==500){mm.finish();}
//****************************************
}

void invader(){
  stroke(215);
  fill(255);
  
  for (int x=2;x<5;x++){
    for (int y=2;y<=4;y++){ 
    rect(x*p,y*p,p,p);}
  }
  
  for (int x=9;x<12;x++){
    for (int y=2;y<=4;y++){ 
    rect(x*p,y*p,p,p);}
  }
    
  for (int x=2;x<12;x++){
    rect(x*p,7*p,p,p);
  }
  
  for (int y=8;y<12;y++){
    rect(p*2,y*p,p,p);
    rect(p*6,y*p,p,p);
    rect(p*7,y*p,p,p);
    rect(p*11,y*p,p,p);
  }
    
  rect(p,6*p,p,p);  
  rect(2*p,6*p,p,p);
  rect(11*p,6*p,p,p);  
  rect(12*p,6*p,p,p);
  rect(4*p,8*p,p,p);
  rect(9*p,8*p,p,p);
  rect(p,11*p,p,p);
  rect(p*12,11*p,p,p);
}



