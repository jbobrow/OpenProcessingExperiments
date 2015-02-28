
float angle = 0;
float s = 0.01;
float scaleSpeed = 0.1;

float hue = 0.0;
float offset = 10;

float counter = 0.0;

float rectX = 0.0;
float rectY = 0.0;
float radius = 100;






void setup()
{
  size(500, 500);
  colorMode(HSB);
    
}

void draw()
{
  rectX += 1;
  angle += 0.1;
  s += scaleSpeed;
  if (s > 2 || s < 0)
  {
    scaleSpeed = -scaleSpeed;
  }
  
  fill(hue, 255, 255);
  hue += offset;
  if(hue >= 255)
  {
    offset = -offset;
    hue = 255;
  }
  else if (hue < 0)
  {
    offset = -offset;
    hue = 0;
  }
  
 counter += 1 / 60.0;
 println(counter); 
 
 

  
  rectMode(CENTER);
  
  pushMatrix();
  translate(0, 0);
  scale(s);
  rect(0,0, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(500,0);
  scale(s);
  rect(0, 0, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(0, 500);
  scale(s);
  rect(0,0, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(500, 500);
  scale(s);
  rect(0, 0, 50, 50);
  popMatrix();
  
  pushMatrix();
   translate(width/2, height/2);
   rotate(angle);
   scale(s);
   rect(0, 0, 200, 200);
   popMatrix();
   if( counter > 5)
 {
   if(rectX > width)
   {
     rectX = 0;
   }
   
 float rectAngle = rectX * 2;
 float rectY = (height /2) + cos(radians(rectAngle)) * (height/2);
 rect(rectY, rectX, 100, 100);
 }
 

  
  
 
 
 

 
  
  
  
  
}


