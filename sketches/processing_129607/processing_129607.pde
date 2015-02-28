
float timer = 0.0;
float rad = 0.0;
float s = 1.0;
float waveHeight = 5;
float scaleSpeed = 0.001;

void setup()
{
  size(500, 500);
  frameRate(30);
}
 
void draw()
{
  timer = timer += (1.0 / 30.0);
  rad = rad + 0.1;
  s = s + scaleSpeed;
  
  if (timer >= 2.0 && timer < 3.0)
  {
    background(0);
    rect(0, 0 , 100, 100);
  }
  else if (timer >= 3.0 && timer < 3.5)
  {
    fill(#9710C9);
    ellipse(300, 300, 200, 200);
  }
  else if (timer >= 3.0 && timer < 4.0)
  {
    fill(#17CE95);
    triangle(77, 100, 150, 50, 100, 50);
  }
  else if (timer >= 5.0 && timer < 15.0)
  {
    background(50, 50, 50);
    fill(255, 0, 0);
    pushMatrix();
    translate(100,200);
    scale(s);
    rectMode(CENTER);
    rect(0, 0, 100,100);
    popMatrix();
    if(s >= 1.007)
    {
      s = s - 0.001;
      scale(s);
    } 
  }
  else if (timer >= 16.0 && timer < 25.0)
  {
    fill(0, 0 , 255, 10);
    pushMatrix();
    translate(width/2, height/2);
    rotate(rad);
    scale(s);
    
    rectMode(CORNER);
    rect(0, 0, 100, 100);
    
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    
    popMatrix();
    pushMatrix();
    
    translate(100, 100);
    rotate(radians(45));
    scale(s);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    
    popMatrix();
  }
  else if (timer >= 26.0 && timer < 35.0)
  { 
    strokeWeight(5);
  
    // start position
    float starty = 100.0;
  
    float ly = starty;
    float lx = 0.0;
    
    // end position
    float endx = 500.0;
    float endy = 100.0;
    
    // only draw until we've exceeded the end position
    // && means 'and' and that both things have to be true
    while (lx < endx)
    {
     // how far down the wave goes
     float waveHeight = 50;
     float waveFrequency = 4;
     float nextX = lx + 1;
     float nextY = starty + waveHeight * sin(radians(lx * waveFrequency));
     line(lx, ly, nextX, nextY);
     ly = nextY;
     lx = nextX;
   }
 }
}



