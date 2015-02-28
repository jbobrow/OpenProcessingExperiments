
void setup()
{
  size(500, 500);
}
 
void draw()
{ 
  background(0);
 
  int s = second()-1;
  int m = minute()-1;
  int h = hour()-50;
 
   
  for(int i = 0; i<=s; i++)
  {
    strokeWeight(1);
    stroke(255);
    float xSec = (width/60.0)*i;
    line(xSec, 0, xSec, 500);
  }
   
  // Stripes for minutes
 
  for(int i = 0; i<=m; i+=15)
  {
    fill(#CDC9C9,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
    for(int i = 1; i<=m; i+=15)
  {
    fill(#856363,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
   
    for(int i = 2; i<=m; i+=15)
  {
    fill(#CD9B9B,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
   
    for(int i = 3; i<=m; i+=15)
  {
    fill(#802A2A,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
   
    for(int i = 4; i<=m; i+=15)
  {
    fill(#A52A2A,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
   
    for(int i = 5; i<=m; i+=15)
  {
    fill(#A62A2A,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
   
    for(int i = 6; i<=m; i+=15)
  {
    fill(#EEB4B4,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
       
    for(int i = 7; i<=m; i+=15)
  {
    fill(#CD2627,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
      for(int i = 8; i<=m; i+=15)
  {
    fill(#F08080, 200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
   
  for(int i = 9; i<=m; i+=15)
    {
    fill(#EE2C2C,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
    for(int i = 10; i<=m; i+=15)
    {
    fill(#800000,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
    for(int i = 11; i<=m; i+=15)
    {
    fill(#EE0000,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
    for(int i = 12; i<=m; i+=15)
    {
    fill(#FF3333,200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
  
    for(int i = 13; i<=m; i+=15)
    {
    fill(#FF6A6A,200);
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

                
                
