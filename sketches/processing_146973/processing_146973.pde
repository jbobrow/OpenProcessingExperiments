
float amount= 25;
float linlen=0.1;

float easing=0.01;
float xr;
float yr;

void setup() {
  size(900, 700, OPENGL);
}

void draw() {
  background(254);
  translate(width/2, height/2, -200-400*(mouseY/height+0.5));

  xr += (mouseX - xr) * easing;
  yr += (mouseY - yr) * easing;
  float xr1= map(xr/200, 0, 6, -0.5, 1.5);
  float yr1= map(yr/200, 0, 6, -0.5, 1.5);
  rotateX(yr1*TWO_PI*2/3);
  rotateY(xr1*TWO_PI*2/3);
  rotateZ(xr1*TWO_PI/6);

  for (float i=-350; i<250;i+=(width-200)/amount) {
    for (float j =-300; j<300;j+=(height-200)/amount) {
      float kll=linlen/width*dist(i, j, mouseX, mouseY)+0.01;
      line(i+(mouseX*2-i)*kll, j+(mouseY*2-j)*kll, 420*kll*2, (i*0.85)+i*kll*2, j+j*kll*2,kll*2);
    }
  }
}
