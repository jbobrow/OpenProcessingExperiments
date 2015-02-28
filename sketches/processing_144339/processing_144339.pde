
Circle ball;
Line bounce;
final PVector gravity = new PVector(0, 0.05);
int pointX = 400;
int pointY = 300;
void setup(){
size(400,400);
frameRate(60);
smooth();
ball = new Circle(200,10,20);
}
void draw(){
bounce = new Line(mouseX,mouseY,pointX,pointY);
background(0);
ball.vel.limit(10);
bounce.draw();
ball.draw();
ball.update();
ball.side();
ball.vel.add(gravity);
if (collision(ball, bounce)){
PVector dist_v = normalVector(ball, bounce);
PVector force = PVector.div(dist_v, dist_v.mag());
force.mult(50 * pow(dist_v.mag(), -1));
PVector seg = PVector.sub(bounce.a, bounce.b);
ball.vel = PVector.add(project(ball.vel, seg), force);
}
}
void mousePressed(){
ball.loc.x = 200;
ball.loc.y = 10;
}
void keyPressed(){
if(keyCode == UP){
pointY-= 5;
}
if(keyCode == DOWN){
pointY+=5;
}
if(keyCode == LEFT){
pointX-=5;
}
if(keyCode == RIGHT){
pointX+=5;
}
}
class Circle{
PVector loc;
PVector vel;
float radius;
Circle (int x, int y, float radius){
loc = new PVector(x,y);
vel = new PVector(0,0);
this.radius = radius;
}
void update(){
loc.add(vel);
}
void draw(){
noStroke();
ellipseMode(CENTER);
float size = 2 * radius;
ellipse(ball.loc.x,ball.loc.y,size,size);
strokeWeight(1);
stroke(0,0,255);
}
void side(){
if ((loc.x>width || loc.x <= 0)){
vel.x = vel.x*-1;
}
if ((loc.y>height || loc.y <= 0)){
vel.y = vel.y*-1;
}
}
}
class Line {
PVector a; 
PVector b;
Line(int e,int f,int c, int d) {
a = new PVector(e,f);
b = new PVector(c,d);
}
void draw(){
strokeWeight(3);
stroke(0,0,255);
line(bounce.a.x,bounce.a.y,bounce.b.x,bounce.b.y);
}
}
PVector normalVector(Circle c, Line line) {
PVector pt_v = PVector.sub(c.loc, line.a);
PVector seg_v = PVector.sub(line.b, line.a);
PVector proj_v = project(pt_v, seg_v);
PVector closest;
if (PVector.angleBetween(proj_v, seg_v) >= 3.14) {
closest = line.a;
} else if(proj_v.mag() > seg_v.mag()) {
closest = line.b;
} else {
closest = PVector.add(line.a, proj_v);
}
PVector dist_v = PVector.sub(c.loc, closest);
return dist_v;
}
PVector project(PVector v, PVector onto) {
PVector proj_v = new PVector(onto.x, onto.y);
proj_v.normalize();
proj_v.mult(PVector.dot(v, proj_v));
return proj_v;
}
boolean collision (Circle c, Line l){
float dist = normalVector(c,l).mag();
return dist < c.radius;
}
