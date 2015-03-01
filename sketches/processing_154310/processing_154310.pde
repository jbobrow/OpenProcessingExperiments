
PImage wrappingFace;
float picWidth1 = 75;
float picHeight1 = 75;

float posX1 = random(0, 400 - picWidth1);
float posY1 = random(0, 400 - picHeight1);

float xMovement1 = 5;
float yMovement1 = 2;

PImage bouncingFace;
float picWidth2 = 75;
float picHeight2 = 75;

float posX2 = random(0, 400 - picWidth2);
float posY2 = random(0, 400 - picHeight2);

float xMovement2 = 2;
float yMovement2 = 5;


void setup()
{
  size(400, 400);
  wrappingFace = loadImage("impossibru.jpg");
  bouncingFace = loadImage("impossibru.jpg");
}

void draw()
{
  background(0, 0, 0);
  image(wrappingFace, posX1, posY1, picWidth1, picHeight1);
  
  image(bouncingFace, posX2, posY2, picWidth2, picHeight2);
  
  posX1 += xMovement1;
  posY1 += yMovement1;
  
  posX2 += xMovement2;
  posY2 += yMovement2;
  
  //conditionals for wrappingFace
  if(posX1>400)
  {
    posX1 = 0;
  } 
  if(posY1>400)
  {
    posY1 = 0;
  }
  
  //conditionals for bouncingFace
  if(posX2>300)
  {
    xMovement2 *= -1;
    posX2 = 300;
  } 
  if(posX2<0)
  {
    xMovement2 *= -1;
    posX2 = 0;
  }
  if(posY2>300)
  {
    yMovement2*= -1;
    posY2 = 300;
  }
  if(posY2<0) 
  {
    yMovement2 *= -1;
    posY2 = 0;
  }
  
  //red screen for collision
  if((abs(posX1 - posX2) < 75) &&(abs(posY1 - posY2) < 75))
  {
    fill(255, 0, 0);
    rect(0, 0, 400, 400);
  }
}




