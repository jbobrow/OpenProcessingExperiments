
int count = 30; // Set number of circles
Sphere[] circles = new Sphere[count];
color[] circleColors = new color[count];
float ds=2; // Set size of dot in circle center
boolean dragging = false;
//Colors taken from the IDE
color[] colors = {
#FF8000, // Orange
#FF8000, // Orange
#FF8000 // Orange
};
float ww;
float hh;
float wwhh;
// Set up canvas
void setup() {
frameRate(30); // Frame rate
size(800, 250); // Size of canvas (width,height)
strokeWeight(1); // Stroke/line/border thickness
background(0, 0, 0);
ww = (width*0.5)*(width*0.5);
hh = (height*0.5)*(height*0.5);
wwhh = ww*hh;
for (int i = 0; i < count; i++) {
circles[i] = new Sphere();
}
}
void draw() {
background(0, 0, 0);
// Begin looping through circle array
for (int i = 0; i < count; i++) {
update(circles[i]);
render(circles[i]);
}
}
void update(Sphere c) {
c.acc.set(0, 0, 0);
float vdamp = 0.99; // Velocity damping force
PVector m = new PVector(mouseX, mouseY);
if (c.locked && c.parent == null) {
// Move the particle's coordinates to the mouse's position, minus its original offset
c.acc = PVector.sub(PVector.sub(m, c.offset), c.pos);
c.acc.limit(1); // Limit to maximum force
c.vel.add(c.acc); // Apply acceleration
c.vel.limit(3); // Limit to maximum speed
c.pos = PVector.sub(m, c.offset);
}
else if (c.locked && c.parent != null && dist2(c.pos, c.parent.pos) >= c.parent.rad2) {
// Move the particle's coordinates to the parent's position, minus its original offset
c.rest.set(c.parent.pos);
PVector force = PVector.mult(PVector.sub(c.pos, c.rest), -c.k); // f = -k
c.acc = PVector.div(force, c.rad*0.5); // Set the acceleration, f = ma == a = f/m
c.vel = PVector.mult(PVector.add(c.vel, c.acc), c.damp); // Set the velocity
c.vel.limit(14); // Limit to maximum speed
c.pos.add(c.vel); // Updated position
}
else {
c.acc.limit(1); // Limit to maximum force
c.vel.add(c.acc); // Apply acceleration
if (mag2(c.vel) > 0.5*0.5) {
c.vel.x *= vdamp;
c.vel.y *= vdamp;
}
c.pos.add(c.vel); // Move circle
c.rest.set(c.pos); // Move circle
}
c.opa = calcOpacity(c.pos.x, c.pos.y); // Update opacity
float dm = c.rad*2; // Cache diameter
// Wrap around canvas edges
if (c.pos.x < -dm) c.pos.x = width + dm;
if (c.pos.x > width + dm) c.pos.x = -dm;
if (c.pos.y < -dm) c.pos.y = height + dm;
if (c.pos.y > height + dm) c.pos.y = -dm;
}
void render(Sphere c) {
PVector m = new PVector(mouseX, mouseY);
if (dist2(c.pos, m) < c.rad2) fill(#c93b0e, c.opa*0.5); // orange if mouseover
else fill(c.c, c.opa); // regular
noStroke(); // Disable shape stroke/border
ellipse(c.pos.x, c.pos.y, c.rad*2, c.rad*2); // Draw circle
// If current circle is selected...
if ((c.locked && c.parent == null && dragging)) {
fill(#CD6633, c.opa*2); // Center dot color orange
stroke(#CD6633, c.opa*4); // Line color orange
}
else {
fill(#000000, c.opa*2); // Center dot color black
stroke(#000000, c.opa*2); // Line color black
}
// Loop through all circles
for (int j = 0; j < count; j++) {
// If the circles are close
if (dist2(c.pos, circles[j].pos) < c.rad2) {
// Stroke a line from current circle to adjacent circle
line(c.pos.x, c.pos.y, circles[j].pos.x, circles[j].pos.y);
// Attach it to parent
if (c.locked && !circles[j].locked) {
circles[j].locked = true;
// Assign parent and children
circles[j].parent = c;
c.children.add(circles[j]);
}
}
else if (circles[j].parent != null && circles[j].parent == c) {
line(c.pos.x, c.pos.y, circles[j].pos.x, circles[j].pos.y); // Link to parent
}
}
noStroke(); // Turn off stroke/border
rect(c.pos.x - ds, c.pos.y - ds, ds * 2, ds * 2); // Draw dot in center of circle
}
float calcOpacity(float posx, float posy) {
float opax = abs(width*0.5 - posx);
float opay = abs(height*0.5 - posy);
float opacity = opax*opax*hh + opay*opay*ww; // Eqn of ellipse: x^2/a^2 + y^2/b^2 = 1
opacity = map(opacity, wwhh + wwhh, 0, -70, 70); // Map to canvas
opacity = constrain(opacity, 0, 100);
return opacity;
}
float mag2(PVector v) { return (v.x*v.x + v.y*v.y + v.z*v.z); }
float dist2(PVector v1, PVector v2) { return ((v1.x - v2.x)*(v1.x - v2.x) + (v1.y - v2.y)*(v1.y - v2.y) + (v1.z - v2.z)*(v1.z - v2.z)); }
void mousePressed () {
// Look for a circle the mouse is in, then lock that circle to the mouse
PVector m = new PVector(mouseX, mouseY);
for (int i = 0; i < count; i++) {
// If the circles are close...
if (dist2(circles[i].pos, m) < circles[i].rad2) {
circles[i].locked = true;
circles[i].offset = PVector.sub(m, circles[i].pos);
dragging = true; // Break out of the loop because we found our circle
break;
}
}
}
void mouseReleased() {
// User is no-longer dragging
for (int i = 0; i < count; i++) {
circles[i].offset.set(0, 0, 0);
circles[i].rest.set(0, 0, 0); // Clear all children
circles[i].locked = false;
circles[i].parent = null; // Clear parent
circles[i].children.clear(); // Clear all children
}
dragging = false;
}
class Sphere
{
float w;
float h;
float rad;
float rad2;
PVector pos;
PVector vel;
PVector acc;
PVector offset;
PVector rest;
color c;
float opa;
boolean locked;
Sphere parent;
ArrayList children;
float k = 0.1; // Spring constant
float damp = 0.98; // Damping
Sphere() {
w = random(width); // X
h = random(height); // Y
rad = random(10, 70); // Radius
rad2 = rad*rad;
pos = new PVector(random(width), random(height)); // Location
vel = new PVector(random(-0.5, 0.5), random(-0.5, 0.5)); // Speed
acc = new PVector(0, 0); // Acceleration
offset = new PVector(0, 0); // Offset from mouse
rest = new PVector(pos.x, pos.y); // Rest position
c = colors[int(random(colors.length))]; // Color
opa = calcOpacity(pos.x, pos.y); // Calculate opacity
locked = false;
parent = null;
children = new ArrayList();
   }
}
