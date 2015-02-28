
//nested for loop

smooth();
size(800, 800);
background(255);
scale(1);

for (int x=0; x<width; x += 5)
{
// point(x, 5);
  
  for (int y=0; y<height-10; y += 5)
{
  
  if(x % 10 == 0)
  {
  point(0, width/2);
  }
  else{
    point(height/2, 20);
    rotate(20);
  
  }
  //point(i, y);
  //line(i,y, width/3,height/3);
  point(x+6,y);
  point(x, y+6);
  rotate(-20);
}
}




