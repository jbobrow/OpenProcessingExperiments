
int counter;

void setup () {
size (700, 500);
}

void draw () {
background (255);
stroke(mouseX, 60, 93, 106);
for (int i = 10; i<400; i += 4) {
line (i+10, i+mouseY, i+20, 70+mouseX);
line (699, i*3, i+160, mouseX);
}
}
