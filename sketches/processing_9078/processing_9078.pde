
float phase2 = 0.4;
float phase = 0;
int hSize = 84;
int vSize = 84;
int cellScale = 8;
int hw = hSize/2;
int hh = vSize/2;

float xPhase = hSize * 0.61025641025641025641025641025641;
float distMax = 94f;

void setup () {
  colorMode(HSB);
  size(672, 672);
  noStroke();
}

void draw () {
  phase += 0.005;
  phase2 += 0.00111;
  float d;
  float half = hSize/2;
  float hx, hy;
  hx = hw + 6 * cos(phase*PI*2+phase2);
  hy = hh + 8 * sin(phase*PI);
  for (int y = 0; y < hSize; ++y) {
    for (int x = 0; x < vSize; ++x) {
      d = (noise(x/xPhase+phase*3, y/xPhase, phase) * 4.2) * (sqrt(pow(x-hx,2)+pow(y-hy,2))/distMax);
      noStroke();
      fill(color(256-((1-d)*64),208+(pow(d*58,2)), pow((1-d)*24,2)%256));
      rect(x*cellScale,y*cellScale,cellScale,cellScale);
      stroke(color(30,255,150));
      point(x*cellScale,y*cellScale);
    }
  }
}


