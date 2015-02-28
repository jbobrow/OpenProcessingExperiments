
float x;
float y;
float f;
float e;
float diam;
int r;
int g;
int b;
int a;
int counter;
int state;

void setup() {
  size(400, 400);
  background(255);
  noCursor();
  fill(0);
  noStroke();

  state = 0;
  f = 0;
  e = 0;
}

void draw() {
  counter++;
  diam = 4;
  x = mouseX;
  y = mouseY;
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));

  if (counter > 3) {
    counter = 0;
    state++;
    f = f + .5;
    e = e + .5;
    if (f > 25){
      f = 0;
    }
    if (e > 25){
      e = 0;
    }
  
   fill(r,g,b);
   ellipse(x + f, y + e, diam, diam);
   ellipse(x - f, y - e, diam, diam);
   ellipse(x + f, y - e, diam, diam);
   ellipse(x - f, y + e, diam, diam);
   ellipse(x + f*2, y, diam, diam);
   ellipse(x, y + e*2, diam, diam);
   ellipse(x - f*2, y, diam, diam);
   ellipse(x, y - e*2, diam, diam);
    
  }
  if (state > 50){
    state = 0;
    background(255);
  }
  
}



