
float [] xPos= new float[0];
float [] yPos= new float[0];
float [] xVel= new float[0];
float [] yVel= new float[0];
float [] partSize= new float[0];

float xPosition = 25; 
float yPosition = 25;
float xSpeed = 4;
float ySpeed = 4;


void setup(){
  
  size(600,600);
  noStroke();
  
}


void draw(){
  
  background(0);
  
    
    fill(230,230,255);
    ellipse(xPosition, yPosition, 50, 50);
    xPosition = xPosition + xSpeed;
    yPosition=  yPosition + ySpeed;
   
     if (xPosition>575) {
    xSpeed= -4;
  }
  else if (xPosition<25) {
    xSpeed= 4;
  }
  
    yPosition = yPosition + ySpeed;
  
  if (yPosition>575) {
    ySpeed = -4;
  }
  
  else if (yPosition<375){
   ySpeed=4; 
  }

  
  fill(255,255,255);
  ellipse(300,300,100,100);
  ellipse(300,435,170,170);
  fill(255,0,0);
  triangle(290,300,300,330,310,300);  
  fill(0);
  ellipse(280,290,10,10);
  ellipse(320,290,10,10);
    ellipse(270,310,7,7);
    ellipse(275,325,7,7);
    ellipse(285,334,7,7);
    ellipse(300,337,7,7);
    ellipse(315,335,7,7);
    ellipse(325,324,7,7);
    ellipse(330,310,7,7);
    
  ellipse(300,397,10,10);
    ellipse(300,430,10,10);
      ellipse(300,460,10,10);


   
 // bthese make the new particles 
 
  xPos= append (xPos, random(0,600));
  yPos= append (yPos, 0);
  xVel= append (xVel, random(-2,2));
  yVel= append (yVel, random(-2,2));
  partSize= append (partSize, random (0, 10));
  
  fill(230,230,255);
  
  for(int i= 0; i< xPos.length; i++){
   ellipse(xPos[i], yPos[i], partSize[i], partSize[i]);
  
  xPos[i] += xVel[i];
  yPos [i]+= yVel [i];

  yVel[i] += 0.01; 
  
  
  }
  
  //checks to see how many particles there are and if more than 200 gets rid of particles
  if (xPos.length>200){
   xPos= subset (xPos,1);
   yPos= subset(yPos,1); 
   xVel= subset (xVel,1);
   yVel= subset(yVel,1); 
   partSize= subset(partSize,1);
    
    
  }
  
 
  
}


