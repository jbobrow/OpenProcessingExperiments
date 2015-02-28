
//Mouse following motion code from "follow" by Gabriel Astudillo on openprocessing.org
//Tail formation code based on "repeat circles follow mouse with fade trail" by Emily Burgess on openprocessing.org
//Everything else is copyright of Stephanie Cheung and the schools of skyfish for Homework 4 of Computing for the Arts with Processing
//So I tried to make fancy things happen when you pressed a key, I really did, but for some reason only the ellipse worked.
//The fish-thing will follow your mouse cursor, and a black circle will appear in the middle of the screen when you press any key.
//At least, that's what's supposed to happen.
  float angle = 0;
  float cx = 0;
  float cy = 0;
  float [] tenx = new float [50]; //variables based on Burgess' code
  float [] teny = new float [50];
  float s = 3;
  
void setup(){
  size(600,600);
  smooth();
  for (int s = 0;s<50;s++){ 
    tenx[s]=0;
    teny[s]=0;
  }
}

void draw(){
  for(int i=255;i>=0;i=i-1){  //create a background that looks like a gradient from black to blue
    noStroke();
    fill(i*.211,i*.227, i*.5);
    rect(0,i*3,600,3);
  }
    if(keyPressed==true){ //click once and press any key
      ellipse(300,300,s,s);  
      s = s+1;
  }
  else{
      s = 3;
  }
   
  tentacle();
  pushMatrix();
  translate(cx,cy);
  rotate(angle);
  
  jellybody();
  popMatrix();
  
  
  //variables, from "follow"
  float dx = mouseX-cx;
  float dy = mouseY-cy;
  angle = atan2(dy,dx);
  cx += (dx)*0.02;
  cy += (dy)*0.02;
  
  
}

void tentacle(){
noStroke();
for(int s=0;s<49;s++){ //format of for loop based on Burgess' code
  tenx[s]=tenx[s+1];
  teny[s]=teny[s+1];
  fill(255,255,255,50);
  ellipse(tenx[s],teny[s],s-20,s-20);
    }
    tenx[49]=cx;
    teny[49]=cy;
for(int s=0;s<99;s++){ //I know this whole repetition thing could have been done with for loops but I couldn't get it to work for the life of me.
  tenx[s]=tenx[s+1];
  teny[s]=teny[s+1];
  fill(255,255,255,50);
  ellipse(tenx[s],teny[s],s-60,s-60);
    }
    tenx[99]=cx;
    teny[99]=cy;
    
  for(int s=0;s<109;s++){
  tenx[s]=tenx[s+1];
  teny[s]=teny[s+1];
  fill(255,255,255,50);
  ellipse(tenx[s],teny[s],s-80,s-80);
    }
    tenx[109]=cx;
    teny[109]=cy;
}


void jellybody(){
  noStroke();
  fill(255,255,255,60);
  for (int r=10;r<81;r=r+10){
  ellipse(0,0,45+(r*.11),r);
  }
}
