
int totalDots = 100;
Dot[] dots = new Dot[totalDots];

int width, height;
color fillColor;
float diameter = 6.0;

void setup() {
    // DEFINE THE STAGE
    width = 500;
    height = 550;
    size(width, height);
    // THE SAME FILL IS USED FOR ALL DOTS
    fillColor = color(255, 0, 0);
    fill(fillColor);
    noStroke();
    // CREATE A COLLECTION OF DOTS
    for (int i = 0; i < totalDots; i++) {
        Dot d = new Dot();
        d.x = random(width);
        d.y = random(height);
        d.vx = random(2.0) - 1.0;
        d.vy = random(2.0) - 1.0;
        dots[i] = d;
    }
    background(0);
};

void draw() {
    fill(0, 25);
    rect(0, 0, width, height);

    float r = 255;
    float g = 255;
    float b = 255;

    for (int i = 0; i < totalDots; i++) {
        r = map(dots[i].x, 0, width, 0, 255);
        g = map(dots[i].y, 0, height, 0, 255);
        fill(r, g, b);
        dots[i].update();
        ellipse(dots[i].x, dots[i].y, diameter, diameter);
    }
};

class Dot {
    float x = 0.0;
    float y = 0.0;
    float vx = 0.0;
    float vy = 0.0;
    
    void update(){
      // update the velocity
      this.vx += random(2.0) - 1.0;
      this.vx *= .96;
      this.vy += random(2.0) - 1.0;
      this.vy *= .96;
      // update the position
      this.x += this.vx;
      this.y += this.vy;
      // handle boundary collision
      if (this.x > width) { this.x = width; this.vx *= -1.0; }
      if (this.x < 0) { this.x = 0; this.vx *= -1.0; }
      if (this.y > height) { this.y = height; this.vy *= -1.0; }
      if (this.y < 0) { this.y = 0; this.vy *= -1.0; }
    }
}
