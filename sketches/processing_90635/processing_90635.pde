
int[][] points = { {40, 40}, {70, 40}, {70, 30}, {95, 55}, {70, 80}, {70, 70}, {40, 70} };
void setup() {
size(100, 100);
fill(0);
smooth();
}
void draw() {
background(204);
translate(mouseX - 50, mouseY - 50);
beginShape();
for (int i = 0; i < points.length; i++) {
vertex(points[i][0], points[i][1]);
}
endShape(CLOSE);
}
