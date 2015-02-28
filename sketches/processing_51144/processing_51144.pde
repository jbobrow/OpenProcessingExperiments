
size(800,800);
smooth();
background(100,50,55,10);
noFill();
stroke(255,05,100,100);
strokeWeight(5);


stroke(25,05,50,60);
fill(200,05,0,20);
for(int i=10; i<width; i+=200)
{
  for(int j=10; j<height; j+=20)
  {
   ellipse(i+90,j,200,200);
  }
}

strokeWeight(5);
stroke(05,05,100,60);
fill(30,205,0,20);
for(int i=10; i<width; i+=30)
{
  for(int j=10; j<height; j+=70)
  {
   ellipse(i,j+30,40,10);
  }
}

strokeWeight(5);
stroke(155,05,10,50);
fill(30,205,0,20);
for(int i=10; i<width; i+=10)
{
  for(int j=10; j<height; j+=10)
  {
   point(i,j);
  }
}

