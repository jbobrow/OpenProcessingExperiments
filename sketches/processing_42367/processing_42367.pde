



//moving balls with oop

int NUM_BALLS = 200;

//create an empty array called myBalls
//that can contain NUM_BALLS objects of the class Ball

Ball [] myBalls = new Ball [NUM_BALLS];


void setup ()
{
  size (700, 700);
  smooth ();
  noStroke ();
 
 //population
 for (int i = 0; i<NUM_BALLS; i++)
 {
   myBalls [i] = new Ball();
   
   myBalls [i]. posX = random (0, width);
   myBalls [i]. posY = random (0, height);
 }

}

void draw ()
{
  background (0);
  
for (int i = 0; i<NUM_BALLS; i++)
 {
   myBalls[i].update();
 }
}

class Ball
{
  //properties
  int myDiameter = 5;
float posX = 250;
float posY = 250;
float speedX = 1;
float gravity= 0.01;

//method
void update()
{
  fill (255);
    ellipse (posY, posX, 1, 1);
    
    fill (255, 255, 255);
ellipse (posY, posX+100, myDiameter+2, myDiameter+2);

    fill (255, 255, 255, 65);
ellipse (posY+ 100, posX, 3, 3);


  posX += speedX +0.01;
  posY += speedX +0.02;
speedX = speedX + gravity;
  
  if(posX > width)
  {
  posX = 0;
  speedX = speedX *-1;
}

if (posY > height)
{
  speedX = speedX * -0.9;
}
}
}

