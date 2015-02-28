
int lineNo = 179;
float [] theta = new float [lineNo];
float [] radius = new float [lineNo];
void setup(){
  size(500,500);
  for (int x = 0; x < theta.length; x++){
    theta[x] = x * 2 * PI / (lineNo);
  }
}
void draw(){
  translate(250, 250);
  background(255);
  for (int x = 0; x < theta.length; x++){
    radius[x] = 200 * sin(theta[x] * millis() * .00001 % 20);
    line(0, 0, radius[x] * cos(theta[x]), radius[x] * sin(theta[x]));
  }
}
