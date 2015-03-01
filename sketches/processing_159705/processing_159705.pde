
void setup() {
  size(600, 400);
  background(180);
}

void draw() {
  background(180);

  int counter = 0;
  int space = 20;

  while (counter < 100) {
    fill(counter*20);
    noStroke();
    ellipse(100, counter*50, 20, 20);
    counter = counter + 1;

  }
  
  counter = 0;
  
    while (counter < 100) {
      fill(counter*20);
      noStroke();
      ellipse(200, counter*50, 20, 20);
      counter = counter + 1;
    
  }
}
