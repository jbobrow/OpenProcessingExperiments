
float counter = 0;
void setup ()
{
  size (500, 800);
}
void draw ()
{
  colorMode(HSB, 360, 100, 100);


  float h = map(sin(counter), -1, 1, 0, 360); //strecke-1bis1,farbe
  background(h, 100, 1000);   //sinus+sättigung+helligkeit
  counter += 0.00000468; //geschwindigkeit durchlaufs



  ellipse (10, 160, 10, 10); //06:00 Uhr
  textSize(20);
  text("06:00", 3, 190);
  ellipse (83, 10, 10, 10); //10:00 Uhr
  textSize(20);
  text("10:00", 50, 40);
  ellipse (166, 130, 10, 10); //14:00 Uhr
  textSize(20);
  text("14:00", 140, 160);
  ellipse (290, 90, 10, 10); //20:00 Uhr
  textSize(20);
  text("20:00", 260, 120);
  ellipse (400, 230, 10, 10); //04:00 Uhr
  textSize(20);
  text("04:00", 370, 260);
  ellipse (490, 160, 10, 10); //06:00 Uhr
  textSize(20);
  text("06:00", 440, 190);
  


  translate(width/2, height/1.5);
  for (int i=0; i<360; i+=10) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 200); // Um Radius verschieben
    ellipse(0, 0, 15, 15);
    popMatrix();
  }

  for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 200); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
  float sec = map(second(), 0, 60, 0, 360);
  println(sec);

  pushMatrix();
  rotate(radians(sec)); // Um i rotieren
  translate(0, -180); // Um Radius verschieben
  ellipse(0, 0, 15, 15);
  noStroke();
  popMatrix();



  float min = map(minute(), 0, 60, 0, 360);
  println(min);

  pushMatrix();
  rotate(radians(min)); // Um i rotieren
  translate(0, -150); // Um Radius verschieben
  ellipse(0, 0, 20, 20);
  noStroke();
  popMatrix();

  float std = map(hour(), 0, 12, 0, 360);
  println(std);

  pushMatrix();
  rotate(radians(std)); // Um i rotieren
  translate(0, -130); // Um Radius verschieben
  ellipse(0, 0, 25, 25);
  noStroke();
  popMatrix();
}

