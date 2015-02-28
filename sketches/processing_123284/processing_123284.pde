
float counter = 0;
 
void setup()
{
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
}
 
void draw()
{
 
  //Hintergrund
   
  if (hour() > 0 && hour() < 8)
  {
    background (58, 0, 78);
  }
  else
  {
    background(58, 0, 26);
  }
 
 
  if (hour() >=8 && hour() < 17)
  {
    background (58, 0, 78);
  }
  else
  {
    background(58, 0, 26);
  }
 
 
 
  translate(width/2, height/2);
 
  //Stunde
 
 
  {
    int h = hour()*25;
    fill(330, 0, 100);
    noStroke();
    rect(-300, 0, h, 5);
  }
 
 
  //Minute
  float min = map (minute(), 0, 60, 0, 360);
  pushMatrix();
  noStroke();
  fill (330, 0, 100);
  rotate (radians(min));
  translate (0, -200);
  ellipse (0, 0, 65, 65);
  popMatrix();
 
  //Sekunde
  float sec = map (second(), 0, 60, 0, 360);
  float b = map(sin(counter), -1, 1, 0, 100);
 
  pushMatrix();
  noStroke();
  fill (b, 100, 100);
  rotate (radians(sec));
  translate (0, -270);
  ellipse (0, 0, 10, 10);
  counter += 0.1;
  popMatrix();
}

