
int h=0;

    void setup() {
      size(400, 400);
      colorMode(HSB, 100);
      background(99);
      noStroke();
    }

    void draw() {
      fill(h, 99, 99);
      ellipse(mouseX, mouseY, 60, 60);
    }

    void mousePressed(){
      h += 5;
      h %= 100;
    }
