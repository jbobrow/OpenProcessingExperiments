
int y;
y = 83;
float x = int(random(100)+109);
int z;
z =250;
float r = int(random(150)+108);
color vikingBlue = #1020ee;
color redStorm = #f23912;
color wolverineGreen = #085e12;

void setup() {
    size(400, 400);
    smooth();
}

void draw() {
    background(redStorm);
    noFill();
    strokeWeight(7);
    stroke(vikingBlue);
    int d = 95
    ellipse(x,y, d, d+16);
    strokeWeight(15);
    stroke(wolverineGreen);
    ellipse(x,350, 125, 125);
    fill(vikingBlue, 79);
    noStroke();
    rect(x,152, 60, y);
    fill(wolverineGreen, 180);
    rect(z, 90, 400, r);
}
