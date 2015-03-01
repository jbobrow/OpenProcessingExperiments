
void setup() {
size(600, 600);
}
void draw() {
background(150);
drawTree(width/2, height, -50, 9);
}
void drawTree(float x1, float y1, float angle, float depth) {
if (depth ==0) return;
float x2 
= x1 + cos(radians(angle)) * depth * 10;
float y2 
= y1 + sin(radians(angle)) * depth * 10;
line(x1, y1, x2, y2);
drawTree(x2, y2, angle-30, depth-1); 
drawTree(x2, y2, angle+30, depth-1);
}

