
smooth();
size(800, 800);
background(255);
//scale(1);

for (int x=0; x<2000; x += 1)
{
// point(x, 5);
  
  for (int y=0; y<height-10; y += 5)
{

  if(x % 10 == 0)
  {
  point(0, y);
  }
  else{
    point(x, 20);
    rotate(20);
  
  }
  //point(i, y);
  //line(i,y, width/3,height/3);
  point(x+6,y);
  point(x, y+6);
  rotate(-20);

}
}
