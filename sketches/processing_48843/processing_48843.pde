
int ah = 30;
int aw = 70;

float a;

PImage are;

void setup() {
  size(500, 500);

  background(0);

  smooth();

  are = loadImage("are.png");
  imageMode(CENTER);
}

void draw() {
  background(0);


  pushMatrix();
  translate(width/2, height/2);
  rotate(0.1*sin(a*1));
  image(are, 0, 0);
  popMatrix();

  for (int i = 0; i < 20;i++) {
    draw_arc();
  }
  filter(BLUR, 1);

  a++;
}

void draw_arc() {
  strokeWeight(10);
  noFill();
  stroke(0, 255, 0);
  arc(random(width), random(height), ah, aw, PI/2, PI*3/2);
  arc(random(width), random(height), ah, aw, -PI/2, PI/2);
}


