
float speedX = 10; //speed
float speedY = 10;

int directionX = 1; //Circle direction
int directionY = 1;

float CposX = width/2; //Circle starting position
float CposY = height/2;


void setup()
{
  size(800,300);
  CposX = width/2;
  CposY= height/2;
}


void draw()
{ 
  background(211);
  
  CposX += speedX * directionX; //move the ellipse
  CposY += speedY * directionY;
  
  if (CposX >= width-21) {
    background(0);
  }
  
  ellipse(CposX, CposY, 20, 20);
  
  BoundryCheck();
  Rectangle();
}
  
  
  void BoundryCheck() {
  //If the ellipse is at the boundries of the page
  //Invert the direction the ellipse is moving in
  if (CposX > width-20) {
    directionX *= -1; //directionX = directionX * -1
  }
  
  if (CposY > height-20) {
    directionY *= -1;
  }
  
  if (CposX < 20) {
    directionX *= -1;
  }
  
  if (CposY < 20) {
    directionY *= -1;
  }
  }
  
  
  void Rectangle() {
    
  int RectX = 40; //Rectangle starting position
  int RectY = 80;
    
  float RposX = width-80; //Rectangle position
  float RposY = mouseY-40;
  
  if (CposX >= RposX){ //if the circle hits the rectangle then invert the direction of the circle
    if (CposX <= RposX + 40){
      if (CposY >= RposY){
        if(CposY <= RposY + 80){
          directionX *= -1;
        }
      }
    }
  }

  rect(RposX, RposY, RectX, RectY);
   
  }
  
 
  





