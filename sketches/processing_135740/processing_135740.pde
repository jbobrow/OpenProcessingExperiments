
/*
 * Taller Programación MDI Veritas
 * @author Andres Villalobos
 * @date 2/23/14
 * @version 1.0
 */

float iniSize, angle, treeSize;
void setup()
{
  size(600, 600);
  iniSize = 90;
  noFill();
  smooth();
}

void draw()
{
  frameRate(1);
  background(255);
  noStroke();
  fill(100);  
  angle = radians(45);
  treeSize = random(1, 5); //make last branches dynamic  
  translate((width/2)-(iniSize/2), height-200);
  rect(0, 0, iniSize, iniSize);
  noFill();
  recursiveRect(iniSize);
}

void recursiveRect(float s)
{
  float newSide = s/sqrt(2);
  if (newSide > treeSize)
  {
    //left branch
    pushMatrix();
    rotate(-angle);
    stroke((int)random(50, 200), (int)random(100, 200));    
    rect(0, 0, newSide, -newSide);    
    translate(0, -newSide);      
    recursiveRect(newSide);
    popMatrix();

    //right branch
    pushMatrix();      
    rotate(angle);
    translate(0, -newSide);
    stroke((int)random(50, 255), (int)random(100, 200));
    rect(0, 0, newSide, -newSide);
    translate(0, -newSide);
    recursiveRect(newSide);
    popMatrix();
  }
}



