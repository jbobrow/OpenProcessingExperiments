
PVector circlePosition;
ArrayList<PVector> circleTrail;
int trailSize = 600;

void setup() {
  size(500, 500);
  circlePosition = new PVector(width*0.5, width*0.5);
  circleTrail = new ArrayList<PVector>();
}

void draw() {
  background(255);
  int trailLength;

  circlePosition = new PVector(mouseX, mouseY);
  circleTrail.add(circlePosition);

  trailLength = circleTrail.size() - 2;
  println(trailLength);

  for (int i = 0; i < trailLength; i++) {
    PVector currentTrail = circleTrail.get(i);
    PVector previousTrail = circleTrail.get(i + 1);

    stroke(0, 255*i/trailLength);
    line(
      currentTrail.x, currentTrail.y,
      previousTrail.x, previousTrail.y
    );
  }

  ellipse(circlePosition.x, circlePosition.y, 10, 10);

  if (trailLength >= trailSize) {
    circleTrail.remove(0);
  }

}
