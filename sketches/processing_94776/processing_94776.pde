
void setup()
{
  size(500,500);
  smooth();
}

void draw()
{
background(255);
noStroke();

//carré noir
pushMatrix();
fill(0);
rect(155,168,180,180);
popMatrix();

pushMatrix();
  //triangle en bas à droite

noStroke();
strokeJoin(MITER);
fill(255);
strokeWeight(2);
triangle(height/2, width/2,width/3,height/3,330,width/3);
popMatrix();

//triangle en haut au milieu
pushMatrix();
strokeWeight(2);
strokeJoin(MITER);
translate(width/0.988, height/50);
rotate(PI/2);
triangle(height/2, width/2,width/3,height/3,330,width/3);
popMatrix();

//triangle en haut à gauche
pushMatrix();
strokeWeight(2);
strokeJoin(MITER);
translate(height/3.25, width/-55);
rotate(PI/4);
scale(0.77);
triangle(height/2, width/2,width/3,height/3,330,width/3);
popMatrix();

//triangle en bas au milieu
pushMatrix();
strokeWeight(2);
strokeJoin(MITER);
translate(height/2.03, width/6);
rotate(PI/4);
scale(0.77);
triangle(height/2, width/2,width/3,height/3,330,width/3);
popMatrix();

//le losange là.
pushMatrix();
strokeWeight(30);
strokeJoin(MITER);
translate(90,118);
scale(0.8);
quad(135,195,180,240,135,285,90,240);
popMatrix();


}
