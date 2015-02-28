
float x,y,a,i, b, u, v, p;
PImage img;

void setup() {
  img = loadImage("photo-4.jpg");
  size(600,600);
  background(0);
  strokeWeight(0.3);
  smooth();
  a=-PI/2;
  p=-PI/2;
  x=y=400;
  u=random(img.width);
  v=random(img.height);
}
void draw() {
  i=random(-.01,.01);
  for(int j=1;j<1000;j++) {
    x = (width + x + cos(a)) % width;
    y = (height + y + sin(a)) % height;
    fill(img.get(int(u), int(v)));
    ellipse(x,y,5,5);
    a+=j*i;
    
    p=random(-.1,.1);
    u = (img.width + u + cos(b)) % img.width;
    v = (img.height + v + sin(b)) % img.height;
    b+=j*p;
  }
}
void mouseClicked() {
  setup();
  //saveFrame();
}



