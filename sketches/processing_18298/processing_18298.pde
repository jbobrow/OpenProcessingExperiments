
void setup( )
{
  size(250, 250);
  background(255);

  smooth();
  for(int y=0;y<=height;y+=1){
    for(int x=0;x<=width;x+=250){

  ellipse(x, y, x*5, y*5); // endpoints of curve
  ellipse(x, y*3, x*2, y*2);
  fill(255, 0, 0);
  noFill();
  stroke(0);
 
}

}
}

