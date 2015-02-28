
float altura, t;
void setup() {
    size(900,450);
  background(255);
  //smooth();
  strokeWeight(1);
  altura=-500;
}

void draw() {
  background(255);

  //background(0);
  while (altura<height) {
    fill(0, 100, 150, sqrt(altura/5));

    noStroke();
   // stroke(255);
    float quantos=50;

    beginShape();
    curveVertex(-width/quantos, altura);
    for (int i = 0; i<quantos+1; i++) {
      curveVertex(i*width/quantos, altura+1000.0/altura*(noise(i*t*altura)+cos(millis()/500.0+i*width/quantos/100)));
    }

    curveVertex(1.1*width, altura);
    curveVertex(1.1*width, height);
    curveVertex(0, height);
    curveVertex(-1.1*width, height);
    endShape();
    altura=altura+20;
  }
  altura=(-100);
  t=t+1;
}
