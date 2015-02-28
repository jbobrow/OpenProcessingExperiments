
void setup()
{
  size(500,500);
  smooth();
}
 
void draw()
{
background(0,0,99);
colorMode(HSB,360,100,100);

  //triangle en bas à droite
pushMatrix();
fill(360-mouseY/8,100,100);
noStroke();
//strokeJoin(MITER);
//strokeWeight(2);
triangle(height/2, width/2,width/3,height/3,330,width/3);
popMatrix();
 
//triangle en haut au milieu
pushMatrix();
fill(153-mouseX/7,100,100);
//strokeWeight(2);
//strokeJoin(MITER);
translate(width/0.988, height/50);
rotate(PI/2);
triangle(height/2, width/2,width/3,height/3,330,width/3);
popMatrix();
 
//triangle en haut à gauche
pushMatrix();
fill(207-mouseX/8,100,100);
//strokeWeight(2);
//strokeJoin(MITER);
translate(height/3.25, width/-55);
rotate(PI/4);
scale(0.77);
triangle(height/2, width/2,width/3,height/3,330,width/3);
popMatrix();
 
//triangle en bas au milieu
pushMatrix();
fill(79-mouseX/8,100,100);
//strokeWeight(2);
//strokeJoin(MITER);
translate(height/2.03, width/6);
rotate(PI/4);
scale(0.77);
triangle(height/2, width/2,width/3,height/3,330,width/3);
popMatrix();
 
//le losange là.
pushMatrix();
//strokeWeight(30);
//strokeJoin(MITER);
fill(mouseX,mouseY);
translate(90,118);
scale(0.8);
quad(135,195,180,240,135,285,90,240);
popMatrix();
 
 
}
