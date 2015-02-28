
Ball[] manyBalls = new Ball[10];
void setup(){ 
    colorMode(HSB, height, height, height); 
size(600, 600);

background(0);
smooth();
for(int i=0;i < manyBalls.length;i++){
manyBalls[i] = new Ball(random(width), random(height));
} }
void draw() {
for(int i=0;i < manyBalls.length;i++) {
manyBalls[i].move(); }
}
class Ball {
float ballx;
float bally;
float ballspeed = random(500)+1; float ballxdirection = random(1); float ballydirection = random(1); int r = (int)random(254);
int g = (int)random(256);
int b = (int)random(256);
int a = (int)random(256);
Ball(float tempballx, float tempbally) { ballx = tempballx;
bally = tempbally; }
void move() {
if (ballx > width || ballx < 0) {
ballxdirection *= -1;
}
if (bally > height || bally < 0) {
ballydirection *= -1; }
ballx += ballspeed*ballxdirection; bally += ballspeed*ballydirection; display();
}
private void display() { fill(mouseY, mouseX, mouseX, 80);
ellipse(ballx, bally, 25, 25);
text(" Allicali <3",500,590);}
}


