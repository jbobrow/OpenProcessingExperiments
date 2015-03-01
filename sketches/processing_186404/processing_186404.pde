

size (550,550);
loadPixels();
for (int i=0;  i<pixels.length;  i++)
{
  pixels[i] = color( random(50) );
}
updatePixels();

for (int y=0;  y<height;  y+=10)
{
  for (int x=0;  x<width;  x+=10)
  {
    if (random(100) < 50) {
      stroke(255,255,255);
      line( x,y+5, x+5,y );
      line( x+5,y+10, x+10,y+5 );
    } else {
      line( x+5,y, x+10,y+5 );
      line( x,y+5, x+5,y+10 );
} }
}


float angolo=0;
for (int y=0;  y<=height;  y+=30)
{
  for (int x=0;  x<=width;  x+=30)
  {
    angolo += 0.05;
    resetMatrix();
    translate( x,y );
    rotate( angolo );
    noStroke();   
    fill(255,150,100);
    ellipse(0,0, 20,10);
  }
}

float angolo1=0;
for (int y=0;  y<=height;  y+=30)
{
  for (int x=0;  x<=width;  x+=30)
  {
    angolo1 += 0.10;
    resetMatrix();
    translate( x,y );
    rotate( angolo1 );
    fill(0,30,250);
    rect(0,0, 20,10);
  }
}

float angolo2=0;
for (int y=0;  y<=height;  y+=30)
{
  for (int x=0;  x<=width;  x+=30)
  {
    angolo2 += 0.50;
    resetMatrix();
    translate( x,y );
    rotate( angolo2 );
    fill(100,250,150);
    triangle(30,10, 20,10, 30,20);
  }
}


