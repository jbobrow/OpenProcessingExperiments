
void setup()
{
  size(500, 500);
  background(255);
}

 
void draw()
{
  translate(width/3, height/3);
  noFill();
  stroke(0, 0, 0, random(10));

 //aussen big
  pushMatrix();
  rectMode(CENTER);
  rotate(millis()/3000.0);
       rect(0, 0, 600,600);
  translate(width/2, 250);
      rect(0, 0, 500, 500);
  translate(250, height/2);
        rect(0, 0, 500, 500);
  popMatrix();
  resetMatrix();
  }
