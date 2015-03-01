
float theta, easing = 0.1;
suiveur chef;
int frames = 240, num=500;

void setup() {
  size(500, 500);
  chef = new suiveur();
}

void draw() {
  background(#35465c);
  //chef.dessine(mouseX, mouseY);
  float d = map(theta%TWO_PI,0,TWO_PI,50,200);
  float offSet = map(theta%TWO_PI,0,TWO_PI,0,TWO_PI);
  float x = width/2 + sin(theta*4)*d;
  float y = height/2 + sin(theta*4+offSet*2)*d;
  chef.dessine(x,y);
  theta += TWO_PI/frames;
  //if (frameCount>500 && frameCount<=500+frames) saveFrame("image-###.gif");
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

