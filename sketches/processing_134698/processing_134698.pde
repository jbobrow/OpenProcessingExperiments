
void setup(){
  size(500, 500);
}
 
int x=0;
 
 
void draw()
 
{
   
  background(255, 204, 0);
  line(x, 40, 85, 75);
  ellipse(x, 46, 55, 55);
  fill(204, 102, 0);
  rect(x, 20, 55, 55);
  fill(204, 102, 0);
  line(x, 20, 85, 75);
   
 
  //background(255, 204, 0);
  line(x, 60, 85, 75);
  ellipse(x, 56, 55, 55);
  fill(204, 102, 0);
  rect(x, 40, 55, 55);
  fill(204, 102, 0);
  line(x, 80, 85, 75);
   
  //background(255, 204, 0);
  line(x, 100, 85, 75);
  ellipse(x, 76, 55, 55);
  fill(204, 102, 0);
  rect(x, 60, 55, 55);
  fill(204, 102, 0);
  line(x, 120, 85, 75);

  //background(255, 204, 0);
  line(x, 140, 85, 75);
  ellipse(x, 86, 55, 55);
  fill(204, 102, 0);
  rect(x, 80, 55, 55);
  fill(204, 102, 0);
  line(x, 160, 85, 75);
 
    x=x+1;
   
  if(x>500)
{
    x=0;
}
}

