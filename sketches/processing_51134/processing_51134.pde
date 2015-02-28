
size(800,800);
smooth();
background(200,30,05,10);
noFill();
stroke(255,05,20,90);
strokeWeight(3);

fill(10,0,100,20);
for(int i=0; i<width; i+=80)
{
  for(int j=20; j<height; j+=80)
  {
    arc(i+100,j+100,170,130,PI/2,PI);
  }
}

stroke(255,05,100,60);
fill(0,225,0,50);
for(int i=10; i<width; i+=50)
{
  for(int j=10; j<height; j+=50)
  {
   ellipse(i+20,j+15, 50,50);
  }
}

fill(20,25,0,50);
stroke(10,0,200,50);
for(int i=0; i<width; i+=100)
{
  for(int j=20; j<height; j+=100)
  {
    ellipse(i+50,j+20,200,200);
  }
}

