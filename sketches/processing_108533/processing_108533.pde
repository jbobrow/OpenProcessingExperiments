
//Eleni Katrini
//ekatrini@andrew.cmu.edu
//copyright © Eleni Katrini, September 2013
//HW03_constallations

color col= color(85, 196, 189);

void setup()
{
 size(400, 400);
 background(col);
}

void draw()
{
 float  ht=height;
 float  wd=width;
 
  background(col);
  
  fill(255, 255, 255);
  textSize(12);
  text("click", 350, 20); 
  
  noStroke();
  fill(255, 255, 255);
  ellipse(mouseX, mouseY, 6, 6);
  ellipse(mouseX + pmouseX - 50, mouseY + pmouseY - 50, 6, 6);
  ellipse(pmouseX + 80, pmouseY + 20, 6, 6);
  ellipse(wd - mouseX, ht - mouseY, 6, 6);
  ellipse(50, 350, 5, 5);
  
  noFill();
  stroke(255, 255, 255);
  strokeWeight(1);
  line( 0, 0, mouseX, mouseY);
  line( 100, 0, mouseX, mouseY);
  line( 0, 200, mouseX, mouseY);
  line( 100, 400, mouseX + pmouseX - 50, mouseY + pmouseY - 50);
  line( 300, 0, pmouseX + 80, pmouseY + 20);
  line(mouseX, mouseY, mouseX + pmouseX - 50, mouseY + pmouseY - 50);
  line(mouseX + pmouseX - 50, mouseY + pmouseY - 50, pmouseX + 80, pmouseY+20);
  line(pmouseX + 80, pmouseY+20, mouseX, mouseY);
  line(mouseX + pmouseX - 50, mouseY + pmouseY - 50, wd - mouseX, ht - mouseY);
  line(wd - mouseX, ht - mouseY, 400, 350);
  line(wd - mouseX, ht - mouseY, 400, 100);
  line(wd - mouseX, ht - mouseY, pmouseX + 80, pmouseY+20);
  line(50, 350, mouseX, mouseY);
  line(mouseX + pmouseX - 50, mouseY + pmouseY - 50, 50, 350);
  line(wd - mouseX, ht - mouseY, 50, 350);
  line(50, 350, 0, 400);
}

void mousePressed()
{
  col= color(0, random(200), random(255)); 
}



