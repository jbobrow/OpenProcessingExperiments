
int N = 100;

float bobX[] = new float[N];
float bobY[] = new float[N];
float bobAge[] = new float[N];
color bobColor[] = new color[N];

float trirandom(float x) {
    return random(x) - random(x);
}

int resetBob(int i) {
    bobX[i] = 0.5 * width;
    bobY[i] = 0.5 * height;
    bobAge[i] = 0;
    bobColor[i] = color(random(0xcc, 0xff), 0x33);
}

void updateBob(int i) {
    bobX[i] += trirandom(2);
    bobY[i] += trirandom(1);
    bobAge[i] += 0.002;
    if (bobAge[i] >= N)
        resetBob(i);
}

void initBobs() {
    for (int i = 0; i < N; i++) {
        resetBob(i);
        bobAge[i] = i;
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < 2000; j++)
            updateBob(i);
    }
}

void mouseClicked() {
    initBobs();
}

void setup() {
    size(400, 400);
    initBobs();
}

void draw() {
    background(0xbb, 0xdd, 0xff);
    for (int i = 0; i < N; i++) {
        int j = (i * 9) % N;
        stroke(bobColor[j]);
        strokeWeight(10 * sqrt(N - bobAge[j]));
        point(bobX[j], bobY[j]);
    }
    for (int i = 0; i < N; i++)
        updateBob(i);
}
