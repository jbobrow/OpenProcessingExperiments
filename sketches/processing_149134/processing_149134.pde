
size (600, 600);
rectMode(CENTER);
noFill();
background(255);

float  angolo=90;
 
for (int y=0; y<=height; y+=30)
{
  for (int x=0; x<=width; x+=30)
  {
    angolo += 0.010;
    resetMatrix();
    translate(x, y);
    rotate(angolo);
     
    
    ellipse(0,0, 60,45);
  }
}

