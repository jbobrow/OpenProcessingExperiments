
//homework 3
//copyright Jessica Schafer, Sept. 2011, pittsburgh, pa

color col1, col2, col3;

void setup ()
{
  size (400,400);
  smooth();
  background (152, 227, 255); //sky
  strokeWeight(5);
  stroke(47,124,62);
  fill (47,124,62);
  rect (0,375,width,height); //grass
  ellipse (150, 90, 15, 15);
  ellipse (140, 240, 15, 15);
  ellipse (280, 180, 15, 15);
  frameRate (20);

//STEMS
noFill();
beginShape();
  vertex (50,380);
  bezierVertex (40,360, 40,80, 150, 90);
endShape();

beginShape();
  vertex (180, 380);
  bezierVertex (190,385, 200,326, 200,320);
  bezierVertex (200,260, 140,280, 140,240);
endShape();

beginShape();
  vertex (300,380);
  bezierVertex(340,370, 290,200, 280,180);
endShape();
 
}

void draw ()
{ 
  strokeWeight(8);
  col1 = color(255, random(240,255), random(255));
  col2 = color(random(250,255), random(255), 255);
  col3 = color(255, random (115, 255), random(255));
  
  if (mouseX >=140 && mouseX <=160 && mouseY >=80 && mouseY <=100) {
    stroke (col1);  
    line (150, 90, random(135,200), random (30,155));}

  if (mouseX >=130 && mouseX <=150 && mouseY >=230 && mouseY <=250) {
    stroke (col2);  
    line (140, 240, random(95,185), random (200,240));}
    
  if (mouseX >=270 && mouseX <=290 && mouseY >=170 && mouseY <=190) {
    stroke (col3);  
    line (280, 180, random(200,330), random (120,205));}
}

void mousePressed ()
{
  background (152, 227, 255); //sky
  strokeWeight(5);
  stroke(47,124,62);
 
  fill (47,124,62);
  rect (0,375,width,height); //grass
 
  ellipse (150, 90, 15, 15);
  ellipse (140, 240, 15, 15);
  ellipse (280, 180, 15, 15);
  
  noFill();
beginShape();
  vertex (50,380);
  bezierVertex (40,360, 40,80, 150, 90);
endShape();

beginShape();
  vertex (180, 380);
  bezierVertex (190,385, 200,326, 200,320);
  bezierVertex (200,260, 140,280, 140,240);
endShape();

beginShape();
  vertex (300,380);
  bezierVertex(340,370, 290,200, 280,180);
endShape();
}

