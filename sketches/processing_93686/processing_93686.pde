
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

float [ ] deltaX = {random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12)
                    };
float [ ] deltaY = {random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12),
random(0, 12), random(0, 12)};
                    
                    
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
{moveFigure();
  for(int i = 0; i < xList.length; i++)
  {
    noStroke();
    fill(col[i]);
  rect(xList[i], yList[i], zList[i], zList[i]);
 ellipse (xList[i]*.9, yList[i]*.9, zList [i]*.4, zList[i]*.4);

}}

void moveFigure()
{
  background(255);
  for(int i = 0; i < xList.length; i++)
  {
    xList[i] = xList[i] + deltaX[i];
    yList[i] = yList[i] + deltaY[i];
    if(xList[i] > width || yList[i] > height || xList[i] < 0 || yList[i] < 0)
    {
      deltaX[i] = -deltaX[i];
      deltaY[i] = -deltaY[i];
    }
  } 
}



