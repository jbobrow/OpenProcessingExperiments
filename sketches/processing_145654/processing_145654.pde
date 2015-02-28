
//////////code for "sphere worms" http://beesandbombs.tumblr.com/post/83657889139/
 
int samplesPerFrame = 16;
int numFrames = 111;
float shutterAngle = .45;
 
float r = 175, d, dd, y, z, df;
int N = 30;

void setup_() {
size(500, 500, P3D);
smooth(8);
strokeWeight(2.8);
fill(255); stroke(77);
}
 
void draw_() {
background(255);
pushMatrix();
translate(width/2, height/2, -50);
rotateX(-.2);
rotateY(-PI/6);
for (int i=0; i<N; i++) {
z = map(i, -0.5, N-.5, -r, r);
d = sqrt(4*r*r - 4*z*z);
df = map(cos(TWO_PI*time),1,-1,1,.2);
dd = map(sin(TWO_PI*time + HALF_PI*i/N), -1, 1, d*df, d);
y = .5*(d - dd)*sin(2*TWO_PI*time + PI*i/N + PI*i);
pushMatrix();
translate(0, 0, z);
ellipse(0, y, dd, dd);
popMatrix();
}
popMatrix();
}
