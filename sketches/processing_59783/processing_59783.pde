
int colony = 2000;
float[] x = new float [colony];
float [] y = new float [colony];
float chance = 1;
int k = 1;
int firstpoint;
int a = 1;
int b = 1;
float sw;
float startx = 250;
float starty = 250;
float[] colourcheckx = new float [360];
float[] colourchecky = new float [360];

float h = 1;
float t = 0;
int check;

int click;

void setup() {
  size (500, 500);
  background (225);
  click = 1;
  smooth();
  int i = 0;
  while (i<colony) {
    x[i] = -10;
    y[i] = -10;
    i++;
    firstpoint = 1;
    sw = 50;
  }
  int j = 0;
  while (j<360) {
    colourcheckx[j] = 250+cos(radians(j))*100;
    colourchecky[j] = 250+sin(radians(j))*100;
    j++;
  }
}
void draw() {
  t = random(radians(0), radians(360));
  stroke(120, (int)random(50, 80), 40, 100);
  sw = (int)random(3, 8);
  strokeWeight(sw);
  h = (int)random(1, 8);
  while (firstpoint == 1) {
    x[0] = startx;
    y[0] = starty;
    firstpoint = 0;
  }

  x[a] = x[a-1]+cos(t)*h;
  y[a] = y[a-1]+sin(t)*h;
  a++;
  b = 0;
  while (b<360){
    if ((x[k]>colourcheckx[b]-2)&&(x[k]<colourcheckx[b]+2)&&(y[k]>colourchecky[b]-5)&&(y[k]<colourchecky[b]+5)){
      stroke(160, 120, 40, 200);
    }
    if (b == 359){
    point (x[k], y[k]);
    }
    b++;
  }
    
  k++;
  if (a == colony) {
    a = 1;
    x[0] = startx;
    x[0] = starty;
    k = 1;
    sw = random(10, 50);
  }
}


