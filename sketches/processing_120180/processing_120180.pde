
void setup()
{
  size(500, 500);
}
void draw()
{
  
  background(0);
  
  noStroke();
  translate(width/2, height/2);
   noFill();
   strokeWeight(5);
  stroke(255);
  ellipse(0,0,200,200);
  ellipse(0,0,300,300);
  ellipse(0,0,440,440);
  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0,60,0,360);
  float std = map(hour(), 0,12,0,360);
  
  fill(200);
  noStroke();
pushMatrix();
  rotate(radians(min)); // um i rotieren
  translate(0, -150); //um radius verschieben
  ellipse(0, 0, 25, 25);
  popMatrix();
  
pushMatrix();
  fill(255,0,0);
  rotate(radians(sec));
  translate(0,-220);
  ellipse(0,0,20,20);
  popMatrix();
  
  fill(100);
  pushMatrix();
  rotate(radians(std));
  translate(0,-100);
  ellipse(0,0,30,30);
  popMatrix();
  

}

