
void setup()
{
  size(500, 500);
  background(255, 255, 255);
}



void draw()
{  
  float rot = map(mouseY, 0, 500, 0, 360);
  background(255);
  noStroke();

  //linien
  fill(0);
  pushMatrix();
  rect(0, 50, 1000, 15);
  rect(0, 90, 1000, 15);
  rect(0, 130, 1000, 15);
  rect(0, 200, 1000, 15);

  rect(0, 300, 1000, 15);
  rect(0, 340, 1000, 15);
  rect(0, 440, 1000, 15);
  rect(0, 510, 1000, 15);
  rect(0, 500, 1000, 15);
  popMatrix();

  pushMatrix();
  rectMode(CENTER); 
  translate(250, 250);
  rotate(radians(rot));
  rect(0, 0, 1000, 15);
  popMatrix();
}



