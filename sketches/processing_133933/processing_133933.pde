
void setup() {
size(1000,1000);
} 
void draw() {
background(0);
fill(random(96),random(227),random(219));
triangle(mouseX, mouseY, 508, 200, 805, 705);
stroke(225,random(100),random(255));
line(500,110,400,800);
line(800,400,110,800);
}
