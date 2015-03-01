
star[] stars;
int MAX_STARS = 20000;
void setup() {
size(600, 600, P3D);
stars = new star[MAX_STARS];
for (int i=0; i< MAX_STARS; ++i) {
stars[i] = new star();
}
}
void draw() {
translate(width/2, height/2, 0);
background(0);
for (int i=0; i< MAX_STARS; ++i) {
stars[i].render();
rotateX(PI/6.0);
stars[i].move();
}
}
class star {
int x, y, z;
color c;
float size;
star() {
x = (int)random(-1000, 1000);
y = (int)random(-1000, 1000);
z = (int)random(0, -10000);
c = color(255, 255, random(0, 255));
size = random(1, 3);
}
void render() {
stroke(c);
strokeWeight(size);
point(x, y, z);
}
void move() {
x-=10;
y-=10;
z-=10;
rotateZ(PI/3.0);
}
}
