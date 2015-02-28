
int xPos = 50;
int xSpeed = 3 ;
int yPos = 50;
int ySpeed = 6;

float mappedColor;


void setup(){
  size (800,600);
  
 
}
 
void draw(){
  mappedColor = map(mouseY,0,height,0,255);
  background (mappedColor,100,100);
   
  //DEFINES BOUNDARIES OF BALL
     if(xPos>=780 || xPos<=20){    //X-Position
    xSpeed = xSpeed*-1;
  }
   
  if(yPos>=height || yPos<=0){  //Y-Position
    ySpeed = ySpeed*-1;
  }
   
   
     

   
  yPos+=ySpeed;
  xPos+=xSpeed;
   
  smooth();
   
  ellipse(xPos, yPos, 20, 20);
  
  rect(0, mouseY, 20, 80);
  
}
   

  
   

 


    





