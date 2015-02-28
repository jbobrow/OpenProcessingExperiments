
smooth();
size(800, 800);
background(255);
//scale(1);

for (int x=0; x<width/2*10; x += 1)
{
//  float mx = constrain(mouseX, 30, 70);
// point(x, 5);
  
  for (int y=0; y<height-10; y += 5)
{

  if(x<width)
  {
  translate(400, 20);
  line(0, y, 10, y-10);
  }
  else{
    line(x, y-20, x+20, y+10);
    rotate(2);
  
  }
  //point(i, y);
  //line(i,y, width/3,height/3);
  line(x+6,y, x, y-6);
  line(x, y+6, x-6, y);
  rotate(-90);

}
}

