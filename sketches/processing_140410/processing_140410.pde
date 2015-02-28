
// Samantha Chiu 2014
// press space to start, press any other key to stop
//hw8

final int m = 200;
int [] xVals = new int [m];
int [] yVals = new int [m];
int [] topVals = new int [m];
color [] colorVals = new color[m];
int [] xPos = new int [m];
int [] yPos = new int [m];
float d;
 
void setup()
{
  size(600,400);
  noStroke();
  smooth();
  rectMode(CENTER);
  initColorArray( colorVals );
  d = random(5,50); 
  for (int i = 0; i < m; i++) {
    { xVals[i] = int(random(d , 100));
      yVals[i] = int(random(d, 100));
      xPos[i] = int (random(4,10));
      yPos[i] = int (random(1,5));       
    }
  }
}
 
void initColorArray (color [] colorVals)
{for (int i = 0; i < colorVals.length; i++)
    colorVals [i] = color( random( 255 ), random( 255 ), random( 255 ) );
}
 
void initTopVal (int [] topVals)
{
  for (int i = 0; i < topVals.length; i++)
   topVals[i] = int (random (d, width));
}
 
void draw()
{
  background(107,223,234);
  for (int i = 0; i < m; i++)
  {
    noStroke();
      fill(random(255),random(255), random(255));
      stroke(255);
    noStroke();
    ellipse(xVals[i], yVals[i], d, d);
      fill(colorVals[i]);
    triangle(xVals[i], yVals[i], d/3, d/2, 10, 50);      
    if (xVals[i] > width - d || xVals[i] < d) {
      xPos[i] = -xPos[i];
    }
 
    if (yVals[i] > height - d || yVals[i] < d) {
      yPos[i] = -yPos[i];
    }
    xVals[i] += xPos[i];
    yVals[i] += yPos[i];
}
}
 

 
void keyPressed() {
  if (key == ' ') {
    setup();
  }
  else {
    exit();
  }
}

