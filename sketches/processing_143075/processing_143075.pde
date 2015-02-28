

float   progress = 0;
float   myspeed = 0.008;
float   myx;
float   myy;
float   easing = 0.05;
int     numagents = 100;
int     mysize = 50;
int     motioncase = 0;
int     colorcase = 1;
int     mydepth = 1000;
boolean ismovingxyz = false;
Agent[] agents;

void setup(){
  size(1024,768, OPENGL);
  agents = new Agent[numagents];
  for(int i = 0; i < numagents; i++){
   agents[i] = new Agent(); 
  }  
}

void draw(){
  background(0);
  lights();
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);

  myspeed = map(mouseY,0,height,0.02,0.001);  
  
  //linear
  if(motioncase == 0){  
    if (ismovingxyz) {
      for (int i = 0; i < numagents; i++) {
        agents[i].theposx = lerp(agents[i].lastposx, agents[i].nextposx, progress);
        agents[i].theposy = lerp(agents[i].lastposy, agents[i].nextposy, progress);
        agents[i].theposz = lerp(agents[i].lastposz, agents[i].nextposz, progress);
      }
      progress += myspeed; 
    }
  }
  

 

  if (progress > 1){
    progress = 0; 
    ismovingxyz = false; 
    for (int i = 0; i < numagents; i++) {
      agents[i].lastposx =  agents[i].theposx;
      agents[i].lastposy =  agents[i].theposy;
      agents[i].lastposz =  agents[i].theposz;
    }   
  }  
 
  for (int i = 0; i < numagents; i++) {
    //agents[i].update();
    if(colorcase == 0){
      noStroke();
      colorMode(HSB,255);
      agents[i].thedistx = abs(width/2 - agents[i].theposx);
      agents[i].myhue = round(map(agents[i].thedistx, 0,width/2, 0 , 255));
      //saturation effect based on y direction. 
      //agents[i].thedisty = abs(height/2 - agents[i].theposy);
      //agents[i].mysat = round(map(agents[i].thedisty, 0,height/2, 0 , 255));
      agents[i].thedistz = agents[i].theposz + 500;
      agents[i].myval = round(map(agents[i].thedistz, 0, mydepth, 0 , 255));
      fill(agents[i].myhue,agents[i].mysat,agents[i].myval);
    }
    if(colorcase == 1){
      colorMode(RGB,255);
      if(progress < 0.5){
        fill(255,255,255,map(progress,0,0.5,255,0));
      }
      if(progress > 0.5){
        fill(255,255,255,map(progress,.5,1,0,255));
      }
      stroke(255,255,255,map(progress,0,1,0,255));
    }
    agents[i].display();
  }
}


class Agent {
  float thedistx;
  float thedisty;
  float thedistz;
  float theposx;
  float theposy;
  float theposz;
  float lastposx;
  float lastposy;
  float lastposz;
  float nextposx;
  float nextposy;
  float nextposz;
  float myscale;
  int myhue;
  int mysat = 255;
  int myval;

  
  Agent() {   
    myscale = 1;  
    theposx = round(random(width));   
    theposy = round(random(height)); 
    theposz = round(random(-500, 500));  
    lastposx = round(random(width));   
    lastposy = round(random(height));  
    lastposz = round(random(-500, 500));  
    nextposx = round(random(width));   
    nextposy = round(random(height));   
    nextposz = round(random(-500, 500));  
    thedistx = abs(width/2 - theposx);
    thedisty = abs(height/2 - theposy);
    thedistz = theposz + 500;
    //myhue = round(map(thedistx, 0,width, 0 , 255));
     
  }
  
  void display(){
    /* rectMode(CENTER); */
    /* fill(255); */
    pushMatrix();
    translate(theposx,theposy,theposz);
    box(mysize); 
    popMatrix();
  }
  
  void findnextpos(){
    nextposx = round(random(width));   
    nextposy = round(random(height)); 
    nextposz = round(random(-500,500));   
  } 
 
  void findnextx(){
    nextposx = round(random(width));    
  } 
  
    void findnexty(){  
    nextposy = round(random(height));  
  } 
  
    void findnextz(){
    nextposz = round(random(-500,500));   
  } 
}
  
void keyPressed() {
  if( key == 'a' || key == 'A') {
    progress = 0;  
    for (int i = 0; i < numagents; i++) {
      agents[i].lastposx =  agents[i].theposx;
      agents[i].lastposy =  agents[i].theposy;
      agents[i].lastposz =  agents[i].theposz;
     }
  
    for (int i = 0; i < numagents; i++) {
      agents[i].findnextpos();  
    }
  
    if (ismovingxyz == false){
      ismovingxyz = true; 
    }
  }
  if( key == 's' || key == 'S') {
    colorcase = 1;
  }
  if( key == 'd' || key == 'D') {
    colorcase = 0;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    progress = 0;  
    for (int i = 0; i < numagents; i++) {
      agents[i].lastposx =  agents[i].theposx;
      agents[i].lastposy =  agents[i].theposy;
      agents[i].lastposz =  agents[i].theposz;
      agents[i].nextposy =  agents[i].theposy;
      agents[i].nextposz =  agents[i].theposz;
     }
  
    for (int i = 0; i < numagents; i++) {
      agents[i].findnextx();  
    }
  
    if (ismovingxyz == false){
      ismovingxyz = true; 
    }
  } 
  else if (mouseButton == RIGHT) {
    progress = 0;  
    for (int i = 0; i < numagents; i++) {
      agents[i].lastposx =  agents[i].theposx;
      agents[i].lastposy =  agents[i].theposy;
      agents[i].lastposz =  agents[i].theposz;
      agents[i].nextposx =  agents[i].theposx;
      agents[i].nextposy =  agents[i].theposy;
     }
  
    for (int i = 0; i < numagents; i++) {
      agents[i].findnextz();  
    }
  
    if (ismovingxyz == false){
      ismovingxyz = true; 
    }
  } 
  else if (mouseButton == CENTER) {
    progress = 0;  
    for (int i = 0; i < numagents; i++) {
      agents[i].lastposx =  agents[i].theposx;
      agents[i].lastposy =  agents[i].theposy;
      agents[i].lastposz =  agents[i].theposz;
      agents[i].nextposx =  agents[i].theposx;
      agents[i].nextposz =  agents[i].theposz;
    }
  
    for (int i = 0; i < numagents; i++) {
      agents[i].findnexty();  
    }
  
    if (ismovingxyz == false){
      ismovingxyz = true; 
    }
  } 
}



