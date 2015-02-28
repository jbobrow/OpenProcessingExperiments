
float timer = 0.0;
float a = 0.0;
float s = 0.0;
float rad = 0.0;
float radius = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
 
void setup()
{
  size (500, 500);
  frameRate(30);
}
 
void draw()
{
  background(0);
   
  timer = timer + (1.0 / 30.0);
  a = a + 0.1;
  s = cos(a)*2;
  rad = rad + 1.0;
     
  if (timer >= 2.0 && timer < 5.0)
  {
   pushMatrix();
   noStroke();
   translate(250, 250);
   scale(s);
   rectMode(CENTER);
   rect(0, 0, 100, 100);
   popMatrix();
  }
  else if (timer >= 5.0 && timer < 10.0)
  {
    pushMatrix();
    noStroke();
    fill(random(255), random(255), random(255));
    translate(250, 250);
    rotate(rad);
    scale(s);
    rectMode(CENTER);
    ellipse(25, 25, 100, 100);
    popMatrix();
    
    pushMatrix();
    fill(random(255), random(255), random(255));
    translate(100, 100);
    rotate(rad);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    popMatrix();
    
    pushMatrix();
    fill(random(255), random(255), random(255));
    translate(400, 400);
    rotate(rad);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    popMatrix();
    
     pushMatrix();
    fill(random(255), random(255), random(255));
    translate(400, 100);
    rotate(rad);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    popMatrix();
    
     pushMatrix();
    fill(random(255), random(255), random(255));
    translate(100, 400);
    rotate(rad);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    popMatrix();
    
    pushMatrix();
    noStroke();
    fill(random(255), random(255), random(255));
    translate(250, 250);
    rotate(rad);
    rectMode(CENTER);
    ellipse(25, 25, 60, 60);
    popMatrix();
  }
  else if (timer >= 10.0 && timer < 15)
  {
    pushMatrix();
    noStroke();
    fill(255);
    translate(width/2, height/2);
    rotate(rad);
    rectMode(CENTER);
    triangle(77, 100, 150, 50, 100, 50);
    popMatrix();
    
    pushMatrix();
    noStroke();
    fill(random(255), random(255), random(255));
    translate(250, 250);
    rotate(rad);
    scale(s);
    rectMode(CENTER);
    ellipse(25, 25, 150, 150);
    popMatrix();
  }
  else if (timer >= 15 && timer < 20)
  { 
   pushMatrix();
   noStroke();
   fill(255);
   translate(250, 250);
   scale(s);
   rectMode(CENTER);
   rect(0, 0, 100, 100);
   popMatrix();
  }
    if (timer > 20)
   {
     timer = 0.0;
     radius = 0.0;
     thickness = thickness + 2;
   }
   
    float spiralOffset = 10.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += center;
    y += center;
     
    if (timer == 0.0)
    {
      prevX = x;
      prevY = y;
    }
     
    strokeWeight(thickness);
    float timerScalar = 20.0;  
    stroke(timer * timerScalar, 100, 100, 255);
    line(prevX, prevY, x, y);
      
    prevX = x;
    prevY = y;
     
    timer = timer + (1.0 / 15.0);
    radius = radius + 1;
}


