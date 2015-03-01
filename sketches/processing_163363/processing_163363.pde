
float xPos; //xPosition
float yPos; //yPosition
float radius; //radius
float sx; //speed of x
float sy; //speed of y
float g=0.95; //gravity

void setup(){
  size (500,500);
  
  //set random variables
  
  radius=random(1,500/4);
  
  xPos=random(10,width-radius);
  yPos=random(10,height-radius);
  
  sx=random(1,10);
  sy=random(1,10);
  
  //random start
  
  ellipse(xPos,yPos,radius,radius);
}

void draw(){
  background(255, 255, 255);
  
  sy=sy+g;
  ellipse(xPos+=sx,yPos+=sy,radius,radius);
 
 // change x direction 
  if ((xPos>=width-radius/2) || (xPos<=0+radius/2)) {
    sx=sx*-1;
  }
  
 // change y direction 
  if ((yPos>=height-radius/2) || (yPos<=0+radius/2)) {
    sy=sy*-1;
    sx=sx+g;
  }
  
  if((yPos>=height-radius/2)&&(sy<=0)){
    yPos=height-radius/2;
    xPos-=sx;
  } 
  
}


