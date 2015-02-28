
float tam;

void setup() {
  size(1000, 800);
  background(0, 0, 0);
  tam = 100;
}

void draw() {

  background(0, 0, 0);

  for (int i = 0; i < 80; i++) {
    tam = i*10;
    pushMatrix();
    translate(width/2, height/2);
    rotate( i*millis() /100000.0 );
    strokeWeight(1);
    //stroke(random(255),random(255),random(255));
    stroke(255);
    noFill();
    ellipse(sin(i), sin(i), tam+i, tam);
    popMatrix();
  }

}



