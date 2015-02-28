
private PVector ballPos;
private PVector ballStart;
private PVector ballTarget;
private PVector ballDelta;
private PVector controlPoint;
private PVector controlPointFlux;
private PVector leftFloater;
private PVector rightFloater;
private PVector leftDelta;
private PVector rightDelta;
private PVector center;
private float slope;
private float clock;
private float elapsed;
private float duration;
private boolean debugLines;

public void setup() {
  debugLines = false;
  size(800, 600);
  ballPos = new PVector(50, 50);
  ballStart = new PVector();
  ballTarget = new PVector();
  ballDelta = new PVector();
  controlPointFlux = new PVector();
  controlPoint = new PVector();
  leftFloater = new PVector();
  rightFloater = new PVector();
  leftDelta = new PVector();
  rightDelta = new PVector();
  center = new PVector();
  clock = millis();
  duration = 5000;
  reset(750, 550);
}

private void reset(float x, float y) {
  ballStart.x = ballPos.x;
  ballStart.y = ballPos.y;
  ballTarget.x = x;
  ballTarget.y = y;
  ballDelta.x = ballTarget.x - ballStart.x;
  ballDelta.y = ballTarget.y - ballStart.y;
  controlPointFlux.x = ballDelta.x / 2;
  controlPointFlux.y = ballDelta.y / 2;
  controlPoint.x = ballStart.x + ballDelta.x / 2 + controlPointFlux.x;
  controlPoint.y = ballStart.y + ballDelta.y / 2 - controlPointFlux.y; 

  leftFloater.x = ballStart.x;
  leftFloater.y = ballStart.y;
  leftDelta.x = controlPoint.x - leftFloater.x;
  leftDelta.y = controlPoint.y - leftFloater.y;
  rightFloater.x = controlPoint.x;
  rightFloater.y = controlPoint.y;
  rightDelta.x = ballTarget.x - controlPoint.x;
  rightDelta.y = ballTarget.y - controlPoint.y;

  elapsed = 0;
}

private void update() {
  if (mousePressed) {
    clock = millis();
    reset(mouseX, mouseY);
    return;
  }

  if (elapsed >= duration) {
    ballPos.x = ballTarget.x;
    ballPos.y = ballTarget.y;
    return;
  }
  float newClock = millis();
  float delta = newClock - clock;
  elapsed += delta;
  clock = newClock;  
  float easeAmount = easeInOut(elapsed / duration);
  leftFloater.x = ballStart.x + leftDelta.x * easeAmount;
  leftFloater.y = ballStart.y + leftDelta.y * easeAmount;

  rightFloater.x = controlPoint.x + rightDelta.x * easeAmount;
  rightFloater.y = controlPoint.y + rightDelta.y * easeAmount;

  center.x = (leftFloater.x + rightFloater.x) / 2;
  center.y = (leftFloater.y + rightFloater.y) / 2;
  slope = (rightFloater.y - leftFloater.y / rightFloater.x - leftFloater.x);

  ballPos.x = leftFloater.x + (rightFloater.x - leftFloater.x) * easeAmount;
  ballPos.y = leftFloater.y + (rightFloater.y - leftFloater.y) * easeAmount;
}

public void draw() {
  update();

  background(0, 0, 0);
  fill(255, 255, 255);
  noStroke();
  ellipse(ballPos.x, ballPos.y, 20, 20);

  if (debugLines) {
    //points
    fill(0, 0, 0, 0);

    stroke(255, 0, 0);
    line(leftFloater.x, leftFloater.y, rightFloater.x, rightFloater.y);

    stroke(255, 255, 255);

    ellipse(center.x, center.y, 10, 10);

    stroke(255, 0, 0);
    ellipse(leftFloater.x, leftFloater.y, 10, 10);
    ellipse(rightFloater.x, rightFloater.y, 10, 10);

    stroke(0, 255, 0);
    line(ballStart.x, ballStart.y, controlPoint.x, controlPoint.y);
    line(controlPoint.x, controlPoint.y, ballTarget.x, ballTarget.y);
    ellipse(ballStart.x, ballStart.y, 10, 10);
    ellipse(ballTarget.x, ballTarget.y, 10, 10);
    ellipse(controlPoint.x, controlPoint.y, 10, 10);
  }
}

private float linear(float k) {
  return k;
}

private float easeOut(float k) {
  return -k * (k-2);
}

private float easeInOut(float k) {
  if ( ( k *= 2 ) < 1 ) return 0.5 * k * k;
  return - 0.5 * ( --k * ( k - 2 ) - 1 );
}

void keyPressed() {
  if (key == 'd') {
    debugLines = !debugLines;
  }
}



