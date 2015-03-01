
size(600,600);
loadPixels();
for (int i=0;  i<pixels.length;  i++)
{
  pixels[i] = color( random(255) );
}
updatePixels();

float angolo=0;

for (int y=0; y<=height; y+=30)
{
  for(int x=0; x<=width; x+=30)
  {
    angolo += 0.006;
    resetMatrix();
    translate( x,y );
    rotate( angolo );
    fill (random(150,280), random(300,20), random (380,50),150);
    ellipse(0,0, 30,30);
    rect(0,0, 30,30);
  }
}
