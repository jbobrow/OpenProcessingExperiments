
int size =9;
float xinc = 0, delta = 0, deltaSz =0, deltaDetailSz = 0;
void setup() {
size(600, 600);
colorMode(HSB,360,100,100);
}
void draw() {
background(70,7,100);
delta = map(noise(xinc),0,1,-70, 220);
deltaSz = floor(map(noise(xinc),0,1, -8,8));
deltaDetailSz = map(noise(xinc),0,1, -8,8) - floor(map(noise(xinc),0,1, -8,8));
drawTree(width/2, height, -90, size+deltaSz);
xinc+=0.01;
}
void mousePressed(){
size++;
}
void drawTree(float x1, float y1, float angle, float depth) {
if (depth ==0) return;
float x2 
= x1 + cos(radians(angle)) * depth * (10 + deltaDetailSz);
float y2 
= y1 + sin(radians(angle)) * depth * (10 + deltaDetailSz);
float c = map(depth, 0, size+deltaSz,60+delta,160+delta);
stroke(c, 100, 100);
strokeWeight(depth);
line(x1, y1, x2, y2);
drawTree(x2, y2, angle-20, depth-1); 
drawTree(x2, y2, angle+20, depth-1);
}
