
float px[], py[], pz[];
float s = 1;
float f = 200;

void setup() {
  size(650, 650, P3D);
  background(255);
  smooth(8);
  frameRate(1000);
}

void draw() {
  px = new float[4];
  py = new float[4];
  pz = new float[4];
  background(255);
  translate(width/2, height/2);
  rotateY(sin((mouseX-width/2)/650.0) * TAU);
  rotateX(sin((mouseY-height/2)/650.0) * TAU);
  s *= 0.9;
  for(int i = 0; i < 1000; i++) {
    px[3] = px[2];
    py[3] = py[2];
    pz[3] = pz[2];
    px[2] = px[1];
    py[2] = py[1];
    pz[2] = pz[1];
    px[1] = px[0];
    py[1] = py[0];
    pz[1] = pz[0];
    px[0] = -(abs(px[0]) + f) + noise(i*2.543f + millis() * 0.0001f) * ((abs(px[0]) + f)+(abs(px[0]) + f));
    py[0] = -(abs(py[0]) + f) + noise(i*2.222f + millis() * 0.0001f) * ((abs(py[0]) + f)+(abs(py[0]) + f));
    pz[0] = -(abs(pz[0]) + f) + noise(i*2.178f + millis() * 0.0001f) * ((abs(pz[0]) + f)+(abs(pz[0]) + f));
    noFill();
    stroke(round(noise(i) * 255));
    curve(px[3], py[3], pz[3], px[2], py[2], pz[2], px[1], py[1], pz[1], px[0], py[0], pz[0]);
  }
}
