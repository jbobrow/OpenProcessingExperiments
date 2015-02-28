
int mysize = 60;
float xpos = width/2 ;
float ypos = height/2;
int control = 40;
int gap = 150;

void setup(){
  size(700,700);
  fill(0,0,0,255);
  rect(0,0,0,255);
  noStroke();
  smooth();
  frameRate(5000);
  
  
}

void draw(){
     fill(0,0,0,10);
     rectMode(CORNER);
       rect(0,0,width,height);
  
     if(mouseButton == LEFT){
       fill(255,255,255, 180);
       rectMode(CENTER);
    
    //layer 1
    rect(xpos, ypos, mysize, mysize);
    rect(xpos+gap, ypos, mysize, mysize);
    rect(xpos, ypos+gap, mysize, mysize);
    rect(xpos+gap, ypos +gap, mysize, mysize);
    rect(xpos-gap, ypos -gap, mysize, mysize);
    rect(xpos-gap, ypos +gap, mysize, mysize);
    rect(xpos+gap, ypos -gap, mysize, mysize);
    rect(xpos, ypos -gap, mysize, mysize);
    rect(xpos-gap, ypos, mysize, mysize);
    
    //layer 2
    
    rect(xpos+2*gap, ypos, mysize, mysize);
    rect(xpos, ypos+2*gap, mysize, mysize);
    rect(xpos+2*gap, ypos +2*gap, mysize, mysize);
    rect(xpos-2*gap, ypos -2*gap, mysize, mysize);
    rect(xpos-2*gap, ypos +2*gap, mysize, mysize);
    rect(xpos+2*gap, ypos -2*gap, mysize, mysize);
    rect(xpos, ypos -2*gap, mysize, mysize);
    rect(xpos-2*gap, ypos, mysize, mysize);
    rect(xpos+gap, ypos +2*gap, mysize, mysize);
    rect(xpos-gap, ypos -2*gap, mysize, mysize);
    rect(xpos-gap, ypos +2*gap, mysize, mysize);
    rect(xpos+gap, ypos -2*gap, mysize, mysize);
    rect(xpos+2*gap, ypos +gap, mysize, mysize);
    rect(xpos-2*gap, ypos -gap, mysize, mysize);
    rect(xpos-2*gap, ypos +gap, mysize, mysize);
    rect(xpos+2*gap, ypos -gap, mysize, mysize);
    
    
    //Layer 3
    
    rect(xpos+3*gap, ypos, mysize, mysize);
    rect(xpos, ypos+3*gap, mysize, mysize);
    rect(xpos+3*gap, ypos +3*gap, mysize, mysize);
    rect(xpos-3*gap, ypos -3*gap, mysize, mysize);
    rect(xpos-3*gap, ypos +3*gap, mysize, mysize);
    rect(xpos+3*gap, ypos -3*gap, mysize, mysize);
    rect(xpos, ypos -3*gap, mysize, mysize);
    rect(xpos-3*gap, ypos, mysize, mysize);
    rect(xpos+gap, ypos +3*gap, mysize, mysize);
    rect(xpos-gap, ypos -3*gap, mysize, mysize);
    rect(xpos-gap, ypos +3*gap, mysize, mysize);
    rect(xpos+gap, ypos -3*gap, mysize, mysize);
    rect(xpos+3*gap, ypos +gap, mysize, mysize);
    rect(xpos-3*gap, ypos -gap, mysize, mysize);
    rect(xpos-3*gap, ypos +gap, mysize, mysize);
    rect(xpos+3*gap, ypos -gap, mysize, mysize);
    rect(xpos+3*gap, ypos +2*gap, mysize, mysize);
    rect(xpos-3*gap, ypos -2*gap, mysize, mysize);
    rect(xpos-3*gap, ypos +2*gap, mysize, mysize);
    rect(xpos+3*gap, ypos -2*gap, mysize, mysize);
    rect(xpos+2*gap, ypos +3*gap, mysize, mysize);
    rect(xpos-2*gap, ypos -3*gap, mysize, mysize);
    rect(xpos-2*gap, ypos +3*gap, mysize, mysize);
    rect(xpos+2*gap, ypos -3*gap, mysize, mysize);
    
    //Layer 4
          rect(xpos+4*gap, ypos, mysize, mysize);
    rect(xpos, ypos+4*gap, mysize, mysize);
    rect(xpos+4*gap, ypos +4*gap, mysize, mysize);
    rect(xpos-4*gap, ypos -4*gap, mysize, mysize);
    rect(xpos-4*gap, ypos +4*gap, mysize, mysize);
    rect(xpos+4*gap, ypos -4*gap, mysize, mysize);
    rect(xpos, ypos -4*gap, mysize, mysize);
    rect(xpos-4*gap, ypos, mysize, mysize);
    rect(xpos+gap, ypos +4*gap, mysize, mysize);
    rect(xpos-gap, ypos -4*gap, mysize, mysize);
    rect(xpos-gap, ypos +4*gap, mysize, mysize);
    rect(xpos+gap, ypos -4*gap, mysize, mysize);
    rect(xpos+4*gap, ypos +gap, mysize, mysize);
    rect(xpos-4*gap, ypos -gap, mysize, mysize);
    rect(xpos-4*gap, ypos +gap, mysize, mysize);
    rect(xpos+4*gap, ypos -gap, mysize, mysize);
    rect(xpos+4*gap, ypos +2*gap, mysize, mysize);
    rect(xpos-4*gap, ypos -2*gap, mysize, mysize);
    rect(xpos-4*gap, ypos +2*gap, mysize, mysize);
    rect(xpos+4*gap, ypos -2*gap, mysize, mysize);
    rect(xpos+2*gap, ypos +4*gap, mysize, mysize);
    rect(xpos-2*gap, ypos -4*gap, mysize, mysize);
    rect(xpos-2*gap, ypos +4*gap, mysize, mysize);
    rect(xpos+2*gap, ypos -4*gap, mysize, mysize);
    rect(xpos+3*gap, ypos +4*gap, mysize, mysize);
    rect(xpos-3*gap, ypos -4*gap, mysize, mysize);
    rect(xpos-3*gap, ypos +4*gap, mysize, mysize);
    rect(xpos+3*gap, ypos -4*gap, mysize, mysize);
    rect(xpos+4*gap, ypos +3*gap, mysize, mysize);
    rect(xpos-4*gap, ypos -3*gap, mysize, mysize);
    rect(xpos-4*gap, ypos +3*gap, mysize, mysize);
    rect(xpos+4*gap, ypos -3*gap, mysize, mysize);
    
    //Layer 5
       rect(xpos+5*gap, ypos, mysize, mysize);
    rect(xpos, ypos+5*gap, mysize, mysize);
    rect(xpos+5*gap, ypos +5*gap, mysize, mysize);
    rect(xpos-5*gap, ypos -5*gap, mysize, mysize);
    rect(xpos-5*gap, ypos +5*gap, mysize, mysize);
    rect(xpos+5*gap, ypos -5*gap, mysize, mysize);
    rect(xpos, ypos -5*gap, mysize, mysize);
    rect(xpos-5*gap, ypos, mysize, mysize);
    rect(xpos+gap, ypos +5*gap, mysize, mysize);
    rect(xpos-gap, ypos -5*gap, mysize, mysize);
    rect(xpos-gap, ypos +5*gap, mysize, mysize);
    rect(xpos+gap, ypos -5*gap, mysize, mysize);
    rect(xpos+5*gap, ypos +gap, mysize, mysize);
    rect(xpos-5*gap, ypos -gap, mysize, mysize);
    rect(xpos-5*gap, ypos +gap, mysize, mysize);
    rect(xpos+5*gap, ypos -gap, mysize, mysize);
    rect(xpos+5*gap, ypos +2*gap, mysize, mysize);
    rect(xpos-5*gap, ypos -2*gap, mysize, mysize);
    rect(xpos-5*gap, ypos +2*gap, mysize, mysize);
    rect(xpos+5*gap, ypos -2*gap, mysize, mysize);
    rect(xpos+2*gap, ypos +5*gap, mysize, mysize);
    rect(xpos-2*gap, ypos -5*gap, mysize, mysize);
    rect(xpos-2*gap, ypos +5*gap, mysize, mysize);
    rect(xpos+2*gap, ypos -5*gap, mysize, mysize);
    rect(xpos+3*gap, ypos +5*gap, mysize, mysize);
    rect(xpos-3*gap, ypos -5*gap, mysize, mysize);
    rect(xpos-3*gap, ypos +5*gap, mysize, mysize);
    rect(xpos+3*gap, ypos -5*gap, mysize, mysize);
    rect(xpos+5*gap, ypos +3*gap, mysize, mysize);
    rect(xpos-5*gap, ypos -3*gap, mysize, mysize);
    rect(xpos-5*gap, ypos +3*gap, mysize, mysize);
    rect(xpos+5*gap, ypos -3*gap, mysize, mysize);
    rect(xpos+5*gap, ypos +4*gap, mysize, mysize);
    rect(xpos-5*gap, ypos -4*gap, mysize, mysize);
    rect(xpos-5*gap, ypos +4*gap, mysize, mysize);
    rect(xpos+5*gap, ypos -4*gap, mysize, mysize);
    rect(xpos+4*gap, ypos +5*gap, mysize, mysize);
    rect(xpos-4*gap, ypos -5*gap, mysize, mysize);
    rect(xpos-4*gap, ypos +5*gap, mysize, mysize);
    rect(xpos+4*gap, ypos -5*gap, mysize, mysize);
    
    //Layer 6
    
    rect(xpos+6*gap, ypos, mysize, mysize);
    rect(xpos, ypos+6*gap, mysize, mysize);
    rect(xpos+6*gap, ypos +6*gap, mysize, mysize);
    rect(xpos-6*gap, ypos -6*gap, mysize, mysize);
    rect(xpos-6*gap, ypos +6*gap, mysize, mysize);
    rect(xpos+6*gap, ypos -6*gap, mysize, mysize);
    rect(xpos, ypos -6*gap, mysize, mysize);
    rect(xpos-6*gap, ypos, mysize, mysize);
    rect(xpos+gap, ypos +6*gap, mysize, mysize);
    rect(xpos-gap, ypos -6*gap, mysize, mysize);
    rect(xpos-gap, ypos +6*gap, mysize, mysize);
    rect(xpos+gap, ypos -6*gap, mysize, mysize);
    rect(xpos+6*gap, ypos +gap, mysize, mysize);
    rect(xpos-6*gap, ypos -gap, mysize, mysize);
    rect(xpos-6*gap, ypos +gap, mysize, mysize);
    rect(xpos+6*gap, ypos -gap, mysize, mysize);
    rect(xpos+6*gap, ypos +2*gap, mysize, mysize);
    rect(xpos-6*gap, ypos -2*gap, mysize, mysize);
    rect(xpos-6*gap, ypos +2*gap, mysize, mysize);
    rect(xpos+6*gap, ypos -2*gap, mysize, mysize);
    rect(xpos+2*gap, ypos +6*gap, mysize, mysize);
    rect(xpos-2*gap, ypos -6*gap, mysize, mysize);
    rect(xpos-2*gap, ypos +6*gap, mysize, mysize);
    rect(xpos+2*gap, ypos -6*gap, mysize, mysize);
    rect(xpos+3*gap, ypos +6*gap, mysize, mysize);
    rect(xpos-3*gap, ypos -6*gap, mysize, mysize);
    rect(xpos-3*gap, ypos +6*gap, mysize, mysize);
    rect(xpos+3*gap, ypos -6*gap, mysize, mysize);
    rect(xpos+6*gap, ypos +3*gap, mysize, mysize);
    rect(xpos-6*gap, ypos -3*gap, mysize, mysize);
    rect(xpos-6*gap, ypos +3*gap, mysize, mysize);
    rect(xpos+6*gap, ypos -3*gap, mysize, mysize);
    rect(xpos+6*gap, ypos +4*gap, mysize, mysize);
    rect(xpos-6*gap, ypos -4*gap, mysize, mysize);
    rect(xpos-6*gap, ypos +4*gap, mysize, mysize);
    rect(xpos+6*gap, ypos -4*gap, mysize, mysize);
    rect(xpos+4*gap, ypos +6*gap, mysize, mysize);
    rect(xpos-4*gap, ypos -6*gap, mysize, mysize);
    rect(xpos-4*gap, ypos +6*gap, mysize, mysize);
    rect(xpos+4*gap, ypos -6*gap, mysize, mysize);
    rect(xpos+5*gap, ypos +6*gap, mysize, mysize);
    rect(xpos-5*gap, ypos -6*gap, mysize, mysize);
    rect(xpos-5*gap, ypos +6*gap, mysize, mysize);
    rect(xpos+5*gap, ypos -6*gap, mysize, mysize);
    rect(xpos+6*gap, ypos +5*gap, mysize, mysize);
    rect(xpos-6*gap, ypos -5*gap, mysize, mysize);
    rect(xpos-6*gap, ypos +5*gap, mysize, mysize);
    rect(xpos+6*gap, ypos -5*gap, mysize, mysize);
    
    
    xpos = xpos+(mouseX-xpos)/control;
  ypos = ypos+(mouseY-ypos)/control;
     }
  
       if(mouseButton == RIGHT){
         delay(10);
       }
   

  }
  

void mousePressed(){
  
  
  
  
}

void mouseMoved(){
  
  
  
}

