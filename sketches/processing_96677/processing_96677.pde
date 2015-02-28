
color[] pulse = {#F22294, #65D930, #F2E205, #A60303, #2055B5};
color[] palette = pulse;
PFont labelFont;

Table data;
int rowCount;
int d = 15;

void setup() {
size(600, 600);
data = newTable("data");
rowCount = data.getRowCount();
println("rowCount = " + rowCount);
smooth();
}

void draw() {
background(palette[4]);
textFront(labelFont);
stroke(180);
fill(100);

textAlign(CENTER);
line(100,450, 600, 450);
for (int i = 0; i < 7; i++) {
text (i-5, 100, 500-i*30);
}
text("Fun", 100, 250);

for (int row = 0; row <rowCount; row++) 

noStroke();
fill(#FFFFFF);
ellipse(x, y, d, d);

textAlign(RIGHT);
fill(170if(dist(x, y, mouseX mouseY) < (d/2)) {
text(state, x, y - 20;}
}
