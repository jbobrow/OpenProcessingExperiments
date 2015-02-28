
void setup()
{
  size (500, 500);
}
void draw()
{

  background(255);

  pushMatrix();
  int sec2= second()*8;
  fill(101, 123, 229);
  noStroke();
  rect(400, 480, 50, 0-sec2);
  popMatrix();

  pushMatrix();
  int min2= minute()*8;
  fill(150);
  noStroke();
  rect(230, 480, 150, 0-min2);
  popMatrix();

  pushMatrix();
  int std2= hour()*8;
  fill(0);
  noStroke();
  rect(30, 480, 180, 0-std2);
  popMatrix();
  
  int s = second();
  int m = minute();
  int st = hour();
  
//Stunden 
textSize(28);
fill(0);
text(st, 105, 50);


//minuten
textSize(28);
fill(0);
text(m, 285, 50);


//Sekunden
textSize(28);
fill(0);
text(s, 405, 50);
}
