
float crossX, crossY;

// A random value from -x to +x, with tri distribution
float rrandom(float x) {
    return random(x) - random(x);
}

float sign(float x) {
    return x > 0 ? +1 : x < 0 ? -1 : 0;
}

void setup() {
    size(400, 400);
}

void draw() {
    crossX += sign(mouseX - crossX);
    crossY += sign(mouseY - crossY);

    translate(crossX + rrandom(5), crossY + rrandom(5));
    rotate(rrandom(TWO_PI / 100));
    scale(random(10));

    stroke(0xcc, 0x00, 0x00);

    background(0x00);
    line(-width, 0, +width, 0);
    line(0, -height, 0, +height);
}
