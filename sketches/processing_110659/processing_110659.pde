
float counter = 0;
color canvas = #FCFCFC;
color[] palette = {
  #10C7DE, #4BD8E8, #FFFE45, #7AE082, #3A38FF
};
void setup() {
  size(800, 600);
  background(canvas);
}

void draw() {
    float r = random(5);
    strokeWeight(random(30, 35));
    stroke(palette[int(r)]);
    noFill();
    float d = random(200);
    rectMode(RADIUS);
    noFill();
    rect(400, 300, d, d);
    counter++;
  }
