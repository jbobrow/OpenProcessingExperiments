
void setup ()
{
  size(500,400);
}
//Added floats as whole numbers used so precision is needed
float ballX = 0;
float ballY = 0;
float speedX = 10;
float speedY = 0;
//Also inclusion of whole number integers to establish the "HIT" and "MISS"
int HIT = 0;
int MISS = 0;
void draw()
{
  float racket = 100;
//Making the decision on what to execute to test if true or false
  if(ballX < 0 || ballX > width) speedX = -speedX;
  if (ballY > height){
    speedY = -speedY;
    //Calculating the absolute number of the distance the ball can go
    float distance = abs(mouseX - ballX);
    if(distance < racket) HIT += 1;
    //If the racket misses the ball one point is added to "miss"
    else MISS += 1;
  } else speedY += 1;
    
  ballX += speedX;
  ballY += speedY;
  
  //Layout of the sketch 
  background(0);
  rect(ballX, ballY, 30, 30);
  rect(mouseX-racket, height -10, 100, 15);
  
  //text placed on left hand corner to show points to the player
  text("HIT: " + HIT, 10, 20);
  text("MISS: " + MISS, 10, 40);
  
}
