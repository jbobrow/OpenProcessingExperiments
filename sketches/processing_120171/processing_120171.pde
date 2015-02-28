
void setup()
{
  size(500, 500);
  noStroke();
}

void draw()
{
  background(255);

//graue Punkte
    translate(width/2, height/2); // In die Mitte springen
    for (int i=0; i<360; i+=30) { // 360 Grad in 90° Schritten
    pushMatrix();
    fill(200);
    noStroke();
    rotate(radians(i)); // Um i rotieren
    translate(0, 200); // Um Radius verschieben
    ellipse(0, 0, 10 , 10);
    popMatrix();
  }

//12,2,6,9
  for (int i=0; i<360; i+=90) { // 360 Grad in 90° Schritten
    pushMatrix();
    fill(0);
    rotate(radians(i)); // Um i rotieren
    translate(0, 200); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
  }

//Sekundenzeiger
  float sec = map(second(), 0, 60, 0, 360);
  pushMatrix();
  stroke(3,131,255);
  strokeWeight(1);
  rotate(radians(sec)); // Um i rotieren
  translate(0, -180); // Um Radius verschieben
  line(0, 0, 0, 180);
  popMatrix();
  
//Minutenzeiger
  float min = map(minute(), 0, 60, 0, 360); 
  pushMatrix();
  fill(0);
  stroke(0);
  strokeWeight(3);
  rotate(radians(min)); // Um i rotieren
  translate(0, -180); // Um Radius verschieben
  line(0, 0, 0, 180);
  popMatrix();

//Stundenzeiger
  float h = map(hour(), 0, 12, 0, 360); 
  pushMatrix();
  stroke(0);
  strokeWeight(5);
  rotate(radians(h)); // Um i rotieren
  translate(0, -160); // Um Radius verschieben
  line(0, 0, 0, 160);
  popMatrix();

  
//Mittelkreis / Rahmen
  pushMatrix();
  noStroke();
  fill(3,131,255);
  ellipse(0, 0, 20, 20);
  popMatrix();
  
  pushMatrix();
  noFill();
  stroke(200);
  strokeWeight(2);
  ellipse(0,0,430,430);
  popMatrix();
}

