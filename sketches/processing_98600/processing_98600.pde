
PFont fontA;
PFont fontB;

void setup() {
size(200, 200);
background(#D6D6D6);
smooth();
fontA = loadFont("Futura-Light-48.vlw");
fontB = loadFont("Futura-Bold-48.vlw");
textAlign(CENTER);
textFont(fontA, 32);
}


void draw() {
noFill();
stroke(#000000);
strokeWeight(5);

fill(#000000);


stroke(#D6D6D6);
line(25, 60, 60, 25);
line(27, 62, 62, 27);
line(30, 65, 65, 30);
line(57, 127, 127, 57);
line(52, 122, 122, 52);
line(49, 119, 119, 49);


line(281, 50, 355, 120);
line(280, 50, 355, 120);
line(280, 50, 350, 120);
line(277, 52, 347, 122);
line(275, 55, 345, 125);
line(272, 57, 342, 127);
line(270, 60, 340, 130);








fill(#8BBCFF);
ellipse(100, 100, 150, 150);
fill(#FFFFFF);

textFont(fontA, 50);
text("T", 53, 100);
text("A", 80, 100);
text("K", 115, 100);
text("E", 145, 100);
textFont(fontB, 50);
text("TIME", 100, 142);

noFill();
stroke(#000000);
strokeWeight(5);
ellipse(100, 100, 150, 150);
line(50, 340, 75, 310);
line(350, 340, 325, 310);


for (int i = 0; i < 12; i++) {
float dx = cos(i * TWO_PI / 12);
float dy = sin(i * TWO_PI / 12);
line(100 + 65 * dx, 100 + 65 * dy, 100 + 70 * dx, 100 + 70 * dy);
}

strokeWeight(8);
drawHand(40, hour(), 12);

strokeWeight(5);
drawHand(70, minute(), 30);

strokeWeight(2);
stroke(#4374D9);
drawHand(70, second(), 30);
}

void drawHand(float radius, float value, float divider) {
float x = 100 + radius * cos(value * TWO_PI / divider - PI / 2.0f);
float y = 100 + radius * sin(value * TWO_PI / divider - PI / 2.0f);
line(100, 100, x, y);

}

