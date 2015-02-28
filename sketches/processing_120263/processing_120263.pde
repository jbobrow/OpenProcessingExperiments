
void setup()
{
  size(500, 500);
}

void draw()
{
  background(245);

  //Kreisbahn 
  translate(width/2, height/2); // In die Mitte springen

  fill(255);
  ellipse(0, 0, 450, 450);
 
  //Stundenzeiger
  float std = map(hour(), 0, 12, 0, 360);
  pushMatrix();
  
  rotate(radians(std)); // Um i rotieren
  translate(0, -150); // Um Radius verschieben
  fill(180);
  ellipse(0, 0, 150, 150);
  
  float min = map(minute(), 0, 60, 0, 360); //Minutenzeiger
  rotate(-radians(std));
  rotate(radians(min)); // 
  translate(0,-67); // Um Radius verschieben
  fill(0);
  ellipse(0, 0, 15, 15);
  
  popMatrix();
  
  //Sekundenzeiger
  stroke(0);
  fill(69,201,120);
  float sec = map(second(), 0, 60, 0, 360);
  pushMatrix();
  rotate(radians(sec)); 
  translate(0, -225); 
  ellipse(0, 0, 10, 10);
  popMatrix();

 }

