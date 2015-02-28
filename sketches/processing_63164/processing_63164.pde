
size(600,600);
background(14,16,16);
smooth();

for(int i= 10; i<width-20; i+=120)
{
  for(int j= 5; j<=height-20; j+=120)
  {
    fill(i*j/i, i,j,10);
    noStroke();
    quad (i,j,width/5, height/5, width+i,height-j, width-i,width+j);
  }
}

for(int i= 10; i<width-20; i+=15)
{
  for(int j= 5; j<=height-20; j+=15)
  {
    noFill();
    stroke(i,j,i*j,10);
    quad (i,j,width/5, height/5, width-i,height+j, width+i,width-j);
  }
}

