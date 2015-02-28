
// "Unrest"
// I wanted to draw objects that somehow interact with each other.
// I came up with the idea of a set of points, each of them "knowing" which is its closest neighbour, and do something with that information. Let's just draw a line --the result is a sort of labyrinth.
// But I also wanted to try some animation. So I'm moving every point a little bit away from its closest neighbour, at every iteration. As the points move, the closest neighbour of each point will not always be the same, thus the points don't always move in the same direction. I find interesting how they tend to form a kind of regular mesh, yet never stop shaking. 
// On the other side, the distances in general seem to get bigger. I decide the color to pick for each line depending on its length, so we see the palette cycle from the outside to the inside, in a kind of "swallowing" effect, as this general expansion takes place.

int nPoints = 1000; // Number of total points
float speedCoefficient = 0.02; // How fast they will move
float maxDistance = 100; // When distance between points get higher than this, they won't be drawn. This allows for a kind of "fade out" effect at the end
color[] palette = {#E0CF7A, #F55225, #2E5E98, #894C1A};
color bgColor = #000000;

PVector[] points;

void setup() {
  size(1024, 768);
  points = new PVector[nPoints];
  for(int i = 0; i < nPoints; i++) {
    points[i] = new PVector(random(width), random(height));
  }
}

void draw() {
  background(bgColor);
  for(int i = 0; i < nPoints; i++) {
    PVector currentPoint = points[i];
    PVector closestPoint = null;
    float distanceToClosestPoint = -1;
    for(int j = 0; j < nPoints; j++) {
      if(i != j) {
        PVector anotherPoint = points[j];
        float distance = currentPoint.dist(anotherPoint);
        if(distanceToClosestPoint == -1 || distance < distanceToClosestPoint) {
          distanceToClosestPoint = distance;
          closestPoint = anotherPoint;
        }
      }
    }
    if(distanceToClosestPoint < maxDistance) {
      int colorIndex = Math.max(0, Math.round(map(distanceToClosestPoint, 25, 60, 0, 3)))%4;
      color chosenColor = palette[colorIndex];
      stroke(chosenColor);
      line(currentPoint.x, currentPoint.y, closestPoint.x, closestPoint.y);
      PVector difference = new PVector(closestPoint.x - currentPoint.x, closestPoint.y - currentPoint.y);
      points[i].x -= difference.x*speedCoefficient;
      points[i].y -= difference.y*speedCoefficient;
    }
  }
}

