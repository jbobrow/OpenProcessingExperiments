
// http://blog.hamoid.com/processing-bezier-fish

// Originally written in ActionScript.
// For a while it was the only thing you could find on my homepage.
 
int LINES = 20;
int SEGMENTS = 30;
int lines_ready = 0;
float[][][] point_a = new float[4][SEGMENTS][LINES];
int[] position = new int[LINES];
boolean erasing = false;
int target_back = 255;
int target_width = 9;
 
void setup() {
    size(500, 500); 
    frameRate(21);
    background(21, 21, 21); 
    smooth(); 
    randomize();
    loop();
}
 
void randomize() {
    float[][] n = new float[4][16];
    float[][] p = new float[4][4];
    for(int i=0; i<16; i++) {
        n[0][i] = random(-100, width + 100); // x
        n[1][i] = random(-100, height + 100); // y
        n[2][i] = random(1)*random(1); // width
        n[3][i] = random(255); // color
    }
    for (int L=0; L<LINES; L++) {
        position[L] = int(random(-30, -4));
        t = L/LINES;
        for (i=0; i<4; i++) {
            for (int j=0; j<4; j++) {
                p[j][i] = bezierPoint(n[j][i], n[j][i+4], n[j][i+8], n[j][i+12], t);
            }
        }
        for (int linepos=0; linepos<SEGMENTS; linepos++) {
            l = linepos/SEGMENTS;
            for (j=0; j<4; j++) {
                point_a[j][linepos][L] = bezierPoint(p[j][0], p[j][1], p[j][2], p[j][3], l);
            }
        }
    }
    lines_ready = 0;
}
void draw() {
    if (erasing) {
        noStroke();
        fill(target_back,50);
        rect(0,0,width,height);
        noFill();
        if (random(20) > 18) {
            erasing = false;
        }
    }
    int curr_back = get(0,0);
    for(int L=0; L<LINES; L++) {
        int p = position[L]++;
        if (p >= 0) {
            if (p < SEGMENTS-1) {
                float wi = point_a[2][p][L];
                int co = point_a[3][p][L];
 
                strokeWeight(1 + random(1,target_width)*wi);
                stroke(curr_back);
                line(point_a[0][p][L], point_a[1][p][L], 
                         point_a[0][p+1][L], point_a[1][p+1][L]);
 
                strokeWeight(16*wi);
                stroke(co * random(0.95, 1.05));
                line(point_a[0][p][L], point_a[1][p][L], 
                     point_a[0][p+1][L], point_a[1][p+1][L]);
 
                strokeWeight(2);
                stroke(255);
                point(point_a[0][p+1][L], point_a[1][p+1][L]);
            } else if (p < SEGMENTS) {
 
                if(++lines_ready == LINES) {
                    if (random(20) > 17) {
                        target_back = random(255);
                        erasing = true;
                    }
                    if (random(20) > 18) {
                        target_width = random(2, 32);
                    }
                    randomize();
                    return;
                }
            }
        }
    }
}
 
void mousePressed() {
    target_back = random(255);
    erasing = true;
}
