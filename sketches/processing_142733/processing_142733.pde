
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  //background(255);
  
  noFill();
  stroke(#FFFFFF);
 
  translate(width/2, height/2);
  rotate(millis()/500.0);
  
  pushMatrix();
  translate (50, 50);
  rectMode(CENTER);
  rotate(millis()/500.0);
  rect(0, 0, 25, 25);
  stroke(#FF9966);
  rect(0, 0, 100, 100);
  rect(0, 0, 100, 100);
  popMatrix();

  pushMatrix();
  translate (100, 100);
  rotate(second()/100.0);
  rect(0, 0, 85, 85);
  stroke(#FFFFFF);
  rect(0, 0, 100, 100);
  rect(0, 0, 100, 300);
  popMatrix();
  
  pushMatrix();
  rectMode(CENTER);
  rotate(second()/100.0);
  rect(0, 0, 50, 50);
  stroke(#FFFFFF);
  rect(0, 0, 30, 30);
  popMatrix();
  
  pushMatrix();
  rotate(second()/100.0);
  rect(0, 0, 50, 50);
  stroke(#FFFF66);
  triangle(0, 0, 0, 200, 200, 200);
  popMatrix();
}


