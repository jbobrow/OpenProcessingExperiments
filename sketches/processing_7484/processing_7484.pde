
float r = 40.0;            //radius of circles
float x;                   //x-coordinate cartesian cs
float y;                   //x-coordinate cartesian cs
float k = 27.0/13.0;       //number of cusps 
float i = 0;
float x_center = 250;
float y_center = 250;

void setup()
{
  size(500,500);
  frameRate(300);
  smooth();
  background(0,0,0);
}

void draw()
{ 
  x = r*(k+1)*cos(i)-r*cos((k+1)*i);
  y = r*(k+1)*sin(i)-r*sin((k+1)*i);

  fill(66,67,66,150);
  noStroke();
  ellipse(x_center+x, y_center-y, 3, 3);
  rectMode(CENTER);
  fill(66,67,66,15);
  ellipse(x_center+x, y_center-y, 10, 10);
  
  //Radial line
  stroke(i,i+1,i,15);
  line(x_center,y_center,x_center+x,y_center-y);

  stroke(240,240,240,200);
  point(x_center+x, y_center-y);
  i += (TWO_PI)/90;
  if(i>=21*TWO_PI){
    i += (TWO_PI)/90 + random(0.01);
    stroke(random(230,255),random(245,255),random(0,50),15);
    line(x_center,y_center,x_center+x+random(-100,100),y_center-y-random(-100,100));
  }
}












