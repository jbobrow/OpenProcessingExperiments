
void setup()
{
  size(600, 600);
  frameRate(15);
}

void draw()
{
  background(#0C113E);
  fill(255);
  noStroke();
  stroke(#B2B1B0);
  strokeWeight(50);
  line(400, 100, 500, 600);
  noStroke();
  fill(#FEFF17);
  
  ellipse(320, 100, 200, 130); 
  rotate(radians(15));
  
  for (float a=0; a<width; a+=5) {
    float rainB = random(0, width);
    float rainC= random (5, 15);

    stroke(#85BDEA, 150);
    strokeWeight(3);
    line ( rainB, a+rainC, rainB, a-rainC);

  }
 
}

