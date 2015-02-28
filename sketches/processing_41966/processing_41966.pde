
// Homework 10
// Copyright Andrew Viny October 2011 Pittsburgh, PA 15232
color col1, col2, col3, col4, col5;
float distX, distY, distZ;

void setup()
{
  size(400, 400, P3D);
  smooth();
  col1 = color(255);
  col2 = color(200,55,0);
  col3 = color(175);
  col4 = color(55,200,0);
  col5 = color(0,55,200);
}

void draw()
{
  drawA(width/2, height/2, 0); 
}

void drawA(float centerX, float centerY, float centerZ)
{ 
  ambientLight(85, 85, 85);
  directionalLight(205, 205, 205, 1, -1, -1);
  background(col3);
  stroke(col1);
  fill(col2);
  pushMatrix();
  translate(centerX-(width*.125)-distX, centerY+(height/40)-distY, centerZ+distZ);
  rotateZ(PI*.1);
  rotateX(PI*-.02);
  rotateY(PI*-.1);
  box(width*.125, height*.85, height*.125);
  popMatrix();
  
  pushMatrix();
  fill(col4);
  translate(centerX+(width*.125)-distX, centerY+(height/40)+distY, centerZ-distZ);
  rotateZ(PI*-.1);
  rotateX(PI*-.1);
  rotateY(PI*-.2);
  box(width*.125, height*.85, height*.125);
  popMatrix();
  
  pushMatrix();
  fill(col5);
  translate(centerX+(width*.01)+distX, centerY+(height*.1)+(height/40)-distY, centerZ+(width*.0125)+distZ);
  rotateZ(PI*.36);
  rotateX(PI*.65);
  rotateY(PI*-.1);
  box(width*.125, height*.5, height*.125);
  popMatrix();
  
  if(width/2+abs(dist(mouseX, mouseY, width/2, height/2)) > width/2+width/10 || width/2-abs(dist(mouseX, mouseY, width/2, height/2)) < width/2-width/10)
  {
    distX = dist(mouseX, mouseY, width/2, height/2)-(width/10);
  }
  else
  {
    distX = 0;
  }
  
  if(height/2+abs(dist(mouseX, mouseY, width/2, height/2)) > height/2+height/10 || height/2-abs(dist(mouseX, mouseY, width/2, height/2)) < height/2-height/10)
  {
    distY = dist(mouseX, mouseY, width/2, height/2)-(height/10);
    distZ = dist(mouseX, mouseY, width/2, height/2)-(height/10);
  }
  else
  {
    distY = 0;
    distZ = 0;
  }
}
