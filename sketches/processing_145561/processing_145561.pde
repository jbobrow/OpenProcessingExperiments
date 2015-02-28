
int index = 0;
   
void setup ()
{
  size (600, 200);
  smooth();
}
   
void draw ()
{
  background (#57385c);
   
  if (index == 0)
  {
    zeichnung01 ();
  }
  if (index == 1)
  {
    zeichnung02 ();
  }
  if (index == 2)
  {
    zeichnung03();
  }
  if (index == 3)
  {
    zeichnung04();
  }
   
  if (frameCount > 15)
  {
  index = index + 1;
  frameCount = 0;
  }
   
  if (index > 3)
  {
  index = 0;
  }
     
}
  
void keyPressed ()
{
  if (key == 's')
  {
    saveFrame ("export/waka_#####.png");
  }
}
   
void zeichnung01 ()
{
  noStroke();
  fill (#A75265);
  ellipse (width/2, height/2, 140, 140);
   
  stroke (#57385c);
  strokeWeight (2);
  line (width/2, height/2, width/2+70, height/2);
}
   
void zeichnung02 ()
{
  noStroke();
  fill (#A75265);
  arc (width/2, height/2, 140, 140, PI/60, TWO_PI-PI /60);
   
  fill (255);
  ellipse (width, height/2, 30, 30);
}
   
void zeichnung03 ()
{
  noStroke();
  fill (#A75265);
  arc (width/2, height/2, 140, 140, PI/15, TWO_PI-PI /15);
   
  fill (255);
  ellipse (width*0.75, height/2, 30, 30);
}
   
void zeichnung04 ()
{
  noStroke();
  fill (#A75265);
  arc (width/2, height/2, 140, 140, PI/4, TWO_PI-PI /4);
   
  fill (255);
  ellipse (width/2 + 70, height/2, 30, 30);
}
