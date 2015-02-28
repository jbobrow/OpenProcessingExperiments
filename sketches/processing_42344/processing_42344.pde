
int NUM_BALLS =500;
Ball[] myBall = new Ball[NUM_BALLS];
 
void setup()
{
  size (500,500);
  smooth();
  noStroke();
  frameRate(30);
  //population of an array
  for (int i = 0; i<NUM_BALLS; i++){
    myBall[i] = new Ball();
    myBall[i].posX = random(0, width);
    myBall[i].posY = random(0, height);
    myBall[i].speedX = random(0.5, 0.5);
    myBall[i].speedY = .2;
    myBall[i].myDiameter = random(7,13);
    myBall[i].colorPick = color(random(0, 255), random(0, 255), random(0, 255));
  }
}
 
   
void draw()
{
  background(0);
   
  for (int i = 0; i<NUM_BALLS; i++){
  myBall[i].update();   //object.method (calls on method that lies within the object)
  }
   
}
 
 
 
 
 
class Ball
{
  float myDiameter = 10;
  float posX = 250;
  float posY = 250;
  float speedX;
  float speedY = 0.005;
  float waver = 0;
  float accelerator = sin(random(0, PI));
  color colorPick = (#B97ADB);
   
   
  void update()
  {
    fill (colorPick);
  ellipse(posX, posY, myDiameter, myDiameter);
   
  posX+= speedX;
  speedX=random(1,7)*sin(waver);
  waver+= random(1,2);
   
   
  posY+= speedY;
  speedY+=0.05*accelerator;
   
  if (posY > height-30 || posY<0){
    posY=0;
    speedY=0;
    
  }
 
if (posX > width-30 || posX<0){
   
  speedX*=-1;
}
   
   
  }
   
   
   
   
  }

