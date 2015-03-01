
void setup() {
size(500, 400);
background(70, 168, 8);
}

void draw() {
background(70, 168, 8);
stroke(210, 237, 55);
strokeWeight(30);
line(300, 0, 300, 500);
line(500, 0, 500, 500);
line(10, 0, 10, 500);
line(100, 0, 100, 500);
line(400, 0, 400, 500);
line(60, 440, 200, -20);
line(420, 440, 120, -20);
strokeWeight(1);
stroke(0, 0, 0);
fill(random(255));
triangle(mouseX, mouseY, 180, 360, 320, 360);
ellipse(mouseX, mouseY, 200, 200);
fill(247, 201, 161);
rect(mouseX-100, mouseY-40, 200, 80);
fill(random(255), random(255), random(255));
ellipse(mouseX-50, mouseY, 30,30);
ellipse(mouseX+50, mouseY, 30, 30);
fill(random(255));
rect(120, 310, 260, 70);
rect(120, 380, 50, 20);
rect(330, 380, 50, 20);
rect(190, 380, 120, 20);
}

