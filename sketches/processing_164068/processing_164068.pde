
PImage Spa, patrick, not;
float vari = 0;
float varil = 0;
float r = random(50);
float c2 = random(20);
float c3 = c2+r;
void setup() {
  size(860, 700);
  Spa = loadImage("Spa.jpg");
  pat = loadImage("patrick.jpg");
  not = loadImage("not.png");
}

void draw() {
  if (vari >= 50007) {
    Spa.filter(THRESHOLD);
    rotate(r);
  }
  image(Spa, 0, 0);
  vari=vari+5;
  varil=varil+5;
  if (vari >= 300) {
    Spa.filter(INVERT);
    vari=vari+random(50000-vari);
  }
  if (varil >= 550) {
    vari=vari-100000;
    fill(170, 0, 50);
    textSize(50);
    text("Would you like some?", 0, 300);
  }  
  if (varil >= 1200) {
    image(Spa, 0, 0);
    c2 = (c2+1) % 360;
    c3 = (c3+1) % 360;
    fill (200, c2, c3);
    textSize(50);
    text("Or are your knees weak?", 0, 400);
  }
  if (varil >= 2100) {
    image(pat, 0, 0);
    fill(50, 0, 170);
    textSize(60);
    text("No, this is Patrick!", 350, 200);
  }
  if (varil >= 2400) {
    image(not, 350, 300);
    fill(50, 0, 170);
    textSize(40);
    text("I'm not knees weak.", 440, 260);
  }
}



