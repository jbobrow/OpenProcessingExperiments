
//Homework 9
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


void setup ( )
{
  size (400, 400);
  background (0);
  smooth ( );
  
  for (int i=0; i < xList.length; i++)
  {
    noFill ( );
    stroke (colList[i]);
    strokeWeight(random(1,10));
    ellipse(xList[i], yList[i], sizeList[i], sizeList[i]);
  }
}

