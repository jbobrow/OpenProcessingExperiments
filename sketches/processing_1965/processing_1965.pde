

    private static final float NOISE_SCALE = .007f;
    private static final float AMPLITUDE = 230f;
    private static final float TIME_STEP = 0.00001f;
    private static final float Y_STEP = 15f;
    private static final float X_STEP = 20f;
    private static final int NUM_OCTAVES = 4;
    private static final float FALLOFF = .35f;
    private static final float Y_START = 180f;
    private float time = 0.0f;
    private float ra;
    private float ga;
    private float ba;

    void setup() {
        size(640, 480);
        frameRate(30);
        smooth();

        noiseDetail(NUM_OCTAVES, FALLOFF);
        ra = random(1) * PI;
        ga = random(1) * PI;
        ba = random(1) * PI;
    }
   
    void draw() {

        background(0);
        fill(100, 100);
        float x = 0;
        float y = 0;
        float sra = ra, sga = ga, sba = ba;

        for (y = Y_START; y < height; y += Y_STEP) {

            float red = sin(sra += .05) * 64 + 191;
            float green = sin(sga += .055) * 64 + 191;
            float blue = sin(sba += .06) * 64 + 191;
            fill(red, green, blue, 255);
            stroke(0, 255);
            beginShape();
            curveVertex(0, y);
            for (x = 0; x < width + 20; x += X_STEP) {
                time += TIME_STEP;
                float n = noise(x * NOISE_SCALE + time, y * NOISE_SCALE - time, time);
                float a = map(n, 0, 1, -1, 1);
                float dispy = y + a * AMPLITUDE;
                curveVertex(x, dispy);
            }
            curveVertex(x, y);

            vertex(width, height);
            vertex(0, height);
            endShape();
        }

    }

    void mouseClicked() {
        ra = random(1) * PI;
        ga = random(1) * PI;
        ba = random(1) * PI;
    }

