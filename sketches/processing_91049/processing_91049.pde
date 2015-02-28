
// sketch
int EW=100;
int EH=100;

float EY;
float EX;
float r;
float g;
float b;
float x;
float y;
float w;
float h;
boolean white=false;

void setup () {
  size(600, 600);

  if (white) {
    background(255);
  }
  else {
    background(0);
  }
}

void draw() {




  r=random(255);{
  g=random(255);
  b=random(255);
  x=random(600);
  y=random(600);
  }
  fill(r, g, b);
  ellipse(x, y, EW, EH);


  EW=EW+2;
  EH=EH+2;
  EW=(200);
  EH=(200);
  EW=constrain(20, 30, 40);
  EH=constrain(20, 30, 40);
}
void mousePressed() {
  if (white) {
    background(255);
  }
  else {
    background(0);
  }
  white=!white;
}

// left click = whiter
//right click=black
