
void setup() {
  size(300, 250);
  colorMode(HSB, 360, 100, 100);
  background(350);
  smooth();
}

int w = -120;
int h = 200;

int start = -1;
float end = PI/2;

float c = random(12);

int a_flg = 1;
int w_flg = 1;


void draw() {
  background(350);


  stroke(0);

  fill(c*30, 100, 100, 30);

  translate(width/2, height/2);

  for (int i = -3; i < 3;i++) {
    arc(0, 0, w + 50 * i, h, start * PI/2, end);
  }

  line(0, -100, 0, 100);

  if (w_flg == 1) {
    w--;
  }
  else {
    w++;
  }

  if ( w > 200) {
    w_flg *= -1;
  }

  if (w < -120) {
    a_flg *= -1;
    w_flg *= -1;
    c = random(12);
  }

  if (a_flg == 1) {
    end = PI/2;
    start = -1;
  }
  else {
    end = PI * 3/2;
    start = 1;
  }
}

