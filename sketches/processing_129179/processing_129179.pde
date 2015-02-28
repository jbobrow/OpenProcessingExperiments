
void setup()
{
  size(500,500);
  background(255);
}
void draw ()
{
  if(mousePressed==false)
  {
  ellipse(250,250,0.5,0.5);
}
  if(mousePressed==true)
  {imageMode(CENTER);
  fill(0,0,90);
    ellipse(250,250,600,600);
  }

}
  
