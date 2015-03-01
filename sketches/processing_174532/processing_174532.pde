
PImage feed;
class star {
int x, y, z;
color c;
float size;
star() { // constructor
x = (int)random(0, 1000);
y = (int)random(0, 1000);
z = (int)random(0, -10000);
c = color(0, random(130,150), random(150,250));
size = random(1, 3);
}
void render() {
stroke(c);
strokeWeight(size);
point(x, y, z);
}
void move() {
z += 1;
}
}
star[] stars;
int MAX_STARS = 10000;
void setup() {
size(600, 600, P3D);
stars = new star[MAX_STARS];
for (int i=0; i< MAX_STARS; ++i) {
stars[i] = new star();
  feed = new PImage(width-20,height-20);
    colorMode(HSB);  
}
}
void draw() {
background(0);
for (int i=0; i< MAX_STARS; ++i) {
stars[i].render();
if (mousePressed) stars[i].move();}
  noStroke();
    fill(color(random(256),255,255,32));
    image(feed,0,0,width,height);
    ellipse(mouseX+random(-10,10),mouseY+random(-10,10),20+random(20),20+random(20));
    feed = g.get(10,10,width-20,height-20); 

}
