
PImage A;

void setup() {
  A = loadImage("Alphabet.jpg");
  size(300,300);
  background(0);
}

void draw(){
  pushMatrix();
  translate(25,25);
  image(A, 0, 0, 250, 250);
  popMatrix();
}

void mousePressed(){
  tint(random(200), random(200), random(200));
}

void mouseReleased(){
  noTint();
}


