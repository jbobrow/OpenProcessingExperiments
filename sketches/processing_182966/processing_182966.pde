
int myX;
int myY;
int myW;
int myH;
int myR;
int myG;
int myB;
int myO;
void setup()
{
  size(400, 400);
  background(255);
}

void draw()
{
// code that happens every frame
  fill(myR, myG, myB);
  rectMode(CENTER);
  rect(myX, myY, myW, myH);
    //random position
  myX = int(random(0,width));
  myY = int(random(0, height));
  //random dimension
  myW = int(random(5, 50));
  myH = int(random(5, 50));
  //random colour
  myR = int(random(0, 255));
  myG = int(random(0, 0));
  myB = int(random(0, 255));
  myO = int(random(0, 100));
  println(myX, myY);
  
  fill(myR, myG, myB, 50);
  rectMode(CENTER);
  rect(myX, myY, myW, myH);
  
}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{

  
// code that happens when the mouse button
// is pressed
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}



