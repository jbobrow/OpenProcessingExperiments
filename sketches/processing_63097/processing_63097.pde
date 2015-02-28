
size(600, 600);
smooth();
background(158, 222, 170);


for(int y =300; y<height; y=y+3){
for (int x = 0; x<=width; x=x+2)
{
  stroke(0, 180);
  line (x, 100+(x*0.5), x+20, 100+x);
}
 rotate(y + TWO_PI);
}

