
int shapeSize = 50;
float posX = shapeSize, posY = 0;

int speedX = 1, speedY = 1;
int i = 230;

void setup()
{
  size(400, 400);
  background(0);
}

void draw()
{
  fill(0, 15);
  rect(0, 0, width, height);
  //sin returns a value between - 1 and 1; scale result so ellipse stays on screen along y axis
  posY = (sin(i*PI/120) + 1)*(height-shapeSize)/2+shapeSize/2;
  fill(255);
  noStroke();
  fill(posX*255/300, 0, 255-(posX*255/300), 180);
  ellipse(posX, posY, shapeSize, shapeSize);
  fill(posX*255/300, 0, 0, 180);
  ellipse(posY, posX, shapeSize, shapeSize);
  fill(255-(posX*255/300), 0, posY*255/300, 180);
  ellipse(posY, posY, shapeSize, shapeSize);
  fill((posX*255/300), 0, 255-(posX*255/300), 180);
  ellipse(width - posX, height - posY, shapeSize, shapeSize);
  fill(255-(posX*255/300), posX*255/300, 0, 180);
  ellipse(width - posY, height - posX, shapeSize, shapeSize);
  fill(0, posX*255/300, 255-(posX*255/300), 180);
  ellipse(width - posY, height - posY, shapeSize, shapeSize);
  posX += speedX;
  if (posX < shapeSize/2 || posX > width - shapeSize/2)
    speedX = - speedX;
  i = i + speedY;
  if (i <= 180 || i >= 300) 
    speedY = - speedY;
}
