
background (255);
size(700,700);
ellipseMode(LEFT);
float angolo=66;
for (int y=0;  y<=height;  y+=15)
{
  for (int x=0;  x<=width;  x+=150)
  {
    angolo += 0.9;
    resetMatrix();
    translate( x,y );
    rotate( angolo );
    
    stroke (200, 200,0, 255);
    fill (random (200), random (100), random (0), random (230));
    ellipse(0,0, 50,50);
  }
}
