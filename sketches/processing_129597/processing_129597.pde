
// some code altered from class examples


float timer = 0.0;
float prevX = 0.0;
float prevY = 0.0;
float myscale = 1.0;
float scalespeed = 100.0;
float radius = 100.0;
float rad = 0.0;
float s = 1;
int thickness = 2;
float center = 0.0;

void setup()
{
 size(600,600);
 colorMode(RGB);
 background(#000000);
 frameRate(30);
 center = width/ 2.0;
 prevX= center;
 prevY= center;
 
}

void draw()
{
  timer = timer + (1.0/30.0);
  println(timer);
  
  
 float ly = 0.0;
 float lx = 0.0;
 
 float endx = 600;
 float endy = 600;
  
  //lining the ellipses
  if (timer >=1.0 && timer <= 8.0)
  {
  if (timer >= 1.0 && timer < 2.0)
  {
  fill(#3333CD);
  ellipse(0,0,100,100);
  ellipse(100,0,100,100);
  ellipse(200,0,100,100);
  ellipse(300,0,100,100);
  ellipse(400,0,100,100);
  ellipse(500,0,100,100);
  ellipse(600,0,100,100);
  }
  
  else if (timer>= 2.0)
  {
  fill(#02baff);
  ellipse(0,100,100,100);
  ellipse(100,100,100,100);
  ellipse(200,100,100,100);
  ellipse(300,100,100,100);
  ellipse(400,100,100,100);
  ellipse(500,100,100,100);
  ellipse(600,100,100,100);
  }
  
  if (timer>= 3.0 && timer < 4.0)
  {
  fill(#ff9702);
  ellipse(0,200,100,100);
  ellipse(100,200,100,100);
  ellipse(200,200,100,100);
  ellipse(300,200,100,100);
  ellipse(400,200,100,100);
  ellipse(500,200,100,100);
  ellipse(600,200,100,100);
  }
  
  else if (timer >= 4.0)
  {
  fill(#FFFFFF);
  ellipse(0,300,100,100);
  ellipse(100,300,100,100);
  ellipse(200,300,100,100);
  ellipse(300,300,100,100);
  ellipse(400,300,100,100);
  ellipse(500,300,100,100);
  ellipse(600,300,100,100);
  }
  
  if (timer > 5.0)
  {
  fill(#CD5555);
  ellipse(0,400,100,100);
  ellipse(100,400,100,100);
  ellipse(200,400,100,100);
  ellipse(300,400,100,100);
  ellipse(400,400,100,100);
  ellipse(500,400,100,100);
  ellipse(600,400,100,100);
  }
  
 if (timer >= 6.0)
  {
  fill(#fe0500);
  ellipse(0,500,100,100);
  ellipse(100,500,100,100);
  ellipse(200,500,100,100);
  ellipse(300,500,100,100);
  ellipse(400,500,100,100);
  ellipse(500,500,100,100);
  ellipse(600,500,100,100);
  }
  
  if (timer > 7.0 && timer < 8.0)
  {
  fill(#8c03ff);
  ellipse(0,600,100,100);
  ellipse(100,600,100,100);
  ellipse(200,600,100,100);
  ellipse(300,600,100,100);
  ellipse(400,600,100,100);
  ellipse(500,600,100,100);
  ellipse(600,600,100,100);
  }
  } 
  
  
  //And the spinning scaling rectangles...
  else
  {
    
  timer = timer + (1.0/ 30.0);
  radius = 0.0;
  thickness = thickness + 5;
  myscale = myscale + scalespeed;
  
  if (timer > 9 && timer <20)
  {
  float spiralOffset = 10.0;
  float x = radius * cos(timer*spiralOffset);
  float y = radius * sin(timer*spiralOffset);
  
  x+= center;
  y+= center;
  
  
  rad = rad + 5.0;
  s = s + 0.001;
  fill(random(200),random(200),random(200));
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
  scale(s+1);
  
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  

  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  popMatrix();
  
   pushMatrix();
  translate(width*2, height*2);
  rotate(rad);
  scale(s);
  popMatrix();
  
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
  }
  
  else
  {
  float spiralOffset = 10.0;
  float x = radius * cos(timer*spiralOffset);
  float y = radius * sin(timer*spiralOffset);
  
  x+= center;
  y+= center;
  
  
  rad = rad - 5.0;
  s = s + 0.001;
  fill(#4bff06);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
  scale(s+1);
  
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  

  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  popMatrix();
  
   pushMatrix();
  translate(width*2, height*2);
  rotate(rad);
  scale(s);
  popMatrix();
  
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
  }
  
  if ( timer >= 30)
  {
   timer = 0.0; 
  }
  
  }
  
  
  
  
  
}


