
PFont fontA;
PFont fontB;

void setup() {
size(400, 400);
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
ellipse(75, 75, 100, 100);
ellipse(325, 75, 100, 100);
fill(#000000);
line(45, 115, 115, 45);
line(285, 45, 355, 110);


stroke(#D6D6D6);
line(50, 120, 120, 50);
line(55, 125, 125, 55);
line(60, 130, 130, 60);
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
ellipse(200, 200, 300, 300);
fill(#FFFFFF);

textFont(fontA, 100);
text("T", 107, 200);
text("A", 160, 200);
text("K", 230, 200);
text("E", 290, 200);
textFont(fontB, 100);
text("TIME", 200, 285);

noFill();
stroke(#000000);
strokeWeight(5);
ellipse(200, 200, 300, 300);
line(50, 340, 75, 310);
line(350, 340, 325, 310);


for (int i = 0; i < 12; i++) {
float dx = cos(i * TWO_PI / 12);
float dy = sin(i * TWO_PI / 12);
line(200 + 130 * dx, 200 + 130 * dy, 200 + 140 * dx, 200 + 140 * dy);
}

strokeWeight(8);
drawHand(80, hour(), 12);

strokeWeight(5);
drawHand(140, minute(), 60);

strokeWeight(2);
stroke(#4374D9);
drawHand(140, second(), 60);
}

void drawHand(float radius, float value, float divider) {
float x = 200 + radius * cos(value * TWO_PI / divider - PI / 2.0f);
float y = 200 + radius * sin(value * TWO_PI / divider - PI / 2.0f);
line(200, 200, x, y);

}

