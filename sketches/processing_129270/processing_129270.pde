

void setup()
{
  size(600,400); //setting the size of the frame 
} 

//setting the variables for the ball 
// the posistion of the ball 
float ballX = 400; 
float ballY = 200;
//the direction and distance the ball travels  
float speedX = 5; 
float speedY = 1;

//setting the hit and miss to 0 
int hit = 0;
int miss = 0;

void draw()
{
  if(mousePressed) { hit = 0; miss = 0; }
  float paddle = 600/(hit+10);
  
  //restricting the ball to the frame
  if(ballX < 0 || ballX > width) speedX = -speedX;
  if(ballY > height){
    speedY = -speedY;
    
    //setting ball to bounce of the paddle 
    float distance = abs(mouseX - ballX);
   
   //adds 1 point to the hit score board if paddle hits ball 
    if(distance < paddle) hit += 1;
    
   //adds 1 point to the miss score, if paddle misses ball 
    else miss += 1; 
  } else speedY += 1; 
  
  ballX += speedX;
  ballY += speedY;
  
 background(10,47,33); //setting the background colour to dark green
 fill(0,255,0); //setting the ball to light green 

 ellipse(ballX, ballY, 50, 50); // positioning the ball with the frame
 fill(0,0,200);//setting the paddle to the colour blue
 rect(mouseX-paddle,height-10, 2*paddle,10); // create the paddle 

 textSize(16); //set the size of the text 
 fill(255); //set the text colour to white
 text("hit: " + hit, 10 ,20); // print hit current score
 text("miss: " + miss, 10, 40); // print miss current score 
}


