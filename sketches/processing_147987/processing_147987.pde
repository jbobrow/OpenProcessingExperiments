
size(600,600);
loadPixels();
for(int i=0; i<pixels.length; i++)
{
pixels[i] =color(random (255));

}
updatePixels();

rectMode(CENTER);
float angolo=0;
for(int y=0; y<=height; y+=30)
{
  for(int x=0; x<=width; x+=30)
  {
    angolo+= 0.006;
    resetMatrix();
    translate(x,y);
    rotate(angolo);
    fill(random(0,255),random(0,255),random(0,255));
    rect(10,10, 15,15);
  }
}

rectMode(CENTER);
for(int y=0; y<=height; y+=30)
{
  for(int x=0; x<=width; x+=30)
  {
    angolo+= 0.006;
    resetMatrix();
    translate(x,y);
    rotate(angolo);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(0,0, 20,20);
  }
}
rectMode(CENTER);
for(int y=0; y<=height; y+=30)
{
  for(int x=0; x<=width; x+=30)
  {
    angolo+= 0.006;
    resetMatrix();
    translate(x,y);
    rotate(angolo);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(0,0, 15,15);
  }
}
rectMode(CENTER);
for(int y=0; y<=height; y+=30)
{
  for(int x=0; x<=width; x+=30)
  {
    angolo+= 0.006;
    resetMatrix();
    translate(x,y);
    rotate(angolo);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(0,0, 10,10);
  }
}
rectMode(CENTER);
for(int y=0; y<=height; y+=30)
{
  for(int x=0; x<=width; x+=30)
  {
    angolo+= 0.006;
    resetMatrix();
    translate(x,y);
    rotate(angolo);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(0,0, 5,5);
  }
}



