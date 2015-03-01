

float transparence = 120;

void setup() {
  size(400, 400);
  frameRate(random(20));
  background(255);
  noStroke();
}

void draw() {
   fill(62,144,255,transparence);
   ellipse(random(400), random(400), 70, 70);
   fill(63,226,255,transparence);
   ellipse(random(400), random(400), 70, 70);
   fill(200,200,200,transparence);
   ellipse(random(400), random(400), 70, 70);
   
   transparence = random(120);
}


