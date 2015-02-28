
//Homework 10
//Copyright Lila Fagen
//Lila.Fagen@gmail.com (ldf)


color [] colList = {
  color(random(255), random(255), random(255)),
  color(random(255), random(255), random(255)),
  color(random(255), random(255), random(255)),
  color(random(255), random(255), random(255)),
  color(random(255), random(255), random(255)),
  color(random(255), random(255), random(255)),
  color(random(255), random(255), random(255)),
  color(random(255), random(255), random(255)),
  color(random(255), random(255), random(255)),
  color(random(255), random(255), random(255)),
};

float [] xList = {
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370)
};

float [] yList = {
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370),
  random(30, 370)
};
  
float [] sizeList = {
  random(10, 40),
  random(10, 40),
  random(10, 40),
  random(10, 40),
  random(10, 40),
  random(10, 40),
  random(10, 40),
  random(10, 40),
  random(10, 40),
  random(10, 40)
};

//float xvel, yvel;
float []xvel =
{
  random(2, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
};

float [] yvel=
{
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
  random(1, 10),
};

void setup ( )
{
  
// xvel = random(1,10);
// yvel = random(1,10);
 
  size (400, 400);
//  background (0, 30);
  smooth ( );
  
  for (int i=0; i < xList.length; i++)
  {
    noFill ( );
    stroke (colList[i]);
//    strokeWeight(random(1,10));
    
  }
 ellipseMode (CENTER );
}

void draw ( )
{
  background (0, 30);
  for (int i=0; i < xList.length-1; i++)
  {
    noFill ( );
    stroke (colList[i]);
    strokeWeight(random(1,10));
    ellipse(xList[i], yList[i], sizeList[i], sizeList[i]);
    
    xList[i] = xList[i] + xvel[i];
    yList[i] = yList[i] + yvel[i];
    
    if (xList[i] > width || xList[i] < 0)
    {
      xvel[i] = -xvel[i];
    }
    
    if (yList[i] > height || yList[i] < 0)
    {
     yvel[i] = -yvel[i]; 
    }
  }
}


