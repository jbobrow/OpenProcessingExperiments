
float d;
int r;
int g;
int b;
int t;
int s;
float x;
float y;
float angle = 0.0;

void setup () {
  size (800, 600);
  background (0);
}

void draw() {
translate(mouseX, mouseY);
rotate(angle);


  //cores
  r = int (random (0, 255));
  g = int (random (0, 255));
  b = int (random (0, 255));
  t = int (random (100, 200));
  d = random (50, 100);
  s= int(random (0, 25));

  x =  0;
  y = 0;

  fill (r, g, b, t);
  smooth();
  stroke(r, g, b,t);
  strokeWeight (s);
  //rect (x, y, d, d);
  
  beginShape();
  vertex(x,    y-50);
  vertex(x+14, y-20);
  vertex(x+47, y-15);
  vertex(x+23, y+7);
  vertex(x+29, y+40);
  vertex(x,    y+25);
  vertex(x-29, y+40);
  vertex(x-23, y+7);
  vertex(x-47, y-15);
  vertex(x-14, y-20);
  endShape(CLOSE);  

  angle += 0.1;

}

void mouseDragged() {
  background (r, g, b);
}


