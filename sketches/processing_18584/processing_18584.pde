
void setup() 
{
  size(250, 250); 
  noStroke();
  ellipseMode(CENTER);
  smooth();
}

void draw() 
{   
  background(255); 
  
  fill(255,0,0,50); //pure red with 50%  opacity
  ellipse(mouseX-50, 220, mouseY/2, mouseY/2); 
  //position 50 to left of mouse position with static y-position
  //diameter of ellipse based half the height of mouse position
  
  fill(0,0,255,50); //pure blue with 50% opacity
  ellipse(mouseX-50,150,mouseY,mouseY);
  //position 50 to the left of mouse position with static y-position
  //diameter of ellipse based on the height of mouse position
  
  fill(0,255,0,50); //pure green with 50% opacity
  ellipse(mouseX-50,50,mouseY*2,mouseY*2);
  //position 50 to the left of mouse position with static y-position
  //diameter of ellipse based on double the height of mouse position
 
  
  fill(0,255,255,50); //pure cyan with 50% opacity
  ellipse(mouseX+50, 220, mouseY*2, mouseY*2);
  //position 50 to the right of mouse position with static y-position
   //diameter of ellipse based on double the height of mouse position
  
  fill(255,255,0,50); //pure yellow with 50% opacity
  ellipse(mouseX+50,150,mouseY,mouseY);
  //position 50 to the right of mouse position with static y-position
  //diameter of ellipse based on the height of mouse position
  
  fill(255,0,255,50);
  ellipse(mouseX+50,50,mouseY/2,mouseY/2);
  //position 50 to right of mouse position with static y-position
  //diameter of ellipse based half the height of mouse position  
}

//all elipse made of pure colour in RGB and CMY mixing, 
//when overlap mix to create other pure colours


