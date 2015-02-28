
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
  stroke(32, 178, 170, 10);
  
  //KREIS IN DER MITTE // DREHENDES QUADRAT; Groß
  pushMatrix();
  rectMode(CENTER);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  resetMatrix();
  
  //KREIS WANDERND; VON LINKS OBEN NACH RECHTS UNTEN; BLAU
  pushMatrix();
  //background (255)
  float pos = map(second(), 0, 59, 0, 500);
  translate(pos, pos);
  stroke(0, 134, 139, 2);
  ellipse(0, 0, 500, 500);
  popMatrix();
  
  //KREIS WANDERND; VON RECHTS OBEN NACH LINKS UNTEN; 
  pushMatrix();
  //background (255)
  float pos3 = map(second(), 0, 59, 0, 500);
  translate(500-pos3, pos3);
  stroke(0, 134, 139, 2);
  ellipse(0, 0, 500, 500);
  popMatrix();
  
  //KLEINER KREIS; OBEN
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, 0);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  
    //KLEINER KREIS; UNTEN
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, 500);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  
     //KLEINER KREIS; LINKS
  pushMatrix();
  rectMode(CENTER);
  translate(0, height/2);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  
     //KLEINER KREIS; RECHTS
  pushMatrix();
  rectMode(CENTER);
  translate(500, height/2);
  rotate(millis()/3000.0);
  rect(0, 0, 500, 500);
  popMatrix();
  
}
