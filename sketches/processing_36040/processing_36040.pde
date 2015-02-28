
int mysize = 30;
float xpos = width/2 ;
float ypos = height/2;
int control = 30;
float rdm = random(150, 200);
float rdm2 = random(150, 200);
float rdm3 = random(150, 200);
int gap = 50;

void setup(){
  size(700,400);
  fill(0,0,0,255);
  rect(0,0,0,255);
  noStroke();
  smooth();
  frameRate(100);
  
}

void draw(){
    rectMode(CORNER);
    fill(0, 10);
    rect(0,0,width,height);
    
     if(mouseButton == LEFT){
       fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize, mysize);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize, mysize);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize, mysize);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize, mysize);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize, mysize);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize, mysize);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize, mysize);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize, mysize);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize, mysize);
    
    xpos = xpos+(mouseX-xpos)/control;
  ypos = ypos+(mouseY-ypos)/control;
     }
  
       
  if(mouseButton == RIGHT){
       delay(20);
     }

  }
  

void mousePressed(){
       rdm = random(150, 250);
       rdm2 = random(150, 250);
       rdm3 = random(150, 250);
       
       fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+10, mysize+10);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+10, mysize+10);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+10, mysize+10);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+10, mysize+10);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+10, mysize+10);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+10, mysize+10);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+10, mysize+10);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+10, mysize+10);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+10, mysize+10);
       
       fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+9, mysize+9);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+9, mysize+9);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+9, mysize+9);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+9, mysize+9);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+9, mysize+9);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+9, mysize+9);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+9, mysize+9);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+9, mysize+9);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+9, mysize+9);
       
       fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+8, mysize+8);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+8, mysize+8);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+8, mysize+8);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+8, mysize+8);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+8, mysize+8);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+8, mysize+8);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+8, mysize+8);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+8, mysize+8);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+8, mysize+8);
       
       fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+7, mysize+7);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+7, mysize+7);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+7, mysize+7);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+7, mysize+7);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+7, mysize+7);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+7, mysize+7);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+7, mysize+7);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+7, mysize+7);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+7, mysize+7);
       
       fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+6, mysize+6);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+6, mysize+6);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+6, mysize+6);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+6, mysize+6);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+6, mysize+6);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+6, mysize+6);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+6, mysize+6);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+6, mysize+6);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+6, mysize+6);
 
       fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+5, mysize+5);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+5, mysize+5);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+5, mysize+5);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+5, mysize+5);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+5, mysize+5);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+5, mysize+5);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+5, mysize+5);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+5, mysize+5);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+5, mysize+5);
    
        fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+4, mysize+4);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+4, mysize+4);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+4, mysize+4);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+4, mysize+4);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+4, mysize+4);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+4, mysize+4);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+4, mysize+4);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+4, mysize+4);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+4, mysize+4);
    
    fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+3, mysize+3);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+3, mysize+3);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+3, mysize+3);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+3, mysize+3);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+3, mysize+3);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+3, mysize+3);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+3, mysize+3);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+3, mysize+3);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+3, mysize+3);
  
  fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+2, mysize+2);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+2, mysize+2);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+2, mysize+2);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+2, mysize+2);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+2, mysize+2);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+2, mysize+2);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+2, mysize+2);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+2, mysize+2);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+2, mysize+2);
  
  fill(rdm,rdm2,rdm3,255);
    ellipse(xpos, ypos, mysize+1, mysize+1);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos+gap, ypos, mysize+1, mysize+1);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos+gap, mysize+1, mysize+1);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos+gap, ypos +gap, mysize+1, mysize+1);
    fill(rdm2,rdm,rdm3, 255);
    ellipse(xpos-gap, ypos -gap, mysize+1, mysize+1);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos-gap, ypos +gap, mysize+1, mysize+1);
    fill(rdm3,rdm2,rdm, 255);
    ellipse(xpos+gap, ypos -gap, mysize+1, mysize+1);
    fill(rdm2,rdm3,rdm, 255);
    ellipse(xpos, ypos -gap, mysize+1, mysize+1);
    fill(rdm3,rdm,rdm2, 255);
    ellipse(xpos-gap, ypos, mysize+1, mysize+1);
  
  
}

void mouseMoved(){
  
 
  
  
}

