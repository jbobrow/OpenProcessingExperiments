
float angle = 0.0;
float timer = 0;
float ellipseX = 0.0;
void setup()
{
  size(500, 500);
}
 
void draw()
{
  timer = timer + 0.5;
   
  
 {
  if(timer > 0.5)
   background(random(50),random(50),random(50));
}
    
   if (timer > 20)
   angle += 0.95;  
      fill(random(255),random(255),random(255));
    rectMode(CENTER);
    pushMatrix();
    translate(250, 250);
    rotate(angle);
    rect(0, 0, 50, 100);
    popMatrix();
    if (timer > 30)
    angle += 0.5;  
   fill(0,0,0);
   
    rectMode(CENTER);
    pushMatrix();
    translate(100, 100);
    rotate(angle+50);
    rect(0, 0, 50, 100);
    popMatrix();
    
      if (timer > 50)
      angle += 0.25;  
     fill(255,255,255);
    rectMode(CENTER);
    pushMatrix();
    translate(400, 400);
    rotate(angle-50);
    rect(0, 0, 50, 100);
    popMatrix();
    
    
  ellipseX += 5; 
  if (ellipseX > width)
  {
    ellipseX = 0;
  }
  float waveSpeed = 50;
  float waveHeight = 200;
  float angle = radians(ellipseX * waveSpeed);
  float ellipseY = sin(angle) * waveHeight;
   
 
  fill(0,0,255);
  rect(height/3 + ellipseY, ellipseX , 100, 100);
  fill(255,0,0);
  rect(ellipseX, height/3 + ellipseY, 100, 100);

   
  }
   
  





