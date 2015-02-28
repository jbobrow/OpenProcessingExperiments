
int myDiameter = 3;
float posX = 0;
float posY = 0;
float posX1 = 0;
float posY1 = 0;
float posX2 = 0;
float posY2 = 0;
float posX3 = 0;
float posY3 = 0;
float posX4 = 0;
float posY4 = 0;
float posX5 = 0;
float posY5 = 0;
float posX6 = 0;
float posY6 = 0;
float posX7 = 0;
float posY7 = 0;
float posX8 = 0;
float posY8 = 0;
float posX9 = 0;
float posY9 = 0;
float X = 0;
float Y = 0;
float X1 = 0;
float Y1 = 0;
float X2 = 0;
float Y2 = 0;
float X3 = 0;
float Y3 = 0;
float X4 = 0;
float Y4 = 0;
float X5 = 0;
float Y5 = 0;
float X6 = 0;
float Y6 = 0;
float X7 = 0;
float Y7 = 0;
float X8 = 0;
float Y8 = 0;
float X9 = 0;
float Y9 = 0;
float fRed = random(50, 255);
float fGreen = random(50, 255);
float fBlue = random(50, 255);

void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  background(0, 0, 0);
  frameRate(60);
}

void draw()
{
  fill( 0, 0, 0, 4);
  rect(0, 0, width, height);
  fill(fRed, fGreen, fBlue);
  float dx = mouseX - posX;
  float dy = mouseY - posY;
  posX = (mouseX + 6 * random(0, dx));
  posY = (mouseY + 6 * random(0, dy));  
  ellipse(posX, posY, myDiameter, myDiameter);
  posX1 = (mouseX + 6 * random(0, dx));
  posY1 = (mouseY + 6 * random(0, dy));  
  ellipse(posX1, posY1, myDiameter, myDiameter);
  posX2 = (mouseX + 6 * random(0, dx));
  posY2 = (mouseY + 6 * random(0, dy));  
  ellipse(posX2, posY2, myDiameter, myDiameter);
  posX3 = (mouseX + 6 * random(0, dx));
  posY3 = (mouseY + 6 * random(0, dy));  
  ellipse(posX3, posY3, myDiameter, myDiameter);
  posX4 = (mouseX + 6 * random(0, dx));
  posY4 = (mouseY + 6 * random(0, dy));  
  ellipse(posX4, posY4, myDiameter, myDiameter);
  posX5 = (mouseX + 6 * random(0, dx));
  posY5 = (mouseY + 6 * random(0, dy));  
  ellipse(posX5, posY5, myDiameter, myDiameter);
  posX6 = (mouseX + 6 * random(0, dx));
  posY6 = (mouseY + 6 * random(0, dy));  
  ellipse(posX6, posY6, myDiameter, myDiameter);
  posX7 = (mouseX + 6 * random(0, dx));
  posY7 = (mouseY + 6 * random(0, dy));  
  ellipse(posX7, posY7, myDiameter, myDiameter);
  posX8 = (mouseX + 6 * random(0, dx));
  posY8 = (mouseY + 6 * random(0, dy));  
  ellipse(posX8, posY8, myDiameter, myDiameter);
  posX9 = (mouseX + 6 * random(0, dx));
  posY9 = (mouseY + 6 * random(0, dy));  
  ellipse(posX9, posY9, myDiameter, myDiameter);
  ///herpderpderp negatives
  X = (mouseX - 6 * random(0, dx));
  Y = (mouseY - 6 * random(0, dy));  
  ellipse(X, Y, myDiameter, myDiameter);
  X1 = (mouseX - 6 * random(0, dx));
  Y1 = (mouseY - 6 * random(0, dy));  
  ellipse(X1, Y1, myDiameter, myDiameter);
  X2 = (mouseX - 6 * random(0, dx));
  Y2 = (mouseY - 6 * random(0, dy));  
  ellipse(X2, Y2, myDiameter, myDiameter);
  X3 = (mouseX - 6 * random(0, dx));
  Y3 = (mouseY - 6 * random(0, dy));  
  ellipse(X3, Y3, myDiameter, myDiameter);
  X4 = (mouseX - 6 * random(0, dx));
  Y4 = (mouseY - 6 * random(0, dy));  
  ellipse(X4, Y4, myDiameter, myDiameter);
  X5 = (mouseX - 6 * random(0, dx));
  Y5 = (mouseY - 6 * random(0, dy));  
  ellipse(X5, Y5, myDiameter, myDiameter);
  X6 = (mouseX - 6 * random(0, dx));
  Y6 = (mouseY - 6 * random(0, dy));  
  ellipse(X6, Y6, myDiameter, myDiameter);
  X7 = (mouseX - 6 * random(0, dx));
  Y7 = (mouseY - 6 * random(0, dy));  
  ellipse(X7, Y7, myDiameter, myDiameter);
  X8 = (mouseX - 6 * random(0, dx));
  Y8 = (mouseY - 6 * random(0, dy));  
  ellipse(X8, Y8, myDiameter, myDiameter);
  X9 = (mouseX - 6 * random(0, dx));
  Y9 = (mouseY - 6 * random(0, dy));  
  ellipse(X9, Y9, myDiameter, myDiameter);
  
}

void mousePressed() {
  fRed = random(50, 255);
  fGreen = random(50, 255);
  fBlue = random(50, 255);
}


