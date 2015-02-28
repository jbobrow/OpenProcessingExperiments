
void setup() {
  size(300, 300);
  smooth();
  noStroke();
}

int when = 100;

//This changes the background and random placement of rectangles, the majority of rectangles are located in the bottom right
void draw() {
  background(random(0, 255), random(0, 255), random(0, 255), 50);
  for (int i = 0; i < when; i++) {
    crazy();
    float that = random(0, 400);
    float then = random(0, 400);
    rect(that, then, that, then);
  }
  noLoop();
}

//This is what determines the colors, and stroke weight
void crazy() {
  stroke(0);
  strokeWeight(random(0, 8));
  int what = floor(random(0, 50));

  if (what <= 10) {
    fill(255, 0, 0, 75);
  }; 
  if (what >= 20) {
    fill(0, 0, 255, 75);
  }; 
  if (what >= 40) {
    fill(255, 250, 0, 75);
  };
}


