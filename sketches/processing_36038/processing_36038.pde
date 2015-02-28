
int mysize = 20;
float xpos = width/2 ;
float ypos = height/2;
int control = 100;

void setup(){
  size(700,400);
  fill(0,0,0,255);
  rect(0,0,0,255);
  noStroke();
  smooth();
  frameRate(5000);
  
}

void draw(){
     fill(0,0,0,10);
       rect(0,0,width,height);
  
     if(mouseButton == LEFT){
       fill(255,255,255, 180);
    ellipse(xpos, ypos, mysize, mysize);
    
    xpos = xpos+(mouseX-xpos)/control;
  ypos = ypos+(mouseY-ypos)/control;
     }
  
       
   

  }
  

void mousePressed(){
  
  
  
  
}

void mouseMoved(){
  
  
  
}

