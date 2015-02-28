
int f, num = 50, vari = 25;
float sz;
int col[] = new int[num];
boolean save;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  frameRate(5);

  for (int i=0; i<num; i++) {
    col[i]= (int) random(360);
  }
}

void draw() {
  background(#202020);

  for (int i=0; i<num; i++) {
    float x = width/2 + random(-vari, vari);
    float y = height/2 + random(-vari, vari);
    stroke(col[i], 100, 100, 50);
    strokeWeight(width/10);
    noFill();
    sz = width/2;
    ellipse(x, y, sz, sz);
  }
   
}

void mouseClicked() {
  setup();
}

void keyPressed() {
  save(random(2323)+".png");

}

