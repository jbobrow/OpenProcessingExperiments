
float radius = 100;
float angle = 0;


void setup() {
  size(500, 500, P3D); 
  noFill();
  smooth();
}


void draw() {
  translate(width/2, height/2);
  background(0);
  angle += 0.1;

  strokeWeight(3);
  noFill();
  stroke(random(255), random(255), random(255));
  float x = cos(angle) * radius; 
  float y = sin(angle) * radius;

  rotateX(angle);
  stroke(random(255), 255, 255);
  ellipse(0, 0, radius*2, radius*2); 

  rotateX(angle);
  stroke(random(255), random(255), 0);
  ellipse(0, 0, radius*2, -radius*2);

  rotateX(angle);
  stroke(255, 255, random(255));
  ellipse(0, 0, -radius*2, radius*2);

  rotateX(angle);
  stroke(255, random(255), 255);
  ellipse(0, 0, radius*2, radius*2);

  rotateX(angle);
  stroke(random(255), 0, random(255));
  ellipse(0, 0, -radius*2, radius*2);

  rotateX(angle);
  stroke(0, random(255), random(255));
  ellipse(0, 0, radius*2, -radius*2);

  rotateY(angle);
  stroke(random(255), 255, 255);
  ellipse(0, 0, radius*2, radius*2); 

  rotateY(angle);
  stroke(random(255), random(255), 0);
  ellipse(0, 0, radius*2, -radius*2);

  rotateY(angle);
  stroke(255, 255, random(255));
  ellipse(0, 0, -radius*2, radius*2);

  rotateY(angle);
  stroke(255, random(255), 255);
  ellipse(0, 0, radius*2, radius*2);

  rotateY(angle);
  stroke(random(255), 0, random(255));
  ellipse(0, 0, -radius*2, radius*2);

  rotateY(angle);
  stroke(0, random(255), random(255));
  ellipse(0, 0, radius*2, -radius*2);
}
