

// FUNKSJONIR

//ny breyta, x
int x;

void setup() {  
  size(400, 300);
  frameRate(11);
}

void draw() {
  background(188);
  x = flatarmal(mouseX, mouseY);
  rect(0, 0, mouseX, mouseY);

  println(x);
  for (int i=0; i<100; i++) {
    strokeWeight(2);
    point(random(mouseX), random(mouseY));
  }
  for (int i=0; i<10; i++) {
    dekk(i*50, 222);
  }
}

//funksjon sem skilar nidurstodu
int flatarmal(int breidd, int haed) {
  int utkoma;
  utkoma = breidd*haed;
  return utkoma;
}

//funksjon sem skilar ekki nidurstodu, heldur teiknar dekk
void dekk(int x, int y) {
  float randomStaerd;
  randomStaerd = random(33);
  float innri = 0.7;
  ellipse(x, y, randomStaerd, randomStaerd);
  ellipse(x, y, randomStaerd*innri, randomStaerd*innri);
}

