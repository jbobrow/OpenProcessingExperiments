
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
  
void setup() {
  size(640, 360);
  smooth();


   
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
void draw() {
  background(0);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
  
if((mouseX > rx)&&(mouseX < rd + rx)&&(mouseY > ry)&&(mouseY<ry + rd))
{
   if (mousePressed) 
   {
ex = ex+1;
    }
    else
    {
     ex = width * 0.66;
    }
  
  fill(240,0,0);
  rect(rx, ry, rd, rd);
  rx = rx-1;

  
}
else
{

  fill(0,211,0);
  rect(rx,ry,rd,rd);
  rx = width * 0.33 - rd/2;
}

float r = dist(mouseX,mouseY,ex,ey);
if (r < ed/2){
{
  if(mousePressed) 
  {
    fill(0,0,0);
    ellipse(186,155,20,20);
     fill(0,0,0);
    ellipse(236,155,20,20);
         fill(0,0,0);
    ellipse(210,195,40,55);
  }
  else
{
  fill(0,0,222);
  ellipse(ex,ey,ed,ed);
  ey = height * 0.5;
}
}
{
  color c = color(0,130,255);
  fill(c);
 ellipse(ex, ey, ed, ed);
 float s = saturation(c);
 fill(s);
  ellipse(ex, ey, ed, ed);
  ey = ey-1;
}
}
else
{
  fill(0,0,222);
  ellipse(ex,ey,ed,ed);
  ey = height * 0.5;
}

}

