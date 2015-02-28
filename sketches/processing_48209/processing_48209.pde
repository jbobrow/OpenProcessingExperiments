
float angle = 0.0;

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {


  if (mousePressed) {
    fill(0);      
    stroke(10);
    translate(mouseX, mouseY);
    rect(0, 0, 0, 100 );

  }

  angle+=0.1; //try commenting this line out,
}


void mouseClicked() {
  background(255);
}


