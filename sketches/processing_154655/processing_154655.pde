
PImage wrappingFace;
float picWidth1 = 75;
float picHeight1 = 75;

float posX1 = (200 - picWidth1/2);
float posY1 = (200 - picHeight1/2);

float xSpeed, ySpeed;
float xDirection = 1, yDirection = 1;
float changeInX = 0, changeInY = 0;
float increment = 1;
float numCollisions = 0;

//------------------------------------------
PImage bouncingFace;
float picWidth2 = 75;
float picHeight2 = 75;

float posX2 = random(0, 400 - picWidth2);
float posY2 = random(0, 400 - picHeight2);

float xMovement = random(1, 3);
float yMovement = random(4, 6);

boolean isColliding = false;



void setup()
{
  size(400, 400);
  smooth();
  wrappingFace = loadImage("impossibru.jpg");
  bouncingFace = loadImage("laugh.jpg");
}

void draw()
{
  background(0, 0, 0);
  //timer
  fill (255, 255, 0);
  text("Timer: " + ((int)(30 - (millis()/1000))) , 25, 40);
  text("Repeatedly press arrow key to increment speed", 25, 60);
  text("Press space to stop yourself", 25, 75);
  moveBouncer();
  drawBouncer();
  drawWrapper();
  moveWrapper();
  collision();
  resetPicPos();
  
  if (30 - int((millis()/1000)) <= 0)
  {
    textSize(50);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2);
    noLoop();
  }
  
  //text("Timer: " + millis()/1000/60/60 + " hr " + (millis()/1000/60)%60 + 
       //" min " + (millis()/1000)%60 + " sec", 25, 40);
}

void drawBouncer()
{ 
  image(bouncingFace, posX2, posY2, picWidth2, picHeight2);
}

void moveBouncer()
{
  posX1 += xSpeed;
  posY1 += ySpeed;
  
  posX2 += xMovement;
  posY2 += yMovement;
  
  if(posX2>300)
  {
    xMovement *= -1;
    posX2 = 300;
  } 
  if(posX2<0)
  {
    xMovement *= -1;
    posX2 = 0;
  }
  if(posY2>300)
  {
    yMovement*= -1;
    posY2 = 300;
  }
  if(posY2<0) 
  {
    yMovement *= -1;
    posY2 = 0;
  }
}

void drawWrapper()
{
  image(wrappingFace, posX1, posY1, picWidth1, picHeight1); 
}

void moveWrapper()
{
  posX1 = posX1 + changeInX;
  posY1 = posY1 + changeInY;
  
  if(posX1>400)
  {
    posX1 = 0;
  } 
  if(posY1>400)
  {
    posY1 = 0;
  }
  if(posX1<-picWidth1)
  {
    posX1 = 400;
  }
  if(posY1<-picHeight1)
  {
    posY1 = 400;
  }
}

void keyReleased()
{
  if (keyCode == UP)
  {
    changeInY = changeInY - increment;
  }
  else if (keyCode == DOWN)
  {
    changeInY = changeInY + increment;
  }
  else if (keyCode == LEFT)
  {
    changeInX = changeInX - increment;
  }
  else if (keyCode == RIGHT)
  {
    changeInX = changeInX + increment;
  }
} 


void resetPicPos()
{
  if(key == ' ')
  {
    float posX1 = (200 - picWidth1/2);
    float posY1 = (200 - picHeight1/2);
    changeInX = 0;
    changeInY = 0;
  }
}  

void collision()
{
  if((abs(posX1 - posX2) < 75) &&(abs(posY1 - posY2) < 75))
  {
    if(!isColliding)
    {
      numCollisions++;
      isColliding = true;
    }
    
  }
  else
  {
    isColliding = false;
  }
  
  fill (255, 255, 0);
  text("Number of collisions: " + (int)numCollisions, 25, 25);
    
  //red screen
  //  fill(255, 0, 0);
  // rect(0, 0, 400, 400); 
}






