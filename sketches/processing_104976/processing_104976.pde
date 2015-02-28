
//Ball Bounce
//Lucy Morcos
//Jul 30, 2013
//got by with a little help from openprocessing.com/sketch/67284

float xPos; //x position of ball
float yPos; //y position of ball
float h=50; //length/width of ball

float speedY = 2; //speed of y of ball

void setup(){
  size(700,500);
  xPos = 100;
  yPos = 0;
 
 noStroke();
 ellipseMode(CORNER); //grabs ellipse from corner
  
  
  
}

void draw(){
  background(255);
  fill(255,0,0);
  
  ellipse(xPos,yPos,h,h); //current position of ball
  
  speedY = speedY + 0.5; //adds gravity by progressively increasing the speed
  
  yPos = yPos + speedY; //this then adds the speed to the y position of the ball
  
  
  if(yPos > height - h){
    
    yPos = height - h; 
    //^^if y position is greater than the height of canvas minus
    //the height of, then move it to that spot which loops
    
    speedY = speedY * -0.9;//speed 90% of what it was opposite direction
    
    xPos+=3;
    
    
    
  
}

else if (yPos <= 0) {
    // if the ball hits the top, bounces off
    speedY = -speedY;
  }
 
   
}
