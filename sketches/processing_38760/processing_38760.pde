
//homework 7
//copyright EMILY SO
// display the floats

float posX, posY, speedX, speedY, dia, deCel, spaceX, spaceY;
color col;

void setup()
{
  size(400, 400);
  posX = width/2;
  posY = height/2;
  speedX = 2;
  col = color(200, 200, 200, 255);
  dia = 50;
  speedY = 2;
  deCel = .2;
}

void draw()
{
 prepScreen();
// moveCircle();
// drawCircle(); 
 initials(posX, posY, dia*2, dia);
 printedText();
 makeMove();
 stopIt();
}

//GO BACK TO THE MIDDLE
void stopIt()
{
  if (keyPressed == true)
  {
    posX = width/2;
    posY = width/2;
    speedX = 0;
    speedY = 0;
  }
// deltaX = -deltaX; 
}

//MAKE IT MOVE WITH THE MOUSE

void makeMove()
{
  spaceX = mouseX - posX;
  spaceY = mouseY - posY;
  posX = posX + speedX;
  posY = posY + speedY;
  if (posX > width + dia/2)
  {
    posX = -dia/2;
  }
  
  if (posX < -dia/2)
  {
   posX = width + dia/2; 
  }
  
  if (posY > height + dia/2)
  {
   posY = -dia/2; 
  }
  
  if (posY < -dia/2)
  {
   posY = height + dia/2; 
  }
  // MOUSE INPUT
  if (mouseX - pmouseX != 0)
  {
    speedX = mouseX - pmouseX;
   posX = posX + speedX; 
  }
//  if (mouseX - pmouseX < 1)
//  {
//   speedX = speedX*deCel; 
//  }
  if (mouseY - pmouseY != 0)
  {
   speedY = mouseY - pmouseY;
  posY = posY + speedY; 
  }
//  if (mouseY - pmouseY < 1)
//  {
//    speedY = speedY*deCel;
//  }
}


void printedText()
{
  fill(random(255), random(255), random(255));
  text("WTH IZZ THIS HORIZONTAL SPEED?!", 20, 50);
  text("WTF IS THIS VERTICAL SPEED?!", 20, 60);
  text(speedX, 250, 50);
  text(speedY, 250, 60);
}

//DRAW INITIALS
void initials(float x, float y, float wd, float ht)
{
  noFill();
  stroke(0, 155, 120);
  strokeWeight(20);
  ellipse(x, y, wd, wd);
  strokeWeight(5);

  stroke(0, 40, 60);
  ellipse(x, y, .9*wd, .9*wd);
  //"E"
  stroke(100, 20, 80);
  strokeWeight(.2*wd);

  beginShape();
  curveVertex(x - .2*ht, y - ht);
  curveVertex(x - .2*ht, y - ht);
  curveVertex(x - ht, y - ht);
  curveVertex(x - (ht+30), y - .1*wd);
  curveVertex(x - (ht-20), y - .1*wd);
  curveVertex(x - (ht-20), y - .1*wd);
  curveVertex(x - (ht+30), y+.05*wd);
  curveVertex(x - (ht+30), y+.1*wd);
  curveVertex(x - ht, y + .12*wd);
  curveVertex(x - .2*ht, y+.1*wd);
  curveVertex(x - .2*ht, y+.1*wd);
  endShape();
  //"S"
  stroke(100, 40, 140);
  beginShape();
  curveVertex(x + .3*wd, y - .8*ht);
  curveVertex(x + .3*wd, y - .8*ht);
  curveVertex(x + .25*wd, y - ht);
  curveVertex(x + .1*wd, y - .8*ht);
  curveVertex(x + .08*wd, y - .7*ht);
  curveVertex(x + .12*wd, y - .6*ht);
  curveVertex(x + .4*wd, y);
  curveVertex(x + .4*wd, y + .2*ht);
  curveVertex(x + .2*wd, y + .4*ht);
  curveVertex(x + .07*wd, y + .1*ht);
  curveVertex(x + .07*wd, y + .1*ht);
  endShape();
}
//void moveCircle()
//{
//  a = a + deltaX;
//  //toofar right
//  if(a > width + dia/2)
//  {
//    a = -dia/2;
//  }
//  if(a < -dia/2)
//  {
//   a = width + dia/2; 
//  }
//  if (dia >= width)
//  {
//    dia = dia - deltaX;
//  }
// 
//
//}
void drawCircle()
{
  fill(0, 0, 200);
  ellipse(posX, posY, dia, dia);
}
void prepScreen()
{
 fill (col);
 rect(0, 0, width, height); 
}
