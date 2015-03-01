
void setup()
{
size (800,600);
}
void draw()
{
    background(2100);
  
  //pushmatrix();
  translate(width/2,height/2);
  //rotate(angolo);
  fill(180);
  ellipse(0,0,50,50);
  for(int i=0;i<8;i++)
  {
    rotate(TWO_PI/random(45));
    fill(200,111,2);
    ellipse(0,40,43,13);
  }
    
}
