
float x = 100.0; // X-coordinate
float y = 20.0; // Y-coordinate
float radius = 15.0; // Radius of the circle
float speedX = 1.0; // Speed of motion on the x-axis
float speedY = 2.0; // Speed of motion on the y-axis
int directionX = 1; // Direction of motion on the x-axis
int directionY = -1; // Direction of motion on the y-axis
 
float x2 = 100.0; // X-coordinate
float y2 = 200.0; // Y-coordinate
float radius2 = 15.0; // Radius of the circle
float speedX2 = 1.0; // Speed of motion on the x-axis
float speedY2 = 1.0; // Speed of motion on the y-axis
int directionX2 = 1; // Direction of motion on the x-axis
int directionY2 = -1; // Direction of motion on the y-axis
boolean squareCollided = false;
 
void setup() {
    size(400, 400);
    smooth();
    noStroke();
    ellipseMode(RADIUS);
}
 
void draw() {
    fill(0, 20);
    rect(0, 0, width, height);
    fill(255);
    
    // Creature 1
    pushMatrix();
    translate(x, y);
    scale(directionX, 1);
    rect(-radius, -radius, radius * 2, radius * 2);
    popMatrix();
    
    x += sin(y * 0.1) + (speedX * directionX);
    if ((x > width-radius) || (x < radius)) {
        directionX = -directionX; // Change direction
    }
    y += speedY * directionY;
    if ((y > height-radius) || (y < radius)) {
        directionY = -directionY; // Change direction
    }
    
    // Creature 2
    pushMatrix();
    translate(x2, y2);
    scale(directionX2, 1);
    
    
    if (squareCollided == false) {
        ellipse(-radius2, -radius2, radius, radius2);
    }
    popMatrix();
    
    x2 += speedX2 * directionX2;
    if ((x2 > width-radius2) || (x2 < radius2)) {
        directionX2 = -directionX2; // Change direction
    }
    y2 += speedY2* directionY2;
    if ((y2 > height-radius2) || (y2 < radius2)) {
        directionY2 = -directionY2; // Change direction
    }
    
    if (rectCollide(x, y, x + radius * 2, y + radius * 2, x2, y2, x2 + radius2 * 2, y2 + radius2 * 2)) {
        squareCollided = true;
    }
    
}
 
boolean rectCollide(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}
