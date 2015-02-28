
int angle_deg;
float xValue;
float yValue;
int graphheight;

void setup()
{
  size(500,500);
  background(255);
  smooth();
  angle_deg = 0;
  frameRate(6);  // update the screen 6 times a second

}


void draw()
{
  fill(255);
  strokeWeight(1);
  stroke(0);
  ellipse(100,100,100,100);  // Draw the outline for the Unit circle
  line(50,100,150,100);
  line(100,50,100,150);
 
  line(50,300,410,300);
  stroke(0,255,0);
  line(50,250,410,250);
  line(50,350,410,350);
 
 
  strokeWeight(2);
  angle_deg = angle_deg+5;
  if (angle_deg >= 360)
  {  
    angle_deg = 0;
    background(255);
  }
  xValue = 100+50*cos(angle_deg/180.0*PI);  // calculate the triangle width
  yValue = 100-50*sin(angle_deg/180.0*PI);  // calculate the triangle height
  
  stroke(0,255,0); // set pen to green
  line(100,100,xValue,yValue);     // draw radius
  
  stroke(0,0,255);  // set pen to blue
  line(xValue,100,xValue,yValue);   // draw triangle height
  point(50+angle_deg,200+yValue);   // draw the sine wave
  if (angle_deg > 90)
  {
    fill(0,0,255);
    text("sin",130,250);
  }
  
  stroke(255,0,0);  // set pen to red
  line(100,100,xValue,100);   // draw triangle width
  point(50+angle_deg,400-xValue);  // draw the cosine wave
  if (angle_deg > 180)
  {
    fill(255,0,0);
    text("cos",220,350);
  }

  
  
  
  
  
}

