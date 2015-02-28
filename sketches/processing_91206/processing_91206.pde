
color[] cool = {#363333, #007C7C, #00C8C8, #FFFFFF, #FFD300};
color [] palette = cool;

int s = 200;

void setup() {
  size(600, 600);
  background(palette[1]);
}

void draw() { 
    xbox(width/2, height/2, 200);
}

void xbox(float x, float y, float s) {
    rectMode(CENTER);
    noFill();
    stroke(palette[3]);
    strokeWeight(7);
    rect(x, y, s/2, s/2);
    rect(x, y, s, s);
    rect(x, y, s*1.5, s*1.5);
    rect(x, y, s*2, s*2);
    rect(x, y, s*2.5, s*2.5);
    rect(x, y, s*3, s*3);
    line(0, 300, 600, 300);
    line(300, 0, 300, 600);
    line(x - s -100, y - s -100, x + s +100, y + s +100);
    line(x - s -100, y + s +100, x + s +100, y - s -100);
    noStroke();
    fill(palette[4]);
    ellipse(x, y, 20, 20);
    
    
}
