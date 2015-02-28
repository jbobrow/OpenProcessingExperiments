
void setup() {
  size(500, 500);
}
void draw() {

  background(255);

  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float h = map(hour(), 0, 12, 0, 360);
  fill(125);
  noStroke();
  ellipse(width/2, height/2, 450, 450);


  //Ziffernblatt
  translate(width/2, height/2); //in die Mitte springen

  for (int i=0; i<360; i+=30) //360 grad in 20° schritten
  {
    pushMatrix();
    rotate(radians(i)); // um i rotieren
    translate(0, -200);    // um radius verschieben -i/2.0 Schnecke wird  kleiner
    stroke(255);
    line(0, 0, 10, -10);
    popMatrix();
  }

  for (int i=0; i<360; i+=90) //360 grad in 20° schritten
  {
    pushMatrix();
    rotate(radians(i)); // um i rotieren
    translate(0, -200);    // um radius verschieben -i/2.0 Schnecke wird  kleiner
    stroke(255);
    line(0, 0, 10, 10);
    popMatrix();
  }

  fill(255);
  noStroke();
  ellipse(0, 0, 340, 340);
  fill(0);
  noStroke();
  ellipse(0, 0, 150, 150);

  //Sekundenzeiger
  pushMatrix();
  //float SekZeiger = map(mouseY, mouseX, width, 0, 2*PI);
  //rotate(mouseX/50.0); 
  rotate(radians(sec)); // Um sec rotieren
  translate(0, -200); // Um Radians verschieben
  rotate(mouseX/20.0);
  fill(255, 0, 0);
  noStroke();
  rect(0, 0, 10, 10);
  popMatrix();

  //Minutenzeiger
  pushMatrix();
  rotate(radians(min)); // Um min rotieren
  translate(0, -200); // Um Radians verschieben
  stroke(255, 0, 0);
  line(0, 0, 0, 200);
  popMatrix();

  //Stundenzeiger
  pushMatrix();
  rotate(radians(h)); // Um h rotieren
  translate(0, -100); // Um Radians verschieben
  line(0, 0, 0, 100);
  popMatrix();
}

