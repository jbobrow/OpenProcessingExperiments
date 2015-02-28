
int mysize = 20;
float xpos = width/2 ;
float ypos = height/2;
int control = 30;
float rdm = random(150, 250);
float rdm2 = random(150, 250);
float rdm3 = random(150, 250);

void setup(){
  size(700,400);
  fill(0,0,0,255);
  rect(0,0,0,255);
  noStroke();
  smooth();
  frameRate(100);
  
}

void draw(){
    background(0);
     if(mouseButton == LEFT){
       fill(rdm,rdm2,rdm3, 255);
    ellipse(xpos, ypos, mysize, mysize);
    
    xpos = xpos+(mouseX-xpos)/control;
  ypos = ypos+(mouseY-ypos)/control;
     }
  
       
   

  }
  

void mousePressed(){
       rdm = random(150, 250);
       rdm2 = random(150, 250);
       rdm3 = random(150, 250);
  
  
  
}

void mouseMoved(){
  
 
  
  
}

