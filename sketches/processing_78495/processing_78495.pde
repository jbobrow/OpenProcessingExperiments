
float tam;

void setup() {
  size(1000, 800);
  background(0, 0, 0);
  tam = 100;
}

void draw() {

  //background(0, 0, 0);

  for (int i = 0; i < 30; i++) {
    tam = i*10;
    pushMatrix();
    translate(mouseX, mouseY);
    rotate( i*millis() /10000.0 );
    strokeWeight(1);
    stroke(random(255),random(255),random(255), 10);
    noFill();
    rect(0 - tam/2, 0 - tam/2, tam, tam);
    popMatrix();
  }

}



