
int M = 25, N = 25;

color c1 = #88bb66;
color c2 = #ddffbb;

float pointX[M][N];
float pointY[M][N];
color fragColor[M][N];

float fragWidth = 20;
float fragHeight = 20;

void setup() {
    size(400, 400);
    pointX = new float[M][N];
    pointY = new float[M][N];
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            pointX[i][j] = (i - random(1) - 0.5 * (M - 2)) * fragWidth;
            pointY[i][j] = (j - random(1) - 0.5 * (N - 2)) * fragHeight;
        }
    }
    fragColor = new float[M - 1][N - 1];
    for (int i = 0; i < M - 1; i++) {
        for (int j = 0; j < N - 1; j++) {
            float f = round(random(5)) / 5.0;
            fragColor[i][j] = lerpColor(c1, c2, f);
        }
    }
}

void draw() {
    float t = millis() * 1e-3;
    translate(0.5 * width, 0.5 * height);
    scale(2, 1);
    rotate(t);
    noStroke();
    for (int i = 0; i < M - 1; i++) {
        for (int j = 0; j < N - 1; j++) {
            fill(fragColor[i][j]);
            quad(pointX[i][j], pointY[i][j], 
                 pointX[i+1][j], pointY[i+1][j], 
                 pointX[i+1][j+1], pointY[i+1][j+1], 
                 pointX[i][j+1], pointY[i][j+1]);
        }
    }
}
