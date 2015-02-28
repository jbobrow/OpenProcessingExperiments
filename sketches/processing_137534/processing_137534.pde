
/*
  "Quasicrystals"
  Points are added by the user drawing on the screen, in principle forming a line.
  But these points are not still, they follow a subtle movement pattern --each point slowly moves away from its nearest neighbour.
  Of course, as the points move, the nearest neighbour of each point will not always be the same, so the result is not just a wild expansion.
  The system does expand, but at the same time a relatively regular, but always "shaking" pattern becomes gradually visible at the same time.
  I noticed that sometimes, a group of points can get "trapped" forming a rather regular mesh in a very small region and seem to stop expanding (like a black hole?)
  I draw a line from each point to its nearest neighbour. The colors come in cycles from the outside to the inside.
  You can press + and - to play with the zoom, and the arrows to move the viewpoint around. Space to stop moving the viewpoint. 's' to take a screenshot.
*/

int maxPoints = 1000; // Maximum number of total points
float speed = 0.008; // How fast they will move
float zoomSpeed = 0;
PVector cameraSpeed = new PVector();
color[] palette = {#E0CF7A, #F55225, #2E5E98, #894C1A};
color bgColor = 0;

ArrayList<PVector> points = new ArrayList();

void setup()
{
  size(900, 900);
  background(0);
  fill(bgColor, 31);
}

void draw()
{
  int nPoints = points.size();
  noStroke();
  rect(0, 0, width, height); // Clear the screen but with some degree of transparency
  for(int i = 0; i < nPoints; i++)
  {
    PVector currentPoint = points.get(i);
    PVector closestPoint = null;
    float distanceToClosestPoint = -1;
    for(int j = 0; j < nPoints; j++)
    {
      if(i != j) {
        PVector anotherPoint = points.get(j);
        float distance = currentPoint.dist(anotherPoint);
        if(distanceToClosestPoint == -1 || distance < distanceToClosestPoint)
        {
          distanceToClosestPoint = distance;
          closestPoint = anotherPoint;
        }
      }
    }
    if(closestPoint != null)
    {
      int colorIndex = Math.max(0, Math.round(map(distanceToClosestPoint, 25, 60, 0, 3)))%4;
      strokeWeight(Math.min(1, 10/distanceToClosestPoint));
      color chosenColor = palette[colorIndex];
      stroke(chosenColor);
      line(currentPoint.x, currentPoint.y, closestPoint.x, closestPoint.y);
      PVector distance = new PVector(closestPoint.x - currentPoint.x, closestPoint.y - currentPoint.y);
      PVector displacement = new PVector(- distance.x * speed, - distance.y * speed); // Move points 
      displacement.x += zoomSpeed * (currentPoint.x - width/2);
      displacement.y += zoomSpeed * (currentPoint.y - height/2);
      displacement.add(cameraSpeed);
      points.get(i).add(displacement);
    }
  }
}

void mouseDragged()
{
  addPoint();
}

void mousePressed()
{
  addPoint();
}

void addPoint()
{
  if( ! ( points.size() < maxPoints) ) {
    points.remove(0);
  }
  points.add(new PVector(mouseX, mouseY));
}

void keyPressed() {
  switch(key) {
    case'c':
    // Clear the screen
      background(bgColor);
      break;
    case '-':
      zoomSpeed -= 0.002;
      break;
    case '+':
      zoomSpeed += 0.002;
      break;
    case ' ':
      zoomSpeed = 0;
      cameraSpeed.x = 0;
      cameraSpeed.y = 0;
      break;
    case 's':
      saveFrame();
  }
  switch(keyCode) {
    case UP:
      cameraSpeed.y += 0.2;
      break;
    case DOWN:
      cameraSpeed.y -= 0.2;
      break;
    case LEFT:
      cameraSpeed.x += 0.2;
      break;
    case RIGHT:
      cameraSpeed.x -= 0.2;
      break;
  }
}



