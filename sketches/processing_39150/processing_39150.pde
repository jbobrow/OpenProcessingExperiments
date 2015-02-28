
size(800,800);
background(0);
smooth();

noFill();
stroke(255);
strokeWeight(12);

for(int y=0; y<= height; y+=80)
{
  for(int x=0; x<= width; x+=80)
 {
if( y % 3 == 0) //why does it only work with 3?
{
 strokeWeight(12);
}
else {
 strokeWeight(4);
}
 {
  arc(x,y,  50,50,  PI/2,PI);
  }
}
}

