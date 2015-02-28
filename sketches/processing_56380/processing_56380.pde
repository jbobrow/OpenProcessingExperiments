
int numpetalos=20;
int initalloX=200;
int initalloY=800;
float factorscala=0.5;

void setup() {

  size(floor(400*factorscala), floor(800*factorscala));

  background(150);
  smooth();
}

void draw() {
  scale(factorscala, factorscala);
  stroke (0, 255, 0);
  fill (0, 255, 0);
  strokeWeight(10);
  line(initalloX, initalloY, initalloX, ((frameCount>250)?initalloY-500:initalloY-(2*frameCount)));
  if (frameCount>101) {
    noStroke();
    translate(initalloX, initalloY-200);
    scale(min((float)(frameCount-100)/100, 1), min((float)(frameCount-100)/100, 1));
    beginShape();
    vertex(0, 0);
    bezierVertex(-40, -5, -30, -40, -80, -20);
    bezierVertex(-47, -16, -52, 8, 0, 0);
    endShape(CLOSE);
    scale(1/min((float)(frameCount-100)/100, 1), 1/min((float)(frameCount-100)/100, 1));
    translate(-initalloX, -(initalloY-200));
  }
  if (frameCount>151) {
    noStroke();
    translate(initalloX, initalloY-300);
    scale(-min((float)(frameCount-150)/150, 1), min((float)(frameCount-150)/150, 1));
    beginShape();
    vertex(0, 0);
    bezierVertex(-40, -5, -30, -40, -80, -20);
    bezierVertex(-47, -16, -52, 8, 0, 0);
    endShape(CLOSE);
    scale(-1/min((float)(frameCount-150)/150, 1), 1/min((float)(frameCount-150)/150, 1));
    translate(-initalloX, -(initalloY-300));
  }

  fill(240, 180, 7);
  stroke(220, 170, 5);
  strokeWeight(4);
  if (frameCount>250) {
    translate(initalloX, initalloY-500);
    for (int i=0; i<min(((frameCount-250)/3),numpetalos); i++) {
      ellipse(0, 90, 50, 90);
      rotate(2*PI/numpetalos);
    }
    fill(57, 27, 3);
    ellipse(0, 0, 140, 140);
    stroke(20);
    strokeWeight(0.2);
    fill(70, 35, 10);
    ellipse(0, 0, 120, 120);
  }
}


