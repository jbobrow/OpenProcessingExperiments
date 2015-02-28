
//Homework 4
//copyright Emily Wobb, Pittsburgh

void setup()
{
  size(400,400);
  smooth();
  background(255, 255, 255);
  
}

void draw()

{
  
  if (keyPressed) {
      if (key == ' ')
        translate(frameCount%random(400), frameCount%random(400));
        fill(random(255), random(255), random(255));
        stroke(random(255), random(255), random(255));
        strokeWeight(1);
        beginShape();
          vertex(0, -50);
          vertex(14, -20);
          vertex(47, -15);
          vertex(23, 7);
          vertex(29, 40);
          vertex(0, 25);
          vertex(-29, 40);
          vertex(-23, 7);
          vertex(-47, -15);
          vertex(-14, -20);
          endShape(CLOSE); 

  }
  
}



