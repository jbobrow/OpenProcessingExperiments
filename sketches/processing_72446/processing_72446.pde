
void setup(){
  size(600,600);
  noLoop();
  smooth();
float[] sinwave = new float[width];
for (int i = 0; i < width; i++) {
  float amount = map(i, 0, width, 0, PI);
  sinwave[i] = abs(sin(amount));
}
for (int i = 0; i < width; i++) {
  stroke(sinwave[i]*150);
  line(i, 0, i, width);
  }
}
void drawCircle(){
  noStroke();
   ellipse(random(height), random(width), 55, 55);
    fill(random(255),random(255),random(255),75+random(100));
}
void draw(){
    for(int i=0;i<200;i++){
    drawCircle();
  }
}

