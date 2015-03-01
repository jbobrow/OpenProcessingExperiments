
int n, s, r, x, y, o, yOff;
float t;
var diagonal = false;

void setup() {
    size(800, 800);
    n = 50;
    s = width/n;
    r = 96;
    o = 4;
    noStroke();
    rectMode(CENTER);
}

void mouseClicked() {
    diagonal = !diagonal;
}

void draw() {
    t = millis()/1000;
    background(25);
    for(int i = -o; i <= n+o; i++) {
        for(int j = -o; j <= n+o; j++) {
            x = i*s;
            y = j*s;
            yOff = sin(t+(x+y)/200)*50
            x = (diagonal) ? x + yOff : x;
            y+=yOff;
            fill(155+yOff*2, 255, 100-yOff*2, 15-dist(0, 0, (width/2)-x, (height/2)-y)/22.4);
            rect(x, y, r, r);
        }
    }
}
