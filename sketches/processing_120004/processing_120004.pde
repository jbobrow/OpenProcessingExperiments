
void setup ()
{
  size(500, 500);
}
void draw()
{
  background(225);

  translate(width/2, height/2);


for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 60); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }

 for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 80); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }

 for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 100); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }

 for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 120); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }

 for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 140); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }
   
 for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 160); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }

 for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 180); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }

 for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 200); // Um Radius verschieben
    ellipse(0, 0, 15, 15);
    popMatrix();
   }
   
   for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 220); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }
  
   for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 240); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }
    for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 260); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }
    for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 280); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }
  
  for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 300); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }
   for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 320); // Um Radius verschieben
    ellipse(0, 0, 10, 10);
    popMatrix();
   }
   for (int i=0; i<360; i+=15) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, 340); // Um Radius verschieben
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
  
  

