
int anArray [ ];

void setup() {
  size (100, 400);
  background (140);
  smooth();

  anArray = new int [5];
  for (int i = 0; i < 5; i++) {
    int shades = (int)random(255);
    anArray[i] = shades;
  }
}

void draw() {

  int cx = width/2;

  for (int a=0; a<=4 ; a++) {
    int cy = a;
    fill (anArray[a]);
    ellipse (cx, cy*55+80, 50, 50);
    if (anArray[a] >= 255) {
      anArray[a] = 0;
    } 
    else {
      anArray[a]++;
    }
  }
}

void mousePressed() {
  setup();
}
