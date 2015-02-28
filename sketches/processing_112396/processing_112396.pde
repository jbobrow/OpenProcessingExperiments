
float counter = 0;
color canvas = #FCFCFC;
color[] palette = {
  #0284FF, #02B5E8, #0FFFF4, #02E89C, #02FF64
};
void setup() {
  frameRate(3);
  size(800, 600);
  background(canvas);
}

void draw() {
    float r = random(5);
    strokeWeight(random(30, 50));
    stroke(palette[int(r)]);
    noFill();
    float d = random(500);
    rectMode(RADIUS);
    noFill();
    ellipse(400, 300, d, d);
    counter++;
  }
