
float r,g,b;

void setup()
{
  size (800,400);
  background(255);
  
  
}

void draw()
{
  r = random(255); g = random(255); b = random(255);
  fill (r,g,b);
  ellipse( 200,200, width * 4, height/30);
  ellipse( 110,110, width * 5, height/30);
  ellipse( 50,50, width * 10, height/30);
  ellipse( 20,20, width * 20, height/30);
  ellipse( 80,80, width * 20, height/30);
  ellipse( 140,140, width * 20, height/30);
  ellipse( 170,170, width * 20, height/30);
  ellipse( 200,200, width * 20, height/30);
  ellipse( 230,230, width * 20, height/30);
  ellipse( 260,260, width * 20, height/30);
  ellipse( 290,290, width * 20, height/30);
  ellipse( 320,320, width * 20, height/30);
  ellipse( 350,350, width * 20, height/30);
  ellipse( 380,380, width * 20, height/30);
}
