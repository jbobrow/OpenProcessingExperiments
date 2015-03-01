
Tree[] trees;
void setup() {
size(1000, 1000,P3D);
background(255);
ellipseMode(CENTER);
frameRate(20);
smooth();
trees = new Tree[1];
trees[0] = new Tree();
}
void draw() {
for (int i=0;i<trees.length;i++) {
PVector loc = trees[i].loc;
float diam = trees[i].d;
float c = map(trees.length,0,1000,0,50);
stroke(c);
ellipse(loc.x, loc.y, diam, diam);
trees[i].update();
}
}
void mousePressed() {
background(255);
trees = new Tree[1];
trees[0] = new Tree();
}
class Tree {
PVector loc;
PVector v;
float d;
Tree() {
loc = new PVector(width/2, height,0);
v = new PVector(0, -1,0);
d = 32;
}
Tree(Tree parent) {
loc = parent.loc.get();
v = parent.v.get();
float area = PI*sq(parent.d/2);
float newDiam = sqrt(area/2/PI)*2;
d = newDiam;
parent.d = newDiam;
}
void update() {
if (d>0.5) {
loc.add(v);
PVector bump = new PVector(random(-1, 1), random(-1, 1),random(-1, 1));
bump.mult(0.1);
v.add(bump);
v.normalize();
/* Used Vector normalization :
(I used PVector because it is more efficient. 
But if not using PVector, the code will be like below
v.normalize() equals
v.x = v.x/sqrt(v.x*v.x+v.y*v.y+v.z*v.z)
v.y = v.y/sqrt(v.x*v.x+v.y*v.y+v.z*v.z)
v.z = v.y/sqrt(v.x*v.x+v.y*v.y+v.z*v.z)
*/

if (random(0, 1)<0.02) {
trees = (Tree[]) append(trees, new Tree(this));
}
}
}
}


