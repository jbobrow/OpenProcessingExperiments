
float theta=0;

void setup() {
  size(700, 700);
  smooth();
}

void draw() {
  theta+=.20;
  background(230);
  stroke(#2234C9);
  translate(width/2, height/2);
  noFill();
  float r=250;
  for (float i=-0.5*PI;i<PI+0.5*PI;i+=0.01*PI) {
    beginShape();
    for (float j=-sin(i)*r;j<sin(i)*r+sin(i);j+=sin(i)*20) {
      curveVertex(j, cos(i)*r+sin(theta-(j/40))*abs(i*10));
    }
    endShape();
  }
}



