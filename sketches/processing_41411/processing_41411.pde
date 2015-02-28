
// Homework 10
// 51-757 Computing for the Arts with Processing
// October 11, 2011
// Copyright Molly Nix October 2011 Pittsburgh, PA 15232

color offblack = color(19, 19, 19);
color greybg = color(32, 32, 32);
color cblue = color(0, 161, 184);

void setup()
{
  size(400, 400, P3D);
  smooth();
}

void draw()
{
  background(greybg);
  rotateM();
  turnOnLights();
  drawM(width/2, height/2, 0);
}

void turnOnLights() 
{
  lights();
  directionalLight(102, 102, 102, 0, 1, -1);
  lightSpecular(102, 102, 102);
}

void rotateM() 
{
  rotateY(radians(15));
  rotateX(radians(10));
}

void drawM(float centerX, float centerY, float centerZ)
{
  fill(cblue, 230);
  stroke(offblack);
  strokeWeight(.75);
  pushMatrix();
  translate(centerX-(width*.232), centerY, centerZ);
  box(width*.092, height*.38, height*.1);
  popMatrix();

  pushMatrix();
  translate(centerX+(width*.232), centerY, centerZ);
  box(width*.092, height*.38, height*.1);
  popMatrix();


  pushMatrix();
  translate(centerX-(width*.212), centerY-(height*.23), centerZ);
  box(width*.25, height*.076, height*.2);
  popMatrix();

  pushMatrix();
  translate(centerX+(width*.212), centerY-(height*.23), centerZ);
  box(width*.25, height*.076, height*.2);
  popMatrix();

  pushMatrix();
  translate(centerX-(width*.252), centerY+(height*.226), centerZ);
  box(width*.222, height*.08, height*.2);
  popMatrix();

  pushMatrix();
  translate(centerX+(width*.252), centerY+(height*.226), centerZ);
  box(width*.222, height*.08, height*.2);
  popMatrix();

  pushMatrix();
  translate(centerX-(width*.102), centerY, centerZ);
  beginShape();
  vertex(width*.102, height*.13);
  vertex(width*.102, height*.266);
  vertex(width*.036, height*.266);
  vertex(-width*.102, -height*.192);
  vertex(-width*.102, -height*.266);
  vertex(-width*.102, -height*.266);
  vertex(-width*.018, -height*.266);
  vertex(width*.102, height*.13);
  endShape();
  popMatrix();

  pushMatrix();
  translate(centerX+(width*.102), centerY, centerZ);
  beginShape();
  vertex(-width*.102, height*.13);
  vertex(-width*.102, height*.266);
  vertex(-width*.036, height*.266);
  vertex(width*.102, -height*.192);
  vertex(width*.102, -height*.266);
  vertex(width*.102, -height*.266);
  vertex(width*.018, -height*.266);
  vertex(-width*.102, height*.13);
  endShape();
  popMatrix();
}


