
float x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6;
float radius, radius2, radius3;
int x;
int y;
int c;
int h;

//int b;

//float counter = b ;

void setup()
{
  size(600, 600);
  background(255);
  frameRate(10);
  smooth();
  colorMode(HSB);

  ellipseMode(CENTER);

  radius  = 230;  //s
  radius3 = 150;  //h
  radius2 = 190;  //m
}

void draw()
{ 
  translate(300, 300);

  if (mousePressed)
  {
    rotate(radians(-90));
  }


  background(255);

  x1 = 0 + cos(radians(map(second(), 0, -60, 0, 360)))*(radius); 
  y1 = 0 + sin(radians(map(second(), 0, -60, 0, 360)))*(radius);

  x2 = 0 + cos(radians(map(minute(), 0, 60, 0, 360)))*(radius2); 
  y2 = 0 + sin(radians(map(minute(), 0, 60, 0, 360)))*(radius2);

  x3 = 0 + cos(radians(map(hour(), 0, -12, 0, 360)))*(radius3); 
  y3 = 0 + sin(radians(map(hour(), 0, -12, 0, 360)))*(radius3);

  x4 = 0 + cos(radians(map(second(), 0, 60, 0, 360)))*(radius); 
  y4 = 0 + sin(radians(map(second(), 0, 60, 0, 360)))*(radius); 

  x5 = 0 + cos(radians(map(minute(), 0, -60, 0, 360)))*(radius2); 
  y5 = 0 + sin(radians(map(minute(), 0, -60, 0, 360)))*(radius2);

  x6 = 0 + cos(radians(map(hour(), 0, 12, 0, 360)))*(radius3); 
  y6 = 0 + sin(radians(map(hour(), 0, 12, 0, 360)))*(radius3);


  pushMatrix();

  noStroke();

  //  float h = map(sin(counter), 0, 1, 0, 360);
  //  counter += 0.0006667;
  //  float b = map(sin(counter), 0, hour(), 0, 100);

  if (hour() <7)
  {
    h = 0;
  }
  else
  {
    h = 255;
  }

  if (hour() >20)
  {
    h = 0;
  }


  fill(190, 85, h);
  ellipse(0, 0, 550, 550); //Tageszeit

  fill(255);
  ellipse(0, 0, 520, 520); 

  fill(0);
  ellipse(0, 0, 500, 500);

  popMatrix();

  fill(255);
  ellipse(x1, y1, 5, 5);
  ellipse(x2, y2, 5, 5);
  ellipse(x3, y3, 5, 5);
  ellipse(x4, y4, 5, 5);
  ellipse(x5, y5, 5, 5);
  ellipse(x6, y6, 5, 5);
  ellipse(0, 0, 10, 10);

  stroke(255);
  strokeWeight(1);

  line(0, 0, x1, y1);
  line(0, 0, x2, y2);
  line(0, 0, x3, y3);
  line(0, 0, x4, y4);
  line(0, 0, x5, y5);
  line(0, 0, x6, y6);

  line(x1, y1, x2, y2);
  line(x1, y1, x3, y3);
  line(x1, y1, x4, y4);
  line(x1, y1, x5, y5);
  line(x1, y1, x6, y6); 
  line(x2, y2, x3, y3);
  line(x2, y2, x5, y5);
  line(x2, y2, x6, y6); 
  line(x3, y3, x4, y4);
  line(x4, y4, x2, y2);
  line(x4, y4, x5, y5);
  line(x5, y5, x3, y3);
  line(x6, y6, x3, y3);
  line(x6, y6, x4, y4);
  line(x6, y6, x5, y5);
}

