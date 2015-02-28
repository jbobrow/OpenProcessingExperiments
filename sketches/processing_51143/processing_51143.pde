
size(800,800);
smooth();
background(200,200,05,10);
noFill();
stroke(255,05,20,90);
strokeWeight(3);

fill(10,0,100,10);
for(int i=0; i<width; i+=80)
{
  for(int j=20; j<height; j+=10)
  {
    arc(i+80,j-50,170,130,PI/2,PI);
  }
}

stroke(255,05,100,60);
fill(0,225,0,20);
for(int i=10; i<width; i+=20)
{
  for(int j=10; j<height; j+=20)
  {
   arc(i,j,20,20,radians(30),radians(80));
  }
}

