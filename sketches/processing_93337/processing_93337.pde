
float r= 0;
float i= 0;

float l=random(-400, 400);

void setup () { 
  size(800, 800);
  background(10);
  smooth();
  noStroke();
  rectMode(CENTER);
}
void draw () {

  translate(400, 400);
  fill(0, 1);
  rect(0, 0, 800, 800);


  fill(random(255), random(100, 250), 0);

  rotate(r); 
  float circle_size = random(10, 15);
  ellipse(0+r, 30, circle_size, circle_size);


  r = r + (noise(1));
  if ( r > 420) { 
    r=-r;
  }
}



