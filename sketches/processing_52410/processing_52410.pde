
PImage img;
float level;

void setup() {
  size(400, 400);
  background(0);
  smooth();

  img = loadImage("okaeri.png");
  
  frameRate(40);
}

void draw() {
  fill(0, 5+level);
  noStroke();
  rect(0, 0, width, height);

  stroke(255);

  for (int i = 0; i <150;i++) {
    akari();
  }

  image(img, 0, 0);//170,230

  level += 0.005;
  if (level >= 250) {
    level = 250;
  }
}

void akari() {
  point(random(width), random(170,230));
}


