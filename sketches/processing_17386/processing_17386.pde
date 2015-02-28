
int MAX = 6;
int[] x = new int[MAX];
int[] y = new int[MAX];
color [] elColor = new color[MAX];
int [] speed = new int[MAX];
int [] state = new int[MAX];
PImage b;


void setup() {
  size(500,500);
  for (int i = 0; i < MAX; i++) {
    speed[i] = int(random(1,10));
    x[i] = 0;
    y[i] = 0;
    state[i] = 0;
    elColor[i]= color(random(0,255), 0, random(0,255));
  }
}

void draw() {
   b = loadImage("asfalto.jpg");
     background (b);
     speed();
}   


