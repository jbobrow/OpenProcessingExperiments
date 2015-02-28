
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
       ellipseMode(CENTER);
    
    //layer 1
    ellipse(xpos, ypos, mysize, mysize);
    ellipse(xpos+gap, ypos, mysize, mysize);
    ellipse(xpos, ypos+gap, mysize, mysize);
    ellipse(xpos+gap, ypos +gap, mysize, mysize);
    ellipse(xpos-gap, ypos -gap, mysize, mysize);
    ellipse(xpos-gap, ypos +gap, mysize, mysize);
    ellipse(xpos+gap, ypos -gap, mysize, mysize);
    ellipse(xpos, ypos -gap, mysize, mysize);
    ellipse(xpos-gap, ypos, mysize, mysize);
    
    //layer 2
    
    ellipse(xpos+2*gap, ypos, mysize, mysize);
    ellipse(xpos, ypos+2*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos, ypos -2*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos, mysize, mysize);
    ellipse(xpos+gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos-gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos-gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos+gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos +gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos -gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos +gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos -gap, mysize, mysize);
    
    
    //Layer 3
    
    ellipse(xpos+3*gap, ypos, mysize, mysize);
    ellipse(xpos, ypos+3*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos, ypos -3*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos, mysize, mysize);
    ellipse(xpos+gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos-gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos-gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos+gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos +gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos -gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos +gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos -gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos -3*gap, mysize, mysize);
    
    //Layer 4
          ellipse(xpos+4*gap, ypos, mysize, mysize);
    ellipse(xpos, ypos+4*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos, ypos -4*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos, mysize, mysize);
    ellipse(xpos+gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos-gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos-gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos+gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos +gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos -gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos +gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos -gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos -3*gap, mysize, mysize);
    
    //Layer 5
       ellipse(xpos+5*gap, ypos, mysize, mysize);
    ellipse(xpos, ypos+5*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos, ypos -5*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos, mysize, mysize);
    ellipse(xpos+gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos-gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos-gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos+gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos +gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos -gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos +gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos -gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos -5*gap, mysize, mysize);
    
    //Layer 6
    
    ellipse(xpos+6*gap, ypos, mysize, mysize);
    ellipse(xpos, ypos+6*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos, ypos -6*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos, mysize, mysize);
    ellipse(xpos+gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos-gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos-gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos+gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos +gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos -gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos +gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos -gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos +2*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos -2*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos-2*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos+2*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos-3*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos+3*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos +3*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos -3*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos +4*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos -4*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos-4*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos+4*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos-5*gap, ypos +6*gap, mysize, mysize);
    ellipse(xpos+5*gap, ypos -6*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos -5*gap, mysize, mysize);
    ellipse(xpos-6*gap, ypos +5*gap, mysize, mysize);
    ellipse(xpos+6*gap, ypos -5*gap, mysize, mysize);
    
    
    xpos = xpos+(mouseX-xpos)/control;
  ypos = ypos+(mouseY-ypos)/control;
     }
  
       if(mouseButton == RIGHT){
                  delay(20);
         
     }
     
   

  }
  

