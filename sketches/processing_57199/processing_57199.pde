
int option = 1;
void setup() {
size(480, 120);
point(240, 60);
smooth();
}

void draw() {
  // Option 1: ellipse movil
background(184, 245, 54);
if (option == 1) {
if (mousePressed){
  fill(0);
} else {
  fill(206, 110, 150);
}
ellipse(mouseX, mouseY, 80, 80);
smooth();
}

else if (option == 2) {
// Option 2: triangles
fill(239, 255, 70);
quad(158, 55, 199, 14, 392, 66, 351, 107);
triangle(347, 54, 392, 9, 392, 66);
triangle(158, 55, 290, 91, 290, 112);
} 
else if (option == 3) {
// Option 3: ellipses
for (int x = 50; x <= width-50; x += 20) {
for (int y = 50; y <= height-50; y+=20) {
  smooth();
  stroke(171, 213, 245);
  fill(RGB, 65, 137, 191);
ellipse(35, 60, 65, 105);
ellipse(65, 60, 65, 105);
ellipse(95, 60, 65, 105);
ellipse(125, 60, 65, 105);
ellipse(155, 60, 65, 105);
ellipse(185, 60, 65, 105);
ellipse(365, 60, 65, 105);
ellipse(385, 60, 65, 105);
ellipse(405, 60, 65, 105);
ellipse(425, 60, 65, 105);
ellipse(445, 60, 65, 105);
ellipse(465, 60, 65, 105);
}
}
} 
else if (option == 4) {
ellipse(278, -100, 400, 400);
ellipse(120, 100, 110, 110);
ellipse(412, 60, 18, 18);
}

else if (option == 5) {
// Option 5: Rotating arcs
int count = 120;
for (int x = 50; x <= width-50; x += 20) {
for (int y = 50; y <= height-50; y+=20) {
float s = map(count, 120, 0, 0, TWO_PI*2);
fill(198, 64, 107);
arc(x, y, 14, 14, s, s + PI);
count--;
}
}
}
else if (option == 6) {
  fill(64, 107, 198);
arc(190, 60, 80, 80, 0, PI+HALF_PI);
arc(290, 60, 80, 80, PI, TWO_PI+HALF_PI);
}
}
void mousePressed() {
option++;
if (option > 6) option = 1;
}

