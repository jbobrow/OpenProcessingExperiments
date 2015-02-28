
Sphere [] spheres;
PImage atlas;

void setup() {
  atlas = loadImage("Atlassingle1.png");
  size(800, 800);
  colorMode(HSB);
  noStroke();
  spheres = new Sphere[400];
  for (int i = 0; i<20; i++) {
    for (int j = 0; j<20; j++) {
      int x = 40*i+20;
      int y = 40*j+20;
      color tempColor = color(random(255), 160, 150);
      spheres[i*20+j] = new Sphere( x, y, tempColor);
    }
  }
}

void draw() {
  background(200);
  for (int i = 0; i<400; i++) {
    spheres[i].update();
    spheres[i].display();
  }
}

class Sphere{
  int posX;
  int posY;
  float size;
  color sColor;
  float rot;

  Sphere(int x, int y, color myColor) {
    posX = x;
    posY = y;
    sColor = myColor;
    size = 1;
    rot = 0;
  }

  void update() {
    float farAway = dist(mouseX, mouseY, posX, posY);
//    if(farAway<100 && size<100) size=(100-farAway);
//    if(size > 5) size*=.99;
//    size += random(-2, 2);
//    if(size>100) size = 5;
//    if(size<0) size = 5;
  if(farAway<100) {
    rot+=.1;
    size+=.01;
  }
    
  }

  void display() {
    fill(sColor);
    pushMatrix();

    translate(posX, posY);
    scale(size);
    rotate(rot);
    
    image(atlas, -20, -20, 40, 40);
    //ellipse(0, 0, size, size);
    popMatrix();
  }
}



