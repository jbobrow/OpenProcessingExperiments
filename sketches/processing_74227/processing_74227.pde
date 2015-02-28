
//kevin hyun khyun
//copyright 2012

float r, g, b; //rectangle fill color
float r2, g2, b2; //rectangle fill color
float r3, g3, b3; //rectangle fill color
float r4, g4, b4; //rectangle fill color
float rb, gb, bb; //collision color

float wd, ht; //main square dimension
float px, py; //main square start location
float pSpeed; //main sqaure speed

float twd, tht; //secondary square dimension
float tx, ty;   //secondary square start location
float tSpeed;   //secondary square speed

Random ran = new Random();



void setup()
{
  size(400, 400);
  background(255);
  smooth();
  //  noCursor();
  r = random(255);
  g = random(255);
  b = random(255); 

  r2 = random(255);
  g2 = random(255);
  b2 = random(255); 

  r3 = random(255);
  g3 = random(255);
  b3 = random(255);

  r4 = random(255);
  g4 = random(255);
  b4 = random(255);


  wd = 50; //choose even number
  ht = 50; //choose even number

  px = 200;
  py = 200;
  pSpeed = 0;
  
  tx = 100;
  ty = 100;
  tSpeed = 0;
}





void draw()
{
  prepWindow();
  bounceSquare();
  wrapSquare();
  drawSquare( px, py, wd, ht);
  drawSquare2( tx, ty, twd, tht);
}






void prepWindow()
{
  fill(255, 255, 255);
  rect(0, 0, width, height);
}


void bounceSquare()
{
  px = px + pSpeed;
  if ( px > width)
  {
    pSpeed = -pSpeed;
  }
  else if ( px < 0)
  {
    pSpeed = -pSpeed;
  }
  
  py = py + pSpeed;
  if ( py > width)
  {
    pSpeed = -pSpeed;
  }
  else if ( py < 0)
  {
    pSpeed = -pSpeed;
  }
}



//Wrap
void wrapSquare()  
{
  tx = tx + tSpeed;
  if ( tx > width + wd * 0.5)
  {
    tx = -wd * 0.5;
  }
  
  ty = ty + tSpeed;
  if ( ty > width + wd * 0.5)
  {
    ty = -wd * 0.5;
  }
}



void drawSquare(float px, float py, float wd, float ht)
{

  noStroke();
  fill(0);
  rect( px, py, wd, ht);

  //random colored squares      How to get the colors to constantly keep changing?
  fill( r, g, b);
  rect( px, py, wd/2, ht/2);  //top left
  fill( r2, g2, b2);
  rect( px, py + (wd/2), wd/2, ht/2); //bottom left
  fill( r3, g3, b3);
  rect( px + (wd/2), py, wd/2, ht/2); //top right 
  fill( r4, g4, b4);
  rect( px + (wd/2), py + (wd/2), wd/2, ht/2); //top right
}




void drawSquare2(float tx, float ty, float twd, float tht)
{

  noStroke();
  fill(0);
  rect( tx, ty, wd, ht);

  //random colored squares      How to get the colors to constantly keep changing?
  fill( r, g, b);
  rect( tx, ty, wd/2, ht/2);  //top left
  fill( r2, g2, b2);
  rect( tx, ty + (wd/2), wd/2, ht/2); //bottom left
  fill( r3, g3, b3);
  rect( tx + (wd/2), ty, wd/2, ht/2); //top right 
  fill( r4, g4, b4);
  rect( tx + (wd/2), ty + (wd/2), wd/2, ht/2); //top right
}


void keyPressed()
{
  if (keyCode == RIGHT )
  {
    pSpeed++;
  }
  if (keyCode == LEFT )
  {
    pSpeed--;
  }
  if (keyCode == UP )
  {
    tSpeed++;
  }
  if (keyCode == DOWN )
  {
    tSpeed--;
  }
  if (keyCode == 'R' )
  {
    pSpeed = 0;
    tSpeed = 0;
    px = px;
    py = py;
    tx = tx;
    ty = tx;
  }
}




