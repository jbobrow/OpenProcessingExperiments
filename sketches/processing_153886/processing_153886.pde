

size(600,600);

for (int y=0; y<height; y+=10)
{
for (int x=0; x<width; x+=14)
{
if ( random(100) <50) {
  fill(0);
  rect( x,y, x+30,9 );
}else if(random(100)>50){
  fill(225);
  rect( x+1,y+1, 9,y+1 );
} else {
  fill(100);
  rect(x+2,y-2,x,y+1);
}
}
}







