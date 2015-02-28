
size(600,600);
background(14,16,16);
smooth();

for(int i= 20; i<width-20; i+=5)
{
  for(int j= 20; j<=height-20; j+=5)
  {
    noFill();
    stroke(255, 30);
    quad (i,j,width/5+10, height/5+10, width-i,height-j, width+i,width+j);
  }
}

