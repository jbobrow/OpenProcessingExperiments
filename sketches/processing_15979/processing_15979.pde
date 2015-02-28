
void setup() {
size(600,600);
}

void draw() {
  background(0);
  photuris(100,100, 1, 255, 255 );
  photuris(250,100, 2, 50, 140);
  photuris(250,280, 0.5, 160, 255);
  photuris(100,210, 0.1, 70, 140);
  photuris(100,80,0.3, 100, 140);
  photuris(280,60, 0.2, 160, 255);
}

void photuris(int x, int y, float s, int t, int w) {
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  smooth();

  //wings
  fill(w);
  ellipse(150,210,180,40);
  ellipse(50,210,180,40);
  ellipse(130,240,140,20);
  ellipse(50,240,140,20);
 //body
  fill(137,89,62);
  ellipse(100,210,80,160);
 //eyes
  fill(201,223,234);
  ellipse(80,130,80,80);
  ellipse(120,130,80,80);
  fill(0);
  ellipse(80,140,40,40);
  ellipse(120,140,40,40);
  //tail
  fill(t,255,0);
  ellipse(100,300,40,40);
  popMatrix();
}


