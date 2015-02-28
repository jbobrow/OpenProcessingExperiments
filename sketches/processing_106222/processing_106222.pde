
// Hecho por Óscar A. Montiel :)

PFont font;
String tex;
float cx=500;
float cy=500;



void setup()
{
  font=loadFont("HighTowerText-Reg-48.vlw");
  size(767, 564);
  background(0);
  rectMode(CENTER);
  textAlign(CENTER);
}




void draw()
{
  float i=0;

  textFont(font);
  textSize(40);
  if (mouseX > width/2)
  {
    tex="la paranoia";
  }
  else if (mouseX < width/2)
  {
    tex="me está matando.";
  }
  text(tex, width/2, 292);

  fill(255,10);
  rect(width/2, height/2, width*2, height*2);

  noFill();

  cx=cx-10;
  cy=cy-10;
  if (cx < width && cy < height)
  {
    cx=cx-10;
    cy=cy-10;
  }
  while (i < 12)
  {
    if (mousePressed)
    {
      rect(width/2, height/2, abs((50*i)+(cx)), abs((50*i)+(cy)));
      cx=-mouseX;
      cy=-mouseY;
    }
    ellipse(width/2, height/2, abs((50*i)+(cx)), abs((50*i)+(cy)));
    i=i+0.7;
  }
}




