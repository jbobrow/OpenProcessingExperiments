
//Ashley Wong amwong
//copyright Pittsburgh 2012

void setup()
{
  size(600, 400);
  background (225);
  frameRate(20);
}

void draw()
{
 fill(random(255),random(255),0,random(0,25));
 strokeWeight(random(1,3));
 stroke(0, frameCount);
 triangle(pmouseX-random(0,50), pmouseY+random(0,50), 
   pmouseX-random(-50,150), pmouseY+random(-50,150), 
   pmouseX-random(25,75), pmouseY+random(0,50));
}

void mouseClicked()
{
  noStroke();
  fill(225,random(150,250));
  ellipse(mouseX,mouseY,random(50,150),random(200,300));
}

void mouseDragged()
{
  noStroke();
  fill(random(255),0,random(255),random(0,25));
  rect(pmouseX, pmouseY, random(30, 50), random (40, 70));
}

void mouseReleased()
{
  noStroke();
  fill(random(255),0,random(255),random(0,25));
  ellipse(pmouseX, pmouseY, random(30, 50), random (40, 70));
}
