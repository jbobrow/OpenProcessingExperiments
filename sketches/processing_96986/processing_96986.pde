

float pX = 400;
float vX = 3;
float pY = 100;
float vY = 3;
int value= 0;

void setup(){
  size(500,400);
}

void draw(){
  background(171,232,226);
  
  pX = pX + vX;
  pY = pY + vY;
  
  if (pX + 20 > width) {
 
    vX = -vX;
    pX = width -20;
  } 
   if (pX-20 <0) { 
    vX = -vX;
    pX = 20;
  }

    if (pY + 20 > height) {
      
    vY = -vY;
    pY = height -20;
  } 
   if (pY-20 <0) { 
     vY = -vY;
    pY = 20;
  }
  
  if((mouseX < width/2) || (mouseY > height/2)){ 
    ellipse(pX,pY,50,50);
    stroke(247,20,20);
    strokeWeight(4);
    fill(232,216,42);
    
  } else {
    ellipse(pX,pY,80,40);
    stroke(45,198,22);
    strokeWeight(4);
    fill(15,76,149);
    
  }
}

void mousePressed() {
  if (value == 0) {
     ellipse(pX,pY,50,50);
    stroke(247,20,20);
    strokeWeight(4);
    fill(232,216,42);
  } else {
    ellipse(pX,pY,80,40);
    stroke(45,198,22);
    strokeWeight(4);
    fill(15,76,149);
  }
}


