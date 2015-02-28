
//suzanne choi, suzanne1, hw9
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


void setup()
{
  size(400,400);
  background(255);
  for (int a = 0; a < width; a = a+10) {
  for (int b = 0; b < height; b = b+10) {
  strokeWeight(2);
  stroke(90,90,90);
  point(a, b);}}
  
  smooth();
  for( int a = 0; a < xList.length; a++)
  {
     fill( col[a] );
     noStroke();
     rect( xList[a], yList[a], sizeList[a],sizeList[a]);
  } 
  
}




