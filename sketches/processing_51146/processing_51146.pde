
size(800,800);
smooth();
background(20,30,00,10);
noFill();
stroke(255,05,100,100);
strokeWeight(5);


stroke(205,05,200,20);
for(int i=10; i<width; i+=80)
{
  for(int j=10; j<height; j+=20)
  {
   rect(i-10,j,80,10);
  }
}

fill(30,200,0,80);
stroke(205,05,200,20);
for(int i=10; i<width; i+=100)
{
  for(int j=10; j<height; j+=100)
  {
   arc(i+50,j+30,100,80, radians(50),radians(300));
  }
}

strokeWeight(5);
stroke(155,05,10,50);
fill(200,205,0,200);
for(int i=10; i<width; i+=100)
{
  for(int j=10; j<height; j+=10)
  {
   point(i,j);
  }
}

