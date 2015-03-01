
PFont f;
int textH = 5, textS = 9, textB = 10;
int speed = 1, zoom = 1;

void setup() {
  size(1080, 600);
  background(0);
  colorMode(HSB);
  //printArray(PFont.list());
  println(frameRate);
  f = createFont("IowanOldStyle-Titling", 20);
  textAlign(CENTER);
  textFont(f);
}

void draw() {

  int k = 1;
  zoom = zoom+speed;
  if (zoom==25) {
    zoom = k;
  };
  while (k<zoom) {
    int i = 1;
    while (i<6) {
      textSize(12*k);
      fill(textH*k*2.2, textS*k*2, textB*k*2, 250-k*7);
      text("oOoOoOoOoOoOo", width/2, height/5*i);
      i++;
    }
    k++ ;
  }
}



