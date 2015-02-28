
/*
James Liu
 
 Hold mouse click to add background.
 
 */



int s;

void setup() {
  size(400, 400);
  noStroke();
  smooth ();

  s = 50;
}

void draw() 
{
  if (mousePressed == true)
  {
    background(0);
  }

  for (int q=0; q<10; q++) 
  { 
    stroke(#2143FA);
    strokeWeight(4);
    line(200, 200, random(width), random(height));
    fill(250, 40, 40);
    rect(random(width), random (height), s, s);
    fill(#32FA21);
    ellipse (random(width), random (height), s, s);
  }
}


