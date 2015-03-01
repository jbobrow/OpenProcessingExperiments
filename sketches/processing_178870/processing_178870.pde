
float angle = 0;  //initial angle
color bg;  //backgrond color
int h;  //color hue
boolean play = true;  //allows activate/desactivate loop

void setup()
{
  size(400, 400);
  smooth();
  colorMode(HSB, 360, 100, 100);
  h = 195;
  bg = color(h, 100, 85);  
  background(bg);
  
  noStroke();
  fill(127);
}


/*-----------------------------------------------*/


void draw()
{
  fill(bg, 15);
  rect(0, 0, width, height);
  
  
  int n = 10;  //number of objects per row/column
  int p0 = 20;  //x and y of the first object
  int dp = 40;  //distance between each object on x and y
  
  for (int x = 0; x < n; x++)
  {
    for (int y = 0; y < n; y++)
    {
      rotateStar(p0 + x * dp, p0 + y * dp, angle - x - y);
    } 
  }  
  angle += radians(3);  //increment angle by 3 degrees
}


/*-----------------------------------------------*/


void rotateStar(float x, float y, float turn)
{
  int alfa = 80;  //star's transparence
  int a;  //star's size
  
  pushMatrix();
    translate(x, y);
    rotate(turn);
    
    if (degrees(turn) % 360 < 180  || degrees(turn) % 360 > 340)  //big lighter star
    {
      a = 20;
      fill(h, 30, 100, alfa);
    }
    else if (degrees(turn) % 360 > 300)  // small light star
    {
      a =10;
      fill(h, 60, 100, alfa);
    }
    else
    {
      a = 15;
      fill(h, 90, 100, alfa);
    }   
   
    star(0, 0, a);
  popMatrix();
}


/*-----------------------------------------------*/


void star(float x, float y, int radius)
{
  x -= radius;  //moves the center of the star to the right 
  int n = 10;  //number of points to construct the star (twice as points as the number of sides of the star)
  float ratio = 2./3.; //ratio between bigger and smaller radius
  float d;  //distance from each point to the center of the star
  float angle = 0;   //initial angle
  float dAngle = TWO_PI / float(n);  //angle between each point
  
  beginShape();
    for (int i = 0; i < n; i++)
    {      
      angle += dAngle;
    
      if ( i % 2 == 0) {  d = ratio * radius;  }   
      else {  d = radius;  }
    
      vertex(x + d * cos(angle), y + d * sin(angle));
    }    
  endShape(CLOSE);
}


/*-----------------------------------------------*/


void keyPressed()
{
   if (key == ' ') {  play = !play;  }
   if (play) {  loop();  }
   else {  noLoop();  }
}



