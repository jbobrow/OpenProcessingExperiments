
S myS1;

void setup() {
  size(900, 900, P3D);
  myS1=new S(color(255, 0, 0), random(450), random(450), random(-450), 
  10, 10, 10, 100);
}

void draw() {
  background(0);
  translate(450, 450, 0);
  rotateY(0.5);
  stroke(255);
  noFill();
  box(500, 500, 500);

  pointLight(255, 255, 255, 35, 40, 50);
  myS1.move();
  myS1.bounce();
  myS1.display();
}


