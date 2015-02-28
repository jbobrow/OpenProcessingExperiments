
float R = 40;

color[] palette = { #9da349, #aa1f22, #283545, #c18144, #667323, #78b5ad, #5d4b27, #deaf3b, #1e1915 };

void setup() {
    size(400, 400);
    ellipseMode(RADIUS);
}

void draw() {
    float t = millis() * 1e-3;
    int k = floor((t + 1) / 2);
    boolean isEven =  (t % 2 < 1);
    noStroke();
    translate(0.5 * width, 0.5 * width);
    for (int i = 8; i > 0; i--) {
        float f = i + (isEven ? 1 : (t % 1));
        fill(palette[(k - i + palette.length) % palette.length]);
        ellipse(0, 0, R * f, R * f);
    }
    if (isEven) {
        fill(palette[k % palette.length]);
        arc(0, 0, R, R, 0, (t % 1) * TWO_PI);
    }
}
