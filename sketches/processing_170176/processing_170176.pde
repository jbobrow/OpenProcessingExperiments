
float r = 1;
 
 
void setup()
{
  size(800, 800);
  background(random(150,200),random(200,250),random(100,255));
  rectMode(CENTER);
  noStroke();
  smooth();
}
   
  void draw()
  {
    fill(random(150,200),random(200,250),random(100,255),40);
    rect(width / 2,height / 2,width,height);
    translate(width / 2,height / 2);
     
     
    for(int y = 0; y < height+25; y = y+50)
    {
  fill(0);

  for (int x = 0; x < width+25; x = x+50)
{
   
  rect (x,y, 40, 40);
      rotate(r);
}}
    r = r + 0.001;
     
  }
