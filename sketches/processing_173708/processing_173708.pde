
float theta, easing = 0.2;
suiveur chef;
int frames = 180, num=500;

void setup() {
  size(500, 500);
  chef = new suiveur();
}

void draw() {
  background(0);
  //chef.dessine(mouseX, mouseY);
  float x = width/2 + cos(theta*2)*200;
  float y = height/2 +sin(theta*2)*200;
  chef.dessine(x,y);
  theta += TWO_PI/frames;
}

class suiveur {
  suiveur suivant;
  int i;
  float x, y;
  suiveur() {
    suivant = new suiveur(num);
    x=width/2;
    y=height/2;
  }
  suiveur(int n) {
    i = n;
    if (n>0) suivant = new suiveur(n-1);
  }
  void dessine(float _x, float _y) {
    x=_x+(x-_x)*easing;
    y=_y+(y-_y)*easing;
    fill(255);
    noStroke();
    float sz = map(i, 0, num, 1, 20);
    ellipse(x, y, sz, sz);
    if (suivant!=null) {
      suivant.dessine(x, y);
    }
  }
}

