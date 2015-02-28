

boolean ja = true;

float zufall;

void setup() {
  size(300, 300, P3D);
  
}

void draw() {
  
  if(mousePressed == ja) {
    zufall = random(255);
    stroke(zufall,0,0);
  }
  else {
    stroke(0);
  }
  
  background(255);
  translate(150,150);
  rotateX(1.3);
  rotateY(0.3);
  rotateZ(mouseX*0.05);
  box(50);
}


