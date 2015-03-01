
int width;
int height;
int diameter = 50;
color fillColor;

float x, y, vx, vy;

void setup() {
    // setup is called once at start up.
    width = 500;
    height = 500;
    size(width, height);
    x = width / 2;
    y = height / 2;
    vx = random(20.0) - 10.0;
    vy = random(20.0) - 10.0;
    fillColor = color(255, 0, 0);
    fill(fillColor);
};

void draw(){
    // draw is called repeatedly
    // clear out the background
    background(0);
    // draw the circle at the correct position
    ellipse(x, y, diameter, diameter);
    // add velocity to the position
    x += vx;
    y += vy;
    // bounce off the walls
    if (x > width) { x = width; vx *= -1.0; }
    if (x < 0) { x = 0; vx *= -1.0; }
    if (y > height) { y = height; vy *= -1.0; }
    if (y < 0) { y = 0; vy *= -1.0; }
};

