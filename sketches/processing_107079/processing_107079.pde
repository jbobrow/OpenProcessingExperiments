
int N = 36;

float[] strandX = new float[N];
float[] strandY = new float[N];

void drawStrand() {

    beginShape();
    for (int i = 0; i < N; i++)
        curveVertex(strandX[i], strandY[i]);
    curveVertex(strandX[0], strandY[0]);
    curveVertex(strandX[1], strandY[1]);
    curveVertex(strandX[2], strandY[2]);
    endShape();
    
    for (int i = 0; i < N; i++) {
        float s = random(1);
        float theta = i * TWO_PI / N;
        strandX[i] += s * cos(theta);
        strandY[i] += s * sin(theta);
    }
}

void clear() {
    for (int i = 0; i < N; i++) {
        strandX[i] = 0;
        strandY[i] = 0;
    }
    background(0x33, 0x44, 0x11);
}

void mouseClicked() {
    clear();
}

void setup() {
    size(400, 400);
    clear();
}

void draw() {
    stroke(0xbb, 0x99, 0x11, 0x33);
    noFill();
    translate(0.5 * width, 0.5 * height);
    drawStrand();
}
