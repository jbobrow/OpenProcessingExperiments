
float hue = 0;
float angle = 0;
float timer = 0;
float ellipseX = 0.0;


void setup()
{
  fill(hue,0,0);
  size(500, 500);
  colorMode(HSB, 360, 50, 50);
}

void draw()
{
 timer = timer + 0.0167;
 hue = hue + 1;
 if (hue >= 360)
 {
   hue = 0;
}

if (timer<= 8.5)
{
ellipseX += 1;
if (ellipseX > width)
  {
    ellipseX = 0;
  }
   float waveSpeed = 20;
  float waveHeight = 150;
  float angle = radians(ellipseX * waveSpeed);
  float ellipseY = sin(angle) * waveHeight;
   
  fill(hue,35,35);
  ellipse(ellipseX, height/2 + ellipseY, 100, 100);
  fill(hue,35,35);
  ellipse(height/2 + ellipseY, ellipseX, 100, 100);
   
}
if (timer >= 8.5 && timer <= 12)
{ellipseX += 2;
if (ellipseX > width)
  {
    ellipseX = 0;
  }
   float waveSpeed = 20;
  float waveHeight = 350;
  float angle = radians(ellipseX * waveSpeed);
  float ellipseY = sin(angle) * waveHeight;
   
  fill(hue,50,50);
  rect(ellipseX, height/2 + ellipseY, 100, 100);
  fill(hue,50,50);
  rect(height/2 + ellipseY, ellipseX, 100, 100);
}
if (timer >= 12 && timer <= 19)
{ellipseX += 5;
if (ellipseX > width)
  {
    ellipseX = 0;
  }
float waveSpeed = 26;
  float waveHeight = 300;
  float angle = radians(ellipseX * waveSpeed);
  float ellipseY = sin(angle) * waveHeight;
   
  fill(hue,100,100);
  ellipse(ellipseX, height/2 + ellipseY, 100, 100);
  fill(hue,100,100);
  ellipse(height/2 + ellipseY, ellipseX, 100, 100);
}
angle += 0.1;
if (timer >= 19 && timer <= 22)
{ background(hue,100,100);

 {rectMode(CENTER);
  pushMatrix();
  translate(250,250);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  
  translate(150,150);
  rotate(angle);
  fill(#000000);
  rect(0,0,50,50);
  
   translate(150,150);
  rotate(angle + 90);
  fill(#000000);
  rect(0,0,50,50);
  
   translate(150,150);
  rotate(angle + 180);
  fill(#000000);
  rect(0,0,50,50);
  
   translate(150,150);
  rotate(angle + 270);
  fill(#000000);
  rect(0,0,50,50);
  
  popMatrix();}
  
{  
  rectMode(CENTER);
  pushMatrix();
  translate(250,250);
  rotate(angle);
  fill(#000000);
  rect(0,0,50,50);
  
  translate(150,150);
  rotate(angle+ 270);
  fill(#FFFFFF);
  rect(0,0,100,100);
  
   translate(150,150);
  rotate(angle + 180);
  fill(#FFFFFF);
  rect(0,0,100,100);
  
   translate(150,150);
  rotate(angle + 90);
  fill(#FFFFFF);
  rect(0,0,100,100);
   popMatrix();
}
}
if (timer >= 22 && timer <= 22)
{
background(hue,0);
}
if (timer >= 22 && timer <= 30)
{ellipseX += 2;
if (ellipseX > width)
  {
    ellipseX = 0;
  }
   float waveSpeed = 50;
  float waveHeight = 250;
  float angle = radians(ellipseX * waveSpeed);
  float ellipseY = sin(angle) * waveHeight;
   
   stroke(hue,100,100);
  fill(#000000);
  rect(ellipseX, height/2 + ellipseY, 100, 100);
  fill(#000000);
  rect(height/2 + ellipseY, ellipseX, 100, 100);
}
}


