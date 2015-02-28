
//Homework5
//Vishal Agrawal
//vishala@andrew.cmu.edu
//copyright (C) 2012

void setup()
{
  size(500, 500);
  smooth();
}

void draw()
{
  background(#EAECEA);
  noStroke();
  fill(#5C2369);
  rect(0,0, width,5);
  initials(mouseX, mouseY, mouseX%width, mouseY%height);
  saveFrame("hw5.jpg");
}

void initials(float x, float y, float dia, float dia2)
{
    //set stroke weight
  strokeWeight(7);
  stroke(#5C2369);
  
  //draw circle
    noFill();
  ellipse(x, y, dia, dia2);
  
  beginShape();
    vertex(x-(dia/2), y);
    vertex(x-(dia/2), y);
    vertex(x, y+(dia2/2));
    vertex(x, y+(dia2/2));
  endShape();
  
  beginShape();
    vertex(x, y+(dia2/2));
    vertex(x, y+(dia2/2));
    vertex(x, y-(dia2/2));
    vertex(x, y-(dia2/2));
  endShape();
  
  beginShape();
    vertex(x, y-(dia2/2));
    vertex(x, y-(dia2/2));
    vertex(x+(dia/2), y);
    vertex(x+(dia/2), y);
  endShape();
  
  beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex(x+(dia/3), y-(dia2/6));
    curveVertex(x+(dia/3), y-(dia2/6));
  endShape();
}               
