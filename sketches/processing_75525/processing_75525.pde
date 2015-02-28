
float rpm = 30;
float cranklen = 50;
float rodlen = 100;

void setup()
{
  size(350,120);
  shapeMode(CENTER);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw()
{
  background(211);
  
  float minutes = norm( millis() , 0, 60.*1000.); //60s in minute, 1000ms in s
  float revolutions = lerp(0,rpm, minutes);
  float angle = lerp(0,TWO_PI, revolutions);
  
  float x = cranklen*cos(angle);
  float y = cranklen*sin(angle);
  float p = sqrt(rodlen*rodlen-y*y);
  
  float rodangle = atan2(y,p);
  
  translate(height/2,height/2); // put center of crank at (0,0)
  drawcylinder(150,0,250,80);
  
  pushMatrix(); // preserve coordinate-system
  rotate(angle);
  drawcrank(0,0,50,50);
  popMatrix(); // restore coordinate-system
  
  pushMatrix();
  translate(x+p,0); // piston AND rod position
  drawpiston(10,0,40,40);
  rotate(PI-rodangle);
  drawrod(0,0,120,10);
  popMatrix();
}


/* Color values from
  http://en.wikipedia.org/wiki/List_of_colors
*/
color   Lightsteelblue =  #B0C4DE;
color Steelblue =  #4682B4;

void drawcylinder(float x, float y, float width, float height)
{
  fill(Lightsteelblue);
  rect(x,y,width,height);
}
void drawpiston(float x, float y, float width, float height)
{
  fill(Steelblue);
  rect(x,y,width,height);
}
void drawcrank(float x, float y, float width, float height)
{
  line(x,y, x+cranklen,y);
  ellipse(x,y,cranklen*2,height);
}
void drawrod(float x, float y, float width, float height)
{
  line(x,y,x+rodlen,y);
}



