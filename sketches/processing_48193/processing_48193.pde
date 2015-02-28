
int gap=10;

size(800, 800);
smooth();
background(255);

noFill();
stroke(122);
for(int y=0; y<= height; y+=100)
{
  for(int x=0; x<= width; x+=90)
 {
  line(x, y, width/3, height/5);
  }
}


for (int i=width-gap;i>0;i=i-gap) {
  if (i%200==12) {

  }
  else {
    fill(139);
  }
  ellipse(width/2, height/4, i/4, i/4);
  rotate(40);
}


