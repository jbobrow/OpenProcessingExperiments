
// Learning Processing Ex. 3-2

void setup() {
  println("Thanks, Shiffman.");
  size(400, 400);
}

void draw() {
  background(200);
  fill(100);
  ellipse(200, 200, 100, 100);
  fill(50);
  ellipse(180, 180, 20, 20);
  ellipse(220, 180, 20, 20);
  arc(200, 210, 80, 60, 0, PI);
}

