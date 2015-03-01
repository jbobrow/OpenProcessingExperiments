
float i, r, a, t;

void setup() {
  size(400, 400);
}

void draw() {

  background (0);
  stroke(22, 187, 250, 250);
  strokeWeight (2);

  for (i=0; i<200; i++) {
    a=noise2(i/64)*9+t/r;
    point( 200+cos(a)*r, 200+sin(a)*r/2);
    r=abs(noise2(i)-.2)*mouseX;
  }

  t+=0.7;

  for (i=0; i<200; i++) {
    a=noise2(i/64)*9+t/r;
    point(200+cos(a)*r, 200+sin(a)*r/2.5);
    r=abs(noise2(i)-.4)*mouseX;
  }

  t+=0.4;

  for (i=0; i<200; i++) { 
    a=noise2(i/60)*9+t/r;
    point(200+cos(a)*r*0.89, 200+sin(a)*r/2.3);
    r=abs(noise2(i)-.2)*mouseX;
  }

  t+=0.32;
}

float noise2(float n){
  randomSeed(round(n*100000));
  return random(1);
}



