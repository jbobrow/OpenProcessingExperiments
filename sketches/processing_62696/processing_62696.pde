
int num = 20;
NShape shape[];

float alpha = 5;

void setup() {
  size(320, 320, P2D);

  shape = new NShape[num];
  
 


  for (int i = 0;i<shape.length;i++) {
    alpha = noise((i+frameCount)/10.0 )*25;
    shape[i] = new NShape(i);
  }
}


void draw() {
  background(0);


  fill(255, 5);
  
  for (int i = 0;i<shape.length;i++) {
    shape[i].draw();
  }
}



class NShape {
  int N;
  float res = 0.01;
  float dia = 100.0;
  color c;
  float x,y;
  float spread = 3.0;


  NShape(int _N) {
    N = _N;
    c = color(random(255), random(255), random(255));
    dia += random(-spread, spread);
    x = random(-spread,spread);
    y = random(-spread,spread);
  }

  void draw() {
    

    res = (sin(frameCount/(((N+10.0)*10.0)))+1.0)*HALF_PI;

    float dil = 0.5/res;
    noStroke();

    pushMatrix();

    fill(c, alpha);

    translate(width/2+sin(frameCount/(N+10.0))*x, height/2+sin(frameCount/(N+10.0))*y);
    beginShape();
    for (float f = frameCount/300.0 ; f < frameCount/300.0+TWO_PI; f+=0.001) {
      if (f%dil<0.001)
        vertex(cos(f)*dia, sin(f)*dia);
    }
    endShape(CLOSE);

    popMatrix();
  }
}


