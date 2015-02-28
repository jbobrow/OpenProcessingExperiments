
float x = 0;
float speed = 10;
color circleColor;
int colorTimer;
PImage redHawk;
PImage mitsu;
PImage oni;
boolean alreadyBlurred = false;

void setup()
{
  size(400, 400);
  frameRate(30);
  redHawk = requestImage("luffy_red_hawk.jpg");
  mitsu = requestImage("Mitsurugi.jpg");
  oni = requestImage("Oni.jpg");
}

void draw()
{
 //background(0,0,0);
 if(redHawk.width > 0)
 {
   if(!alreadyBlurred)
   {
   redHawk.filter(BLUR, 10);
   alreadyBlurred = true;
   }
  image(redHawk, 0, 0, width, height);
 }
 
 if(mitsu.width > 0)
 {
   image(mitsu, 0, 200, 100, 100);
 }
 if(oni.width > 0)
 {
   image(oni, 300, 200, 100, 100);
 }
 
 int xx = 0;
 while(xx < width)
 {
   stroke(255,0,0);
   line(xx, 0, xx, height);
   xx += 10;
 }
 
  for(int yy = 0; yy < height; yy += 10)
 {
   stroke(0,255,0);
   line(0, yy, width, yy);
 }
 
  /*colorTimer += 1;
  if(colorTimer > 10)
  {
    colorTimer = 0;
  }
  
 float radius = 50;
if(x < radius)
 {
  speed = 9;
  fill(255, 0, 0);
 } 
 else if(x >= width - radius)
 {
  speed = -10;
   fill(0, 0, 255);
 }
 else
 {
   if(x % colorTimer == 0)
   {
   circleColor = color(random(255), random(255), random(255));
   }
   fill(circleColor);
 } 
 
 if((x > 200 || x < 50) && 10 == speed)
 {
   fill(255, 0, 255);
 }
 
 x += speed;
 
  ellipse(x, height/2, 100, 100);*/
  //ellipse(x, height/2, x, x);
 
  stroke(#21DBD6);
  strokeWeight(10);
  float ly = 225.0;
  float lx = 100.0;
  while(lx < 250)
  {
    float nextX = lx + 100;
    float nextY = ly + random(-10, 5);
    /*line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;*/
    if (nextY > 250 + 10)
    {
      nextY = 250;
    }
    else if (nextY < 250 - 10)
    {
      nextY = 250;
    }
 
    if (nextX > 300)
    {
      nextY = 300;
    }
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }

  fill(20, 30, 45);
  strokeWeight(1);
  
  /*ly = 0.0;
  lx = 100.0;
  while(lx > 0)
  {
    float nextX = lx - 1;
    float nextY = ly + random(4);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(1);*/
}


