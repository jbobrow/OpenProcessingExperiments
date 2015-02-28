
PImage are;
PImage kumamoto;

float x;

int aw = 448;
int ah = 259;

void setup() {
  size(600, 400);
  background(255);

  smooth();

  are = loadImage("are4.png");
  kumamoto = loadImage("kumamoto.jpg");
  
  imageMode(CENTER);
}

void draw() {
  //background(255);
  image(kumamoto,width/2,height/2);

  pushMatrix();
  translate(x, height/2);
  rotate(0.07*sin(x*0.1));
  image(are, 0, 0);
  popMatrix();

  x++;

  if (x > width + aw/2) {
    x = -aw/2;
  }
}


