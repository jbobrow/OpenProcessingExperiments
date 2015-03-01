
color hintergrund = color (230);
color linienfarbe = color (70,130,120);

void setup ()

{
  size (600,600); 
  smooth ();
  
  background (hintergrund);
  
}

void draw ()
{
 background (hintergrund);
 int count = 0;

while (count < 50)
{
float  x = random (30,600);
float  y = random (30,600);
float  a = random (30,600);
float  b = random (30,600);
float  m = random (30,600);
float  n = random (30,600);

  stroke (linienfarbe);
  strokeWeight (2);
  fill (hintergrund);

triangle (x,y,a,b,m,n);


while (x>30)
{
  
  triangle (x,y,a,b,m,n);
  x = x - 9;
}

while (y>30)
{
  
  triangle (x,y,a,b,m,n);
  y = y - 9;
}
  
  while (a>30)
{
  
  triangle (x,y,a,b,m,n);
  a = a - 9;
}

while (b>30)
{
  
  triangle (x,y,a,b,m,n);
  b = b - 9;
}
while (m>30)
{
  
  triangle (x,y,a,b,m,n);
  m = m - 9;
}

while (n>30)
{
  
  triangle (x,y,a,b,m,n);
  n = n - 9;
}
  
  
  
  
  
  count = count + 1;

}

fill (hintergrund);

  int margin = 90; //außenabstand
  
  noFill();
  strokeWeight (margin*2);
  stroke (hintergrund);
  
  //rect (margin/2, margin/2,width-margin,height-margin);
  rect (0,0,width,height);


}

void keyPressed ()
{
}




  



