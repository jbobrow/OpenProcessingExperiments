
void setup()
{
  size(800, 800);
  background(0);

  fill(255);
  stroke(0, 0, 0);

  smooth();
}

void draw()
{

  println(degrees(mouseX/100.0));
  translate(width/2, height/2);

  rotate(radians(millis())*5);
  rectMode(CENTER);
  
  
  fill(255,80,0);
  rect(50, 50, 50, 25, 50);
  translate(50, 50);
  fill(255,106,0);
  rect(50, 100, 50, 25, 50);
  translate(50, 50);
  fill(255,143,18);
  rect(50, 100, 50, 25, 50);
  fill(255,183,24);
  translate(50, 50);
  rect(50, 100, 50, 25, 50);


  //pushMatrix();
  //fill(200);
  //triangle(0,50,0,50,25,50);
  //popMatrix();
}



