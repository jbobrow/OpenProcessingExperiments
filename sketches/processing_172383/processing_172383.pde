
int numParticles = 200;
NewParticle[] p = new NewParticle[numParticles];
void setup() {
size(500, 500);
noStroke();
smooth();
for (int i = 0; i < p.length; i++) {
float velX = random(-1, 1);
float velY = -i;
// Inputs: x, y, x-velocity, y-velocity,
// radius, origin x, origin y
p[i] = new NewParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
}
}
void draw() {
fill(0, 36);
rect(0, 0, width, height);
fill(255, 60);
for (int i = 0; i < p.length; i++) {
p[i].update();
p[i].regenerate();
p[i].display();
}
}class Particle {
float x, y; // The x- and y-coordinates
float vx, vy; // The x- and y-velocities
float radius; // Particle radius
float gravity = 0.1;
Particle(int xpos, int ypos, float velx, float vely, float r) {
x = xpos;
y = ypos;
vx = velx;
vy = vely;
radius = r;
}
void update() {
vy = vy + gravity;
y += vy;
x += vx;
}
void display() {
ellipse(x, y, radius, radius*2);
}
}

class NewParticle extends Particle {
float originX, originY;
NewParticle(int xIn, int yIn, float vxIn, float vyIn,
float r, float ox, float oy) {
super(xIn, yIn, vxIn, vyIn, r);
originX = ox;
originY = oy;
}
void regenerate() {
if ((x > width+radius) || (x < -radius) ||
(y > height+radius) || (y < -radius)) {
x = originX;
y = originY-20;
vx = random(-50, 50);
vy = random(50, -50);
}
}
}


