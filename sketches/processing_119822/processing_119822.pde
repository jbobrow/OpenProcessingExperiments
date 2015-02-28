
void setup()
{
  size(500, 500);
  
}

void draw()
{
  background(245);
  
  //Kreisbahn 
  translate(width/2, height/2); // In die Mitte springen
  
  
  for (int i=0; i<360; i+=30) // 360 Grad in 30° Schritten
  { 
    pushMatrix();
    fill(0);
    rotate(radians(i)); // Um i rotieren
    translate(0, 200); // Um Radius verschieben
    ellipse(0,0,5,5);// auf Kreis
    popMatrix();
  }

for (int i=0; i<360; i+=90) // 360 Grad in 90° Schritten
  { 
    pushMatrix();
    fill(69,201,120);
    noStroke();
    rotate(radians(i)); // Um i rotieren
    translate(0, 200); // Um Radius verschieben
    ellipse(0,0,10,10);
    popMatrix();
  }
  
noFill();

//Sekundenzeiger
  stroke(0);
  float sec = map(second(), 0, 60, 0, 360);
  pushMatrix();
  rotate(radians(sec)); // Um i rotieren
  translate(0, -200); // Um Radius verschieben
  ellipse(0, 0, 10, 10);
  popMatrix();
  
   noFill();
   ellipse(0,0,200,200);
   fill(0);
   ellipse(0,0,10,10);
   noFill();
   
//Minutenzeiger
  stroke(0);
  strokeWeight(1);
  float min = map(minute(), 0, 60, 0, 360);
  pushMatrix();
  rotate(radians(min)); // Um i rotieren
  translate(0, -175); // Um Radius verschieben
  line(0, 0, 0, 175);
  popMatrix();
  
//Stundenzeiger
  stroke(0);
  ellipse(0,0,350,350);
  
  float h = map(hour(), 0, 12, 0, 360);
  pushMatrix();
  rotate(radians(h)); // Um i rotieren
  translate(0, -100); // Um Radius verschieben
  line(0, 0, 0, 100);
  popMatrix();
}

