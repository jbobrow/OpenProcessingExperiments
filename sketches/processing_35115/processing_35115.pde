
int mysize = 1;
float xpos = width/2 ;
float ypos = height/2;
int control1 = 100;
float rdm = random(150, 250);
float rdm2 = random(150, 250);
float rdm3 = random(150, 250);
float xpos2 = width/2 ;
float ypos2 = height/2;
float xpos3 = width/2 ;
float ypos3 = height/2;
int control2 = 100;
int control3 = 100;

void setup(){
  size(700,400);
  fill(0,0,0,255);
  rect(0,0,0,255);
  noStroke();
  smooth();
  frameRate(200);
  
}

void draw(){
  noStroke();
     fill(0,0,0,8);
       rect(0,0,width,height);
  
     if(mouseButton == LEFT){
            
       fill(rdm,rdm2,rdm3,200);
    ellipse(xpos, ypos, mysize, mysize);
    strokeWeight(3);
    stroke(rdm,rdm2,rdm3,200);
    line(mouseX, mouseY, xpos, ypos);
    
    line(xpos2+1, ypos2+1, mouseX+1, mouseY+1); 
    line(xpos2-1, ypos2+1, mouseX-1, mouseY+1);
    line(xpos2+1, ypos2-1, mouseX+1, mouseY-1);
    line(xpos2-1, ypos2-1, mouseX-1, mouseY-1);
    
     line(xpos3+1, ypos3+1, mouseX+1, mouseY+1); 
    line(xpos3-1, ypos3+1, mouseX-1, mouseY+1);
    line(xpos3+1, ypos3-1, mouseX+1, mouseY-1);
    line(xpos3-1, ypos3-1, mouseX-1, mouseY-1);
    
   xpos = xpos+(mouseX-xpos)/control1;
  ypos = ypos+(mouseY-ypos)/control1;
  
  xpos2 = xpos2+(mouseX-xpos2)/control2;
  ypos2 = ypos2+(mouseY-ypos2)/control2;
  
  xpos3 = xpos3+(mouseX-xpos3)/control3;
  ypos3 = ypos3+(mouseY-ypos3)/control3;
     }
  
       if(mouseButton == RIGHT){
         delay(20);
       }
       
   

  }
  

void mousePressed(){
  
  rdm = random(150, 250);
       rdm2 = random(150, 250);
       rdm3 = random(150, 250);
  
  
}

void mouseMoved(){
  
  
  
}

