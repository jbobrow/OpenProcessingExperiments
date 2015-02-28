
//suzanne choi, suzanne1, hw10
//copyright 2013 suzanne choi. all rights reserved.

color [ ] col={
  color(100, random(255),random(255)),
  color(150, random(255),random(255)),
  color(200, random(255),random(255)),
  color(250, random(255),random(255)),
  color(random(255), random(255),200),
  color(random(255), random(255),150),
  color(random(255), random(255),100),
  color(random(255), 100,random(255)),
  color(random(255), 200,random(255)),
  color(random(255), 150,random(255)) 
};

float [ ] sizeList={
  random(10,40),
  random(10,40),
  random(10,40),
  random(10,40),
  random(10,40),
  random(10,40),
  random(10,40),
  random(10,40),
  random(10,40),
  random(10,40)  
};

float [ ] xList = {
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380)
};

float [ ] yList = {
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380),
  random(10, 380)
};

float [] deltaX={
  random(0,5),random(0,5),
  random(0,5),random(0,5),
  random(0,5),random(0,5),
  random(0,5),random(0,5),
  random(0,5),random(0,5)
};

float [] deltaY={
  random(0,5),random(0,5),
  random(0,5),random(0,5),
  random(0,5),random(0,5),
  random(0,5),random(0,5),
  random(0,5),random(0,5)
};

void setup()
{
  size(400,400);
  background(255);
}

void draw()
{
  drawSquare();
  moveSquare();
  smooth();
}


void drawSquare()
{
background(255);
  for (int a = 0; a < width; a = a+10) {
  for (int b = 0; b < height; b = b+10) {
  strokeWeight(2);
  stroke(90,90,90);
  point(a, b);}}
  
  for( int a = 0; a < xList.length; a++)
  {
     fill( col[a] );
     noStroke();
     rect( xList[a], yList[a], sizeList[a],sizeList[a]);
  } 
   
  
}

void moveSquare()
{

for (int a=0; a<xList. length; a++)
 {
 xList[a]=xList[a]+deltaX[a];
 yList[a]=yList[a]+deltaY[a]; 
 
 if(xList[a] > width || yList[a] > height || xList[a] < 0 || yList[a] < 0)
    {
      deltaX[a] = -deltaX[a];
      deltaY[a] = -deltaY[a];
    }

 }

 
}





