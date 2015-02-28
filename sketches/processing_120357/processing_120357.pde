
void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  //Mund
  pushMatrix();
  translate(width/2,height/2);
   fill(0);
  noStroke();
  ellipse(0, -5, 350, 350);
  fill(255);
  ellipse(0, -5, 360, 230);
  ellipse(0, -75, 360, 230);
 
popMatrix();

  float min = map(minute(), 0, 60, 0, 360);
  float h = map(hour(), 0, 12, 0, 360);

  //Augen: Stunden + Minuten
  pushMatrix();

  translate(width/4, height/4); //in die Mitte springen
 fill(125);
  noStroke();
  ellipse(0, 0, 110, 110);
  for (int i=0; i<360; i+=10) //360 grad in 20° schritten
  {
    pushMatrix();
    rotate(radians(i)); // um i rotieren
    translate(0, -60);    // um radius verschieben -i/2.0 Schnecke wird  kleiner
    stroke(0);
    line(0, 0, 0, -10);
    popMatrix();
  }
  //Minuten
  rotate(radians(min)); // Um min rotieren
  translate(0, -40); // Um Radians verschieben
  fill(0);
  ellipse(0, 0, 20, 20);
  popMatrix();

  //stunden
  pushMatrix();
  translate(width/1.35, height/4);
  fill(125);
  noStroke();
  ellipse(0, 0, 110, 110);
  for (int i=0; i<360; i+=30) //360 grad in 20° schritten
  {
    pushMatrix();
    rotate(radians(i)); // um i rotieren
    translate(0, -60);    // um radius verschieben -i/2.0 Schnecke wird  kleiner
    stroke(0);
    line(0, 0, 0, -10);
    popMatrix();
  }
  rotate(radians(h)); // Um h rotieren
   // Um Radians verschieben
  /*pushMatrix();
  translate(0, -20);
  fill(255);
  noStroke();
  ellipse(0, 0, 40, 60);
  popMatrix();
  */
  translate(0, -35);
  fill(0);
  noStroke();
  ellipse(0, 0, 30, 30);
  popMatrix();

  //Zunge: Sekunden
  translate(width/2, height/2);
 
  pushMatrix();
  float sec = map(second(), 0, 60, 110, 230);
  
  rotate(radians(sec)); // Um sec rotieren
  translate(0, -255); // Um Radians verschieben
  
  fill(255, 0, 0);
  noStroke();
  rect(0, 0, 50, 100, 30);
  stroke(0);
  line(25, 100, 25, 10);

  popMatrix();
  
    //Nase
  pushMatrix();
 
  fill(125);
  noStroke();
  ellipse(0, 0, 200, 150);
  fill(255);
  noStroke();
  ellipse(-30, 0, 20, 30);
  ellipse(30, 0, 20, 30);
  popMatrix();
}

