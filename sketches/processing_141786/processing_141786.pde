
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  //background(255);
  translate(width/2, height/2);
  noFill();
  
  //KREIS IN DER MITTE // DREHENDES QUADRAT; Groß
  pushMatrix();
  rectMode(CENTER);
  rotate(millis()/3000.0);
  stroke(211, 211, 211, 10);
  rect(0, 0, 500, 500);
  popMatrix();
  resetMatrix();
  
  //KREIS; MITTE, OBEN
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, 0);
  rotate(millis()/3000.0);
  stroke(173, 255, 47, 10);
  rect(0, 0, 500, 500);
  popMatrix();
  
    //KREIS; MITTE, UNTEN
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, 500);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  
     //KREIS; MITTE, LINKS
  pushMatrix();
  rectMode(CENTER);
  translate(0, height/2);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  
     //KREIS; MITTE, RECHTS
  pushMatrix();
  rectMode(CENTER);
  translate(500, height/2);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  
     //KREIS; OBEN, RECHTS
  pushMatrix();
  rectMode(CENTER);
  translate(500, 0);
  rotate(millis()/3000.0);
  stroke(90, 90, 90, 10);
  rect(0, 0, 500, 500);
  popMatrix();
  
    //KREIS; UNTEN, RECHTS
  pushMatrix();
  rectMode(CENTER);
  translate(500, 500);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  
    //KREIS; UNTEN, LINKS
  pushMatrix();
  rectMode(CENTER);
  translate(0, 500);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  
    //KREIS; OBEN, LINKS
  pushMatrix();
  rectMode(CENTER);
  translate(0, 0);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
}
