
float speedX = 10; //circle speed
float speedY = 5;

int score = 0;
int life = 3;

PFont f; //initialises the fonts f and f2
PFont f2;

int directionX = 1; //Circle direction
int directionY = 1;

float CposX = width/2; //Circle starting position
float CposY = height/2;


void setup()
{
  size(800,300);
  
  CposX = width/2; //starting position of the circle
  CposY= height/2;
  
  f = createFont("Arial",16,true); //define the fonts f and f2
  f2 = createFont("Arial",64,true);
}


void draw()
{ 
  background(211);
  stroke(175);
  
  textFont(f); //display how many lives are remaining
  fill(0);
  textAlign(RIGHT);
  text("Lives Remaining: " + life, 140, 20);
  text("Score: " + score, 140, 40);
  
  CposX += speedX * directionX; //move the ellipse
  CposY += speedY * directionY;
  
  if (CposX >= width-10) { //If the circle touches the right wall, the screen will flash
    background(0); //black to alert the user that a life has been lost
    life -= 1;
  }
  
  ellipse(CposX, CposY, 20, 20);
  
  BoundryCheck(); //run the BoundryCheck(), Rectangle() and Stop() routines
  Rectangle();
  Stop();
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
  
  if (CposX >= RposX){ //if the circle hits the side of the rectangle then invert the direction of the circle
    if (CposX <= RposX + 40){
      if (CposY >= RposY){
        if(CposY <= RposY + 80){
          directionX *= -1;
        }
      }
    }
  }   
  
  rect(RposX, RposY, RectX, RectY); //draw the rectangle
  }
  

void Stop() { //stopping condition (run of of lives)

 if (life <= 0) {
  background (211);
  textFont(f2);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
  text("Score: " + score, width/2, height/2 + 60);
  speedX = 0; //stop the circle so the game in the background ends
  speedY = 0;
 }
 
 if(CposX <= 10) {
   score += 1;
 }
} 
  
 
  





