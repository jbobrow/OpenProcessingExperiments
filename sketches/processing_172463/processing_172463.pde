
float W = 1.01;
float H = 1.01;
float A = 1.01;
float B = 1.01;
float C = 1.01;
float D = 1.01;
void setup() {
  size(500, 500);
  background(0);
}
void draw() {
frameRate(500);
  fill(50+W/2,10+H/2,0);
  ellipse(250, 250, W, H);
  W=W+.1;
  H=H+.1;
  println(W);
  if (W>500){
    fill(50+A/2,0,10+A/2);
  ellipse(250, 250, A, B);
  A=A+.1;
  B=B+.1;}
  if (A>500){
    fill(0,50+C/2,10+D/2);
  ellipse(250, 250, C, D);
  C=C+.1;
  D=D+.1;}
}
