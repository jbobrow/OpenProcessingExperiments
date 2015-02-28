
int x;
int jo;
int offset = 10; 
int z = 300;
int y = 300;
int radius = 200;

void setup() {
  size (600, 600);
  x = width/2;

  smooth();
  noFill();
}


void draw() 
{
  background(255);
  fill(125,10,10);
  noStroke();
  noStroke();
fill(180);
rect(140,0,10,600);



if (mousePressed && insideQuad(280,400,510,350,490,550,230,570)) {

  jo = 255;
}
else {
  jo = 0;
}


if (mousePressed && insideQuad(300,250,350,210,330,280,290,290)) {

  jo = 255;
}
else {
  jo = 0;
}
noStroke();
fill(180);
rect(50,0,70,600);

if (keyPressed==true && insideQuad(130,390,270,470,240,500,100,520)) {

  jo = 255;
}
else {
  jo = 0;
}
fill(jo);
fill(225);
stroke(70);
strokeWeight(30);
rect(450,50,60,60);


noStroke();
fill(180);
rect(0,400,600,150);


stroke (1);

fill(225);
stroke(130);
strokeWeight(10);
rect(100,250,260,260);

fill(110);


rect(155,305,150,150);



if(mouseX>x)
{  

  x += 3;
  offset = -10;
}
else if(mouseX<x) {
  x -= 3;
  offset = 10;
}


line(x, 0, x, height);
line(mouseX, mouseY, mouseX + offset, mouseY - 10);
line(mouseX, mouseY, mouseX + offset, mouseY + 10);
line(mouseX, mouseY, mouseX + offset*3, mouseY);
}










boolean insideQuad(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
  return insideTriangle(x0, y0, x1, y1, x2, y2) || insideTriangle(x2, y2, x3, y3, x0, y0);
}


// This method uses the Barycentric technique described here:
// http://www.blackpawn.com/texts/pointinpoly/default.html

boolean insideTriangle(float x0, float y0, float x1, float y1, float x2, float y2) {

  // Compute vectors        
  float dx0 = x1 - x0;
  float dy0 = y1 - y0;

  float dx1 = x2 - x0;
  float dy1 = y2 - y0;

  float dx2 = mouseX - x0;
  float dy2 = mouseY - y0;

  // Compute dot products
  float dot00 = dx0 * dx0 + dy0 * dy0;
  float dot01 = dx0 * dx1 + dy0 * dy1;
  float dot02 = dx0 * dx2 + dy0 * dy2;
  float dot11 = dx1 * dx1 + dy1 * dy1;
  float dot12 = dx1 * dx2 + dy1 * dy2;

  // Compute barycentric coordinates
  float invDenom = 1.0f / (dot00 * dot11 - dot01 * dot01);
  float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
  float v = (dot00 * dot12 - dot01 * dot02) * invDenom;

  // Check if point is in triangle
  return (u > 0) && (v > 0) && (u + v < 1);
}







