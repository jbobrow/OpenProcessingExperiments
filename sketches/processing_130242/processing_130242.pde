
float rad = 0.0;
float s = 1;
float scale2= 1;
float NextX = 0.0;
float NextY = 0.0;
float radius = 100.0;
float timer = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
float timerScalar = 20.0;
float waveHeight = 5;
  float starty = 100.0;
   
  float ly = starty;
  float lx = 0.0;

  float endx = 500.0;
  float endy = 100.0;


void setup()
{
  size(500, 500);
  background(#000000);
  colorMode(HSB);
  frameRate(30);
  
  NextX = NextY + 1.0;
  NextY = NextX + 1.5;
  prevX= center;
  prevY= center;
  center= width / 2.0;
  
}

void draw()
{
timer = timer + (1.0/30.0);
  println(timer);
     
     float ly = 0.0;
 float lx = 0.0;
  
 float endx = 600;
 float endy = 600;

     radius = 0.0;
     thickness = thickness + 2;

  pushMatrix();
  fill(0,0,255,10);
   rad = rad + 0.1;
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  
   float timerScalar = 20.0;  
    rect(timer * timerScalar, 100, 100, 255);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  
  popMatrix();
   
  

  pushMatrix();
  fill(0,0,255,10);
   rad = rad + 0.1;
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  float spiralOffset = 10.0;
  float x = radius * cos(timer*spiralOffset);
  float y = radius * sin(timer*spiralOffset);
  
  popMatrix();

   
  if (timer > 20)
   {
     radius = 0.0;
     thickness = thickness + 2;

    x += center;
    y += center;
     
    if (timer == 0.0)
    {
      prevX = x;
      prevY = y;
    }
     
  
   }
   
if(timer > 10.0 && timer < 15.0)
{
  background(#FFFFFF);

strokeWeight(5);


  while (lx < endx)
  {
    float waveHeight = 5;
    float waveFrequency = 5;
    float nextX = lx + 1;
    float nextY = starty + waveHeight * sin(radians(lx * waveFrequency));
    line(lx, ly, nextY, nextX);
    ly = nextY;
    lx = nextX;
    
    fill(0,0,255,10);
   rad = rad + 0.1;
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  
  rectMode(CENTER);
  rect(0, 0, 100, 100);
 x = radius * cos(timer*spiralOffset);
 y = radius * sin(timer*spiralOffset);
  }


 }
 
 else if(timer > 13.0)
 {
   background(#ee9999);
   noStroke();
   fill(#FFFFFF);
   translate(0,250);
   
  if(timer >=13.0)
  {
    scale2 = scale2 * y;
  ellipse(timer*10,radius*10, 100,100);

  }
  
  else if(timer >= 16)
  {
    scale2 = scale2 / y;
 
  }
 }
}


