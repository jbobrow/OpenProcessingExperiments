
int N = 1000;

void setup(){
  size(500, 500, P3D);
  frameRate(20);
  background(255);
}

void draw(){
  noStroke();
  fill(255, 25);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  
  float ac, am;
  float fc = 0.1, fm = 20;

  ac = 250 * (sin(TWO_PI * frameCount / 100) + 1) / 2;
  am = 100 * (sin(TWO_PI * frameCount / 300) + 1) / 2;

  float x, y;
  for (int n = 0; n < N; n++){
    float r = ac * (sin( TWO_PI * fc * n * am * sin(TWO_PI * fm * n) ) + 1)/2;
    float th = TWO_PI * n / N;
    stroke( lerpColor(color(255,0,0), color(0,0,255), sin(PI*n/N)) );
    x = r * cos(th);
    y = r * sin(th);
    point(x, y);
  }
}


