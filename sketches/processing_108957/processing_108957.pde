
float xPos;
float yPos;
float friction;
float velocity;

void setup () {
  size(500,500);
  background(150);
  xPos = width/2;
  yPos = height/2;
  strokeWeight(5);
  friction = 100;
}


void draw () {
  
  noStroke();
  fill(150,150,150,100);
  rect(0,0,width,height);
  

  xPos += ((mouseX-(width/2))/friction);
  yPos += ((mouseY-(height/2))/friction);
  
  if(xPos > width+25){xPos = -25;}
  else if (xPos < -25){xPos = width+25;}

  if(yPos > height+25){yPos = -25;}
  else if (yPos < -25){yPos = height+25;}
  
  velocity = sqrt((mouseX-(width/2))*(mouseX-(width/2)) + (mouseY-(height/2))*(mouseY-(height/2)));
  
  stroke(255,255-(velocity/2),255-(velocity/2));
  fill(255,255-(velocity/2),255-(velocity/2));
  ellipse(xPos,yPos,50,50);
  
  
}


