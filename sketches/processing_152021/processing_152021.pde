
Ball[] orb = new Ball[400];
 
void setup() {
size(500, 500);
for (int i = 0; i < 400; i++) {
orb[i] = new Ball(color(random(255), random(255), random(255), random(255)), random(width), random(height), random(3), random(4), 20);
}
}
 
void draw() {
background(#ffffff);
for (int i = 0; i < 400; i++) {
orb[i].display();
orb[i].move();
}
}
class Ball {
color ballColor;
float xPos, yPos;
float xSpeed, ySpeed;
float size;
 
Ball(color _ballColor, float _xPos, float _yPos, float _xSpeed, float _ySpeed, float _size) {
 
ballColor = _ballColor;
xPos = _xPos;
yPos = _yPos;
xSpeed = _xSpeed;
ySpeed = _ySpeed;
size = _size;
}
 
void display() {
noStroke();
fill(ballColor);
ellipse(xPos, yPos, size, size);
}
void move() {
 
xPos = xPos + xSpeed;
yPos = yPos + ySpeed;
if (xPos > width || xPos < 0) {
xSpeed = xSpeed * -1;
}
if (yPos > height || yPos < 0) {
ySpeed = ySpeed * -1;
}
}
}
