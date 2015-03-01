
float angolo;
float zorro;
 
 
void setup()
{
   
  size(800,600);
  background(#05FFC2);
  angolo = 0;
  zorro = 16;
   
}
  void draw()
{
   
  translate(width/2,height/2);
  strokeWeight(1);
  stroke(#545555);
  scale(random(10));
  fill(random(255));
  ellipse(0,0,30,30);
  stroke(#FEFF05);
   
  for(int i=0;i<zorro;i++)
  {
   
  rotate(TWO_PI/zorro);
  fill(random(255));
  stroke(#545555);
  ellipse(0,70,50,100);
   
   
}
}

