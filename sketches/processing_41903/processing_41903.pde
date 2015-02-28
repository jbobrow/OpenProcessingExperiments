
void setup()
{
  size(500, 500);
}

void draw()
{  
  background(0);

  int s = second()-1;
  int m = minute()-1;
  int h = hour()-12;

  
  for(int i = 0; i<=s; i++)
  {
    strokeWeight(1);
    stroke(255);
    float xSec = (width/60.0)*i;
    line(xSec, 0, xSec, 500);
  } 
  
  // Stripes for minutes

  for(int i = 0; i<=m; i+=10)
  {
    fill(#0A096C,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
    for(int i = 1; i<=m; i+=10)
  {
    fill(#2F2EB4,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
    for(int i = 2; i<=m; i+=10)
  {
    fill(#6431DE,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
    for(int i = 3; i<=m; i+=10)
  {
    fill(#941CD6,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
    for(int i = 4; i<=m; i+=10)
  {
    fill(#D61CCA,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
    for(int i = 5; i<=m; i+=10)
  {
    fill(#EA0E6E,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
    for(int i = 6; i<=m; i+=10)
  {
    fill(#F00732,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
      
    for(int i = 7; i<=m; i+=10)
  {
    fill(#F01B07,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
      for(int i = 8; i<=m; i+=10)
  {
    fill(#F06813, 200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
  for(int i = 9; i<=m; i+=10)
    {
    fill(#F0DD07,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
  //hourly stripes
    
    for(int i = 0; i<=h; i+=2)
  {
    fill(255, 255, 255, 100);
    noStroke();
    float yHour = (width/24.0)*i;
    rect(yHour, 0, width/24.0, height);

  } 

}



