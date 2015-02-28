
int ypos=25;
boolean goingDown=true;
int circleRadius=25;
int circleColor=255;


void setup() {
  size(400, 400);
  background(120, 255, 0);
  smooth();
  color(0);
  
}
void draw() {

  background(120, 255, 0);
  fill(255, circleColor, 255);
  ellipse(width/2, ypos, circleRadius, circleRadius);
  
    
    if(ypos == 12){
    goingDown=true;
    
  }
  
  if(ypos == height-12){
    goingDown=false;
    circleColor = circleColor-255;
  }
  
  
  
  if( ypos >= 12 && goingDown == true){
    ypos++;
  } 
  if( ypos <= height-12 && goingDown == false){
    ypos--;
  }
  
  
  
}  




