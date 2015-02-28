
//sahana kumar
//hw9


float [] xList ={
  
    random (0,100),
    random (300,300),
  random (0,100),
  random(10,20),
   random (100,300),
  random (20,100),
random(20,20),
random (100,300),
  random (20,100),
random(20,20),
};

float [] yList={
   random (90,100),
    random (10,100),
     random (20,100),
    random (200,300),
   random (0,100),
  random(10,20),
random (10,100),
    random (20,100),
   random (90,100),
  random(10,20),};
     
float [] zList ={
  
    random (0,100),
    random (0,100),
    random (0,100),
    random (0,100),
    random (0,100),
    random (0,100),
    random (0,100),
    random (0,100),
    random (0,100),
    random (0,100),
};

color [] col = 
{color(random(200), random(100), random(255)),
color(random(200), random(215), random(255)),
color(random(100), random(255), random(100)),
color(random(100), random(255), random(100)),
color(random(200), random(130), random(80)),
color(random(21), random(100), random(100)),
color(random(100), random(255), random(100)),
color(random(100), random(255), random(100)),
color(random(200), random(130), random(80)),
color(random(21), random(100), random(100))};

void setup ()
{
  size (400,400);
  background (122,209,180);
  smooth();
}

void draw ()
{
  for(int i = 0; i < xList.length; i++)
  {
    noStroke();
    fill(col[i]);
  rect(xList[i], yList[i], zList[i], zList[i]);
 ellipse (xList[i]*.9, yList[i]*.9, zList [i]*.4, zList[i]*.4);

}}


