
//Jeff Conway, jconway@andrew.cmu.edu
//Copyright 2014

void setup(){
  size(400, 400);
  rectMode(CENTER);
}

void draw(){
  background(0, 0, 0);
  fill(0, 0, 0);
  rect(mouseX, mouseY, (mouseX*mouseY)*0.0025+20, (mouseX+mouseY)*0.05+20);

  fill(255, 0, 0);
  ellipse(mouseX, mouseY, (mouseX*mouseY)*0.0025, (mouseX+mouseY)*0.05);

  fill(250, 162, 27);
  ellipse(mouseX, mouseY, 0.75*(mouseX*mouseY)*0.0025, 0.75*(mouseX+mouseY)*0.05);

  fill(250, 247, 27);
  ellipse(mouseX, mouseY, 0.5*(mouseX*mouseY)*0.0025, 0.5*(mouseX+mouseY)*0.05);

  fill(0, 0, 0);
  ellipse(mouseX, mouseY, 0.25*(mouseX*mouseY)*0.0025, 0.25*(mouseX+mouseY)*0.05);

  fill(0, 255, 0);
  triangle(mouseX-(mouseX*mouseY)*0.0025*0.05, mouseY-(mouseX+mouseY)*0.05*0.01, mouseX + (mouseX*mouseY)*0.0025*0.05, mouseY-(mouseX+mouseY)*0.05*0.01, mouseX,mouseY-(mouseX+mouseY)*0.05*0.12);

  fill(0, 255, 0);
  triangle(mouseX-(mouseX*mouseY)*0.0025*0.05, mouseY+(mouseX+mouseY)*0.05*0.01, mouseX + (mouseX*mouseY)*0.0025*0.05, mouseY+(mouseX+mouseY)*0.05*0.01, mouseX,mouseY+(mouseX+mouseY)*0.05*0.12);
}




