

float xPos = 60;
float yPos = 60;
float speed = 0;
boolean direction = true;

void setup(){
  
  size(900, 900);
  frameRate(60);
  smooth();
  
}

void draw(){

  
   fill(43,43,43,75);
   rect(0,0,2000,2000); 
  
   translate(width/2,height/2);
    
   
  if(direction) {
    xPos += 1;
    yPos += 1;
  }
  else {
    xPos -= 1;
    yPos -= 1;
  }
  
  if(xPos > 300 || xPos < -300){direction=!direction;}
  
  speed += 0.04;
  
  rotate(speed);
  
  

  //background(20);

  //xPos += 1.0;

  noStroke();
  fill(255,200,200);
  rect(xPos, yPos, 40, 40);
  
}


