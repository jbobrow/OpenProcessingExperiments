
//copyright Leslie Bloomfield 2014 HW#5

//variables 1
float x, y, diam, speed;
color ellipse1;

//variables 2
float x2, y2, diam2, speed2;
color ellipse2;

//background color
color bgcolor;


void setup()
{
  size(400,400);
 
 //variables 1
  x = 0;
  y = 0;
  diam = 20;
  speed = 15;
  ellipse1 =  color(247, 199, 5);
  
//variables 2
  x2 = 350;
  y2 = 350;
  diam2 = 50;
  speed2 = 2;
  ellipse2 = color(255, 198, 238);
  
  //background color
  bgcolor = color(0, 244, 250);
}
 
void draw()
{
  prepareWindow();
  moveFigures();
  drawFigures();
}
 
void prepareWindow()
{
  noStroke();
  fill(bgcolor);
  rect(0, 0, width, height);
}
 
void drawFigures()
{
  ellipseMode(CORNER);
  figure(x, y, diam);
  figure(x2, y2, diam2, ellipse2);
}
 
//ellipse 1
void figure(float x, float y, float diam)
{
  noStroke();
  fill(ellipse1);
  ellipse(x, y, diam, diam);
}
 
//ellipse 2
void figure(float x2, float y2, float diam2, color ellipse2)
{
  noStroke();
  fill(ellipse2);
  ellipse(x2, y2, diam2, diam2);
}
 
void moveFigures()
{
  //ellipse 1
  if ((x < width - diam) && (y == height - height)) {
    x += speed;
  }
  else if ((x > width - width) && (y >= height - diam)) {
    x -= speed;
  }
  else if ((x >= width - diam) && (y <= height - diam)) {
    y += speed;
  }
  else if ((x <= diam) && (y > height - height)) {
    y -= speed;
  }

   
  //ellipse 2
  if ((x2 < width - diam2) && (y2 == height - height)) {
    x2 += speed2;
  }
  else if ((x2 > width - width) && (y2 >= height - diam2)) {
    x2 -= speed2;
  }
   else if ((x2 >= width - diam2) && (y2 <= height - diam2)) {
    y2 += speed2;
  }
  else if ((x2 <= diam2) && (y2 > height - height)) {
    y2 -= speed2;
  }
}



