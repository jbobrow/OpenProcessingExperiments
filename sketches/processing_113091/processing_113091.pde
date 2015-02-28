
PImage pic1;
PImage pic2;
PImage pic3;
PImage pic4;
PImage pic5;
PImage pic6;
float timer = 0;
float ellipseX = 0;
float ellipseY3 = 0;
float hue = 0;
float offset = 10;
float angle = 0;
float s = 1;
float degrees = radians(45);
float picSizeX = 500;
float picSizeY = 500;

void setup()
{
  size(500, 500);
  colorMode(HSB, 350, 100, 100);
  pic1 = requestImage("polor1.jpg.jpg");
  pic2 = requestImage("polor2.jpg.jpg");
  pic3 = requestImage("polor3.jpg.jpg");
  pic4 = requestImage("polor4.jpg.jpg");
  pic5 = requestImage("polor5.jpg.jpg");
  pic6 = requestImage("polor6.jpg.jpg");  
}

void draw()
{
    timer += .2;
    angle += 0.1;
    s += .01;
    picSizeX += -.3;
    picSizeY += -.3;
    
 hue += offset;
  if (hue >= 360)
  {
   offset = -offset;
  hue = 360; 
  }
  
  else if (hue < 0)
  {
   offset = -offset;
  hue = 0; 
  }
  
   background(hue, 100, 100);
//----------------------------   
if (timer < 10)
{
  if (pic1.width > 0)
  {
    image(pic1, 0, 0, picSizeX, picSizeY);
  }
}
//-----------------------------
if (timer > 10)
{
  if (pic2.width > 0)
  {
    image(pic2, 0, 0, picSizeX, picSizeY);
  }
}
//------------------------------
if (timer > 20)
{
  if (pic3.width > 0)
  {
    image(pic3, 0, 0, picSizeX, picSizeY);
  }
}
//-------------------------------
if (timer > 30)
{
  if (pic4.width > 0)
  {
    image(pic4, 0, 0, picSizeX, picSizeY);
  }
}
//--------------------------------
if (timer > 40)
{
  if (pic5.width > 0)
  {
    image(pic5, 0, 0, picSizeX, picSizeY);
  }
}
//---------------------------------
if (timer > 50)
{
  if (pic6.width > 0)
  {
    image(pic6, 0, 0, picSizeX, picSizeY);
  }
}
//----------------------------------
if (timer > 60)
{

  fill(random (50));
  rectMode(CENTER);
  rect(0, 0, height*2 , width*2);

// circles------------------------

  ellipseX +=1;
  ellipseY3 +=1;
  
  if (ellipseX > width)
  {
   ellipseX = 0; 
  }
  
  if(ellipseY3 > height)
  {
    ellipseY3 = 0;
  }
  
  fill (hue, 100, 100);
  
  float curve = ellipseX *4;
  float ellipseY = (height/2 + sin(radians(curve)) * 200);
  ellipse(ellipseX, ellipseY, 100, 100);
  ellipse(ellipseY, ellipseY, 100, 100);
  
  float curve2 = ellipseX *16;
  float ellipseY2 = (height/2 + cos(radians(curve2)) * 100);
  ellipse(ellipseX, ellipseY2, 100, 100);
  
  float curve3 = ellipseY3 *4;
  float ellipseX3 = (height/2 + sin(radians(curve3)) * 200);
  ellipse(ellipseX3, ellipseY3, 100, 100);
  
  float curve4 = ellipseY3 *16;
  float ellipseX4 = (height/2 + sin(radians(curve4)) * 100);
  ellipse(ellipseX4, ellipseY3, 100, 100);
}

if (timer > 120)
{
 if (s > 6 || s < 0)
  {
    s = 0;
  } 

  pushMatrix();
 
  translate(width/2, height/2);
  rotate(angle);
  scale(s);
  rect(0, 0, 50, 50);
  
  popMatrix();
}

if (timer > 160)
{
}

}


