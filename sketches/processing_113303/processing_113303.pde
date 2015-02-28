
float angle = 0.5;
float timer = 0;
float ellipseX = 0.0;
void setup()
{
  size(500, 500);
  colorMode(HSB, 360,100,100);
  background(80,20,80);
  frameRate(30);
}
  
void draw()
{
  timer = timer + 0.25;
    
   
  {
  if(timer > 0.5)
   for (int i=0; i< width; i=i +1)
   {
     float percent = i/ (float) width;
     stroke(i, random(100),random(100));
     line (i,0,height,i);
   }
  }
     
   if (timer < 20)
   angle += 0.95; 
      fill(random(200),random(255),random(200));
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
    translate(250, 70);
    rotate(angle+50);
    triangle(0, 0, 50, 100,50,50);
    popMatrix();
     
      if (timer > 50)
      angle += 0.25; 
     fill(255,255,255);
    rectMode(CENTER);
    pushMatrix();
    translate(300, 400);
    rotate(angle);
    ellipse(0, 0, 50, 100);
    popMatrix();
     
  if( timer >20 && timer <45)
  {
  background(0,0,0);
  ellipseX += 5;
  if (ellipseX > width)
  {
    ellipseX = 0;
  }
  float waveSpeed = 50;
  float waveHeight = 200;
  float angle = radians(ellipseX * waveSpeed);
  float ellipseY = sin(angle) * waveHeight;
    
  
  fill(0,random(100),random(255));
  rect(height/3 + ellipseY, ellipseX , 100, 100);
  fill(random(255),50,0);
  rect(ellipseX, height/3 + ellipseY, 100, 100); 
  }
   

}



