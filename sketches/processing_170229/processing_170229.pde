
int n = 1000;
PVector[] loc = new PVector[n];
PVector[] vel = new PVector[n];
void setup(){
size(700, 700);
background(255);
fill(255, 50);
smooth();
stroke(100, 255);
for(int i = 0; i < n; i++) {
loc[i] = new PVector(random(0, 700), random(0, 700));
vel[i] = new PVector(0, 0);
}
}
float R1 = random(0, 255);
float R2 = random(0, 255);
float G1 = random(0, 255);
float G2 = random(0, 255);
float B1 = random(0, 255);
float B2 = random(0, 255);
float inc = .007;
void draw() {
for(int i = 0; i < n; i++) {
stroke(R1, G1, B1, 10);
point(loc[i].x, loc[i].y);
vel[i].x = 10*noise(200+loc[i].x*.007, 200+loc[i].y*.007, inc*2)*cos(4*PI*noise(loc[i].x*.007, loc[i].y*.007, inc*.5));
vel[i].y = 10*noise(200+loc[i].x*.007, 200+loc[i].y*.007, inc*2)*sin(4*PI*noise(loc[i].x*.007, loc[i].y*.007, inc*.5));
loc[i].add(vel[i]);
if(loc[i].x < 0 || loc[i].y < 0 || loc[i].x > 700 || loc[i].y > 700){
loc[i].x = random(0, 700);
loc[i].y = random(0, 700);
vel[i].x = 0;
vel[i].y = 0;
}
}
inc += .007;
}
void mousePressed(){
R1 = random(0, 255);
R2 = random(0, 255);
G1 = random(0, 255);
G2 = random(0, 255);
B1 = random(0, 255);
B2 = random(0, 255);
}
