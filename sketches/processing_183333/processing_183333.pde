
int myX;
int myY;
int myW;
int myH;
int myR;
int myG;
int myB;

void setup()
{
  size(400, 400);
  background(0);
}

void draw()
{
//random position
  myX = int(random(0,width));
  myY = int(random(0, height));
  //random dimension
  myW = int(random(5, 50));
  myH = int(random(5, 50));
  //random colour
  myR = int(random(50, 200));
  myG = int(random(50, 100));
  myB = int(random(200, 255));

 
  
  noStroke();
  fill(myR, myG, myB, 50);
  ellipseMode(CENTER);
  ellipse(myX, myY, myW, myH);
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
  println(frameCount);
  
  

}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}

