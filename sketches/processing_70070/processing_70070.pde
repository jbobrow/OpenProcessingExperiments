
//Will Crownover, Electronic Media Studio II, 9-12-12
//Pattern Assignement

//Variables
int r, c, distX, distY;

size(1024, 768);
background(0);
smooth();
r = 10;
c = 10;
distX = 100;
distY = 100;

  for (int i = 0; i <= r; i++) 
  {
    for (int j = 0; j <= c; j++) 
    {
      
      fill(200,200,200, 150);
      stroke(0, 0, 200, 150);
      strokeWeight(20);
      ellipse(i*distX, j*distY, 100, 80);
      noFill();
      strokeWeight(10);
      stroke(250, 250, 250, 100);
      ellipse(i*distX, j*distY, 50, 34);
    }
  }
  
  for (int i = 0; i <= r; i++) 
  {
    for (int j = 0; j <= c; j++) 
    {
      fill(255,1);
      stroke(200,200,0,50);
      strokeWeight(20);
      rectMode(CENTER);
      rect(i*distX, j*distY, 100, 100);
    }
  }
  
  for (int i = 0; i <= r; i++) 
  {
    for (int j = 0; j <= c; j++) 
    {
      if( i%2==0 && j%2==0)
      {
      fill(255,0,0,50);
      noStroke();
      rectMode(CORNER);
      rect(i*distX, j*distY, 100, 100);
      }
    }
  }
  
  for (int i = 0; i <= r; i++) 
  {
    for (int j = 0; j <= c; j++) 
    {
      if( i%4==0 && j%4==0)
      {
      fill(0,255,0,50);
      noStroke();
      rectMode(CENTER);
      ellipse(i*distX+50, j*distY+50, 400, 400);
      }
    }
  }
