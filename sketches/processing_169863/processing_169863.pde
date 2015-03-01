
void setup()
{
  size(500, 350);
  background(#B7F2DA);
}

void draw()
{
  background(#B7F2DA);

  //Mittelpunkt
  pushMatrix();
  ellipse(340, 240, 50, 50);
  popMatrix();

  //Time
  pushMatrix();
  translate(40, 100);
  fill(0);
  textSize(26);
  text("TIME", 0, 0);
  popMatrix();

  //Stunde
  pushMatrix();
  int h = hour();
  textSize(100);
  fill(0);
  text(h, 50, 200);
  popMatrix();
  
  //Punkt
  pushMatrix();
  fill(0);
  ellipse(170,200,15,15);
  popMatrix();
  
  //Minute
  pushMatrix();
  int m = minute();
  textSize(50);
  fill(0);
  text(m, 180, 150);
  popMatrix();
  
  float sec = map(second(), 0, 60, 0, 2*PI);

  //Sekunde
  pushMatrix();
  translate(340, 240);
  rotate(sec);
  translate(0, 40);
  noStroke();
  fill(0);
  ellipse(0, 0, 10, 10);
  popMatrix();

}
