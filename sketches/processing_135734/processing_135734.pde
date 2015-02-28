
float sigma = 0.75;
int N = 10;
float L = 20.0;
int nBins = 100;

int width = 500;
int height = 250;
int rate = 30;

float[] bins;
float binSummation;
float[] discs;

void setup() {
        size(width, height);
        frameRate(rate);

        ellipseMode(RADIUS);
        strokeWeight(1);

        bins = new float[nBins];
        discs = new float[N];

        binSummation = 0;
        for (int i = 0; i < nBins; ++i) {
                bins[i] = 0;
        }
}

void draw() {
        background(150);

        for (int i = 0; i < N; ++i) {
                discs[i] = random(L - (2 * sigma * N));
        }
        discs = sort(discs);
        for (int i = 0; i < N; ++i) {
                /* rescale */
                discs[i] = discs[i] + (((2 * i) + 1) * sigma);

                /* update bins */
                ++bins[int(discs[i] / L * nBins)];
                ++binSummation;
        }

        for (int i = 0; i < nBins; ++i) {
                float norm = bins[i] / binSummation * nBins;
                int density = int(150 - norm * 40);     // TODO: be smarter

                fill(density, density, density);
                noStroke();
                rect((width * i)/nBins, 0, (width * (i + 1))/nBins, height/2);
        }

        fill(0, 0, 0);
        stroke(0);
        line(0, height/2, width, height/2);

        noStroke();
        for (int i = 0; i < N; ++i) {
                ellipse(discs[i]/L * width, height/2, sigma/L * width, sigma/L * width);
        }
}

