
float xold = 0.0;
float xnew = 0.0;
float yold = 0.0;
float ynew = 0.0;
float zold = 0.0;
float znew = 0.0;

int xstep;
int ystep;

void setup() {
  size(400, 400, P3D);
  xstep = 10;//width/10;
  ystep = 10;//height/10;
  stroke(2);
}
float angle = 0.0;

void draw() {
  background(255);
  translate(0, height/2);
  rotateX(angle);
  //fill(144);
  angle += 0.1;
  
  for (float i=0; i<width-xstep;i+=xstep) {
      for (float j=0; j<(height-ystep);j+=ystep) {
        beginShape();
        vertex(i, j, sin(i/width*2*PI)*50);
        vertex(i+xstep, j, sin((i+xstep)/width*2*PI)*50);
        vertex(i+xstep, j+ystep, sin((i+xstep)/width*2*PI)*50);
        vertex(i, j+ystep, sin(i/width*2*PI)*50);
        endShape();
      }
  }
}



