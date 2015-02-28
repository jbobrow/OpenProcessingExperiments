
//Ken Watanabe, Earthquake
//Art Center College of Design, Interactive 2, Fall 2011
//Coding inspired by mentor Michael Kontopoulos

float x, y;
void setup()
{
  size(600, 600);
  smooth();
  x = width/2;
  y = height/2; 
  strokeWeight(0.2);
}
void draw()
{
  fill(0, 20);
  rect(0, 0, width, height);
  
  stroke(200);
  noFill();

  float mouseDist = dist(mouseX, mouseY, x, y);
  
  float num = map(mouseDist, 210, 0, 0, 10);
 
  num = constrain(num, 0, 10);

//E
  beginShape();
  vertex(186+random(-num, num), 275+random(-num, num));
  vertex(221+random(-num, num), 275+random(-num, num));
  vertex(221+random(-num, num), 283+random(-num, num));
  vertex(197+random(-num, num), 283+random(-num, num));
  vertex(197+random(-num, num), 295+random(-num, num));
  vertex(219+random(-num, num), 295+random(-num, num));
  vertex(219+random(-num, num), 303+random(-num, num));
  vertex(197+random(-num, num), 303+random(-num, num));
  vertex(197+random(-num, num), 317+random(-num, num));
  vertex(221+random(-num, num), 317+random(-num, num));
  vertex(221+random(-num, num), 325+random(-num, num));
  vertex(186+random(-num, num), 325+random(-num, num));
  endShape(CLOSE);
  
//A
  beginShape();
  vertex(228+random(-num, num), 325+random(-num, num));
  vertex(228+random(-num, num), 317+random(-num, num));
  vertex(245+random(-num, num), 274+random(-num, num));
  vertex(254+random(-num, num), 274+random(-num, num));
  vertex(272+random(-num, num), 317+random(-num, num));
  vertex(272+random(-num, num), 325+random(-num, num));
  vertex(265+random(-num, num), 325+random(-num, num));
  vertex(260+random(-num, num), 314+random(-num, num));
  vertex(240+random(-num, num), 314+random(-num, num));
  vertex(235+random(-num, num), 325+random(-num, num));
  endShape(CLOSE);
  
  beginShape();
  vertex(243+random(-num, num), 305+random(-num, num));
  vertex(250+random(-num, num), 287+random(-num, num));
  vertex(257+random(-num, num), 305+random(-num, num));
  endShape(CLOSE);
  
//R
  beginShape();
  vertex(279+random(-num, num), 274+random(-num, num));
  vertex(319+random(-num, num), 274+random(-num, num));
  vertex(319+random(-num, num), 305+random(-num, num));
  vertex(309+random(-num, num), 305+random(-num, num));
  vertex(319+random(-num, num), 317+random(-num, num));
  vertex(319+random(-num, num), 325+random(-num, num));
  vertex(313+random(-num, num), 325+random(-num, num));
  vertex(296+random(-num, num), 305+random(-num, num));
  vertex(289+random(-num, num), 305+random(-num, num));
  vertex(289+random(-num, num), 325+random(-num, num));
  vertex(279+random(-num, num), 325+random(-num, num));
  endShape(CLOSE);
  
  beginShape();
  vertex(289+random(-num, num), 283+random(-num, num));
  vertex(308+random(-num, num), 283+random(-num, num));
  vertex(308+random(-num, num), 296+random(-num, num));
  vertex(289+random(-num, num), 296+random(-num, num));
  endShape(CLOSE);
  
  //T
  beginShape();
  vertex(326+random(-num, num), 274+random(-num, num));
  vertex(367+random(-num, num), 274+random(-num, num));
  vertex(367+random(-num, num), 283+random(-num, num));
  vertex(351+random(-num, num), 283+random(-num, num));
  vertex(351+random(-num, num), 325+random(-num, num));
  vertex(341+random(-num, num), 325+random(-num, num));
  vertex(341+random(-num, num), 283+random(-num, num));
  vertex(326+random(-num, num), 283+random(-num, num));
  vertex(326+random(-num, num), 274+random(-num, num));
  endShape(CLOSE);
  
  //H
  beginShape();
  vertex(374+random(-num, num), 274+random(-num, num));
  vertex(384+random(-num, num), 274+random(-num, num));
  vertex(384+random(-num, num), 294+random(-num, num));
  vertex(406+random(-num, num), 294+random(-num, num));
  vertex(406+random(-num, num), 274+random(-num, num));
  vertex(416+random(-num, num), 274+random(-num, num));
  vertex(416+random(-num, num), 325+random(-num, num));
  vertex(406+random(-num, num), 325+random(-num, num));
  vertex(406+random(-num, num), 303+random(-num, num));
  vertex(384+random(-num, num), 303+random(-num, num));
  vertex(384+random(-num, num), 325+random(-num, num));
  vertex(374+random(-num, num), 325+random(-num, num));
  endShape(CLOSE);
}

void mousePressed()
{
  saveFrame("nervous-##.tif");
}


