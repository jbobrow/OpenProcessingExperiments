
int a =0;
int r=0;
int g=0;
int b=0;
void  setup() {
  textFont(loadFont("Bauhaus93-48.vlw"));
  textAlign(CENTER,CENTER);
  background(255);
  size(150, 200);
  smooth();
}

void draw() {
  if (a<255) {
    a+=7;
  }
  else {
    a=0;
    r=int(random(255));
    g=int(random(255));
    b=int(random(255));
    background(255);
  }

  stroke(27, 62, 193, a);
  strokeWeight(5);
  noFill();
  ellipse(50, 50, 50, 50);

  stroke(0, a);
  noFill();
  ellipse(80, 50, 50, 50);
  stroke(203, 6, 13, a);
  noFill();
  ellipse(110, 50, 50, 50);

  stroke(247, 228, 10, a);
  noFill();
  ellipse(70, 80, 50, 50);

  stroke(27, 108, 47, a);
  noFill();
  ellipse(100, 80, 50, 50);
  stroke(0);
    textSize(40);
  fill(r,g,b);
  text("Victory!!",100,150);
}
