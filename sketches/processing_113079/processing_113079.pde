
float x;
float y;
float timer;
float hue = 0;
float center = 0;
float spiral = 10;
float radius = 0;
float centX = 0;
float centY = 0;
float angle = 0.0;
float ellipseX = 0.0;
float a = 0.0;
float s = 0.0;
float r = 0.0;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(60);  
}

void draw()
{
  if (hue >= 360)
  {
    hue = 0;
  }
  if(timer > 25)
   {
    timer = 0;
   }
  
  background(0);
  timer = timer + 0.0167;
  radius += 0.2;
  hue = hue +1;
  centX = center;
  centY = center;
  
  if(timer < 8)
  {
    noStroke();
    center = width / 2;
  
    x = radius * cos(timer * (spiral+50));
    y = radius * sin(timer * (spiral+50));
    x += center;
    y += center;
    noStroke();
    fill(hue, 100, 100);
    ellipse(centX, centY, x, y);
    ellipse(centX - 200, centY - 200, x - 200, y - 200);
    ellipse(centX - 200, centY + 200, x - 200, y - 200);
    ellipse(centX + 200, centY - 200, x - 200, y - 200);
    ellipse(centX + 200, centY + 200, x - 200, y - 200);
   }
  
  if(timer > 8 && timer < 15)
  {
    ellipseX += 1;
    angle =+ 0.1;
   
    float waveSpeed = 10;
    float waveHeight = 200;
    float centerY = height/2;
   
    float angle = radians(ellipseX * waveSpeed);
   
    float offset = sin(angle) * waveHeight;
   
    float ellipseY = centerY + offset;
   
    background(hue, 100, 100, 100);
    fill(0);
    rectMode(CENTER);
    translate(250, 250);
    rotate(angle);
    rect(0, 0, 300, 300);
        
    fill(360);
    ellipse(ellipseX - 50, ellipseY, 200, 200);
    
    float r = random(50);
    stroke(r * 5);
    strokeWeight(50);
    line(0, 0, 50+r, 500);
  }
  if(timer > 15 && timer < 30)
  {
    r = random(50);
    background(r, 100 * r, 100 * r, 100 * r);
    a = a + 0.07;
    s = cos(a) * 2;
    pushMatrix();
    strokeWeight(r * 2);
    scale(s);
    stroke(0);
    line(10, 100, 200, 100);
    stroke(90);
    line(10, 200, 300, 200);
    stroke(180);
    line(10, 300, 400, 300);
    stroke(270);
    line(10, 400, 500, 400);
    stroke(3);
    line(10, 500, 600, 500);
    popMatrix();
  
    pushMatrix();
    ellipseX += 1;
   
    float waveSpeed = 15;
    float waveHeight = 200;
    float centerY = height;
   
    float angle = radians(ellipseX * waveSpeed);   
    float offset = sin(angle) * waveHeight;   
    float ellipseY = (centerY - 250) + offset;
    fill(360);
    noStroke();
    ellipse(ellipseX - 250, ellipseY, 100, 100); 
    ellipse(ellipseY, ellipseX - 250, 100, 100);
    fill(0);
    ellipse(ellipseX - 250, ellipseY, 80, 80); 
    ellipse(ellipseY, ellipseX - 250, 80, 80);
    fill(360);
    ellipse(ellipseX - 250, ellipseY, 60, 60); 
    ellipse(ellipseY, ellipseX - 250, 60, 60);
    fill(0);
    ellipse(ellipseX - 250, ellipseY, 40, 40); 
    ellipse(ellipseY, ellipseX - 250, 40, 40);
    fill(360);
    ellipse(ellipseX - 250, ellipseY, 20, 20); 
    ellipse(ellipseY, ellipseX - 250, 20, 20);
    if(ellipseX >= 700.0)
    {
      ellipseX = 300.0;
    }
    popMatrix();
  
  }
  
}


