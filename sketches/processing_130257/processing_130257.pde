
//spiral -> bumpy circles -> squares rotate left//


float radius = 0.0;
float timer= 0.0;
int thickness = 5;
float center = 0.0;
float prevX = 0.0;
float prevY= 0.0;

float rad = 0.0;
float s =   1.0;
float rs=   1.0;
float S=    1.0;
float rad2 = 0.0;

void setup()

{ 
  size ( 500, 500); 
  colorMode ( HSB, 360, 100,100); 
  frameRate (30); 
  
  background (0,0,0);
  center = width/2;
  prevX  = center;
  prevY  = center;
  
}

void draw ()
{
 rad = rad + 0.1;
 s = s + .04;
 timer = timer + (1.0/30.0);
 println(timer);
 
 
 if (timer >=0 && timer < 6.0)
 {
 fill(random(255), random(255), random(255), random(255));
 
 pushMatrix();
 
 translate ( width/2, height/2);
 rotate(rad);
 scale(s);
 
 rectMode(CENTER);
 rect( 0, 0, 100, 100);
 
 popMatrix();
 
 pushMatrix();
 
 translate( 100,100);
 rotate(radians(45));
 scale(2);
 popMatrix();
 }
if (timer >=6.0 && timer <=7.0)
  {
     background (255,0,0);
  }
else if ( timer >= 6.0)
{
    float spiralOffset = 10.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += center;
    y += center;
     
    if (timer == 6.0)
    {
      prevX = x;
      prevY = y;
    }
    strokeWeight(thickness);
    float timerScalar = 20.0;  
    stroke(timer * timerScalar, random(255), random(255), random(255));
    line(prevX, prevY, x, y);
    prevX = x;
    prevY = y;
     
    timer = timer + (1.0 / 30.0);
    radius = radius + 1;
  }
if ( timer >= 20)
  {
    S = S+ .05;
    rad2 = rad2 + 0.1;
    fill(random(255), random(255), random(255), random(255));
 
    pushMatrix();
    translate(width/2, height/2);
    rotate(rad2);
    scale(S);
    ellipseMode(CORNER);
    ellipse(0,0,20,20);
    
    ellipseMode(CENTER);
    ellipse(0,0,20,20);
   
    popMatrix();
    pushMatrix();
   
    translate (100, 100);
    rotate(radians(45));
    scale(S);
    
   
     popMatrix();
   }

  
}


