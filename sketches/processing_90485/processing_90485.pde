
color[] cool = {#363333, #007C7C, #00C8C8, #FFFFFF, #FFD300};
color [] palette = cool;

int n = 20;
int d = 20;

float[] x = new float[n];
float[] y = new float[n];

void setup() {
    size(600, 600);
    smooth();
    
    for(int q = 0; q < n; q++) {
        x[q] = (q+1) * width/(n+1);
        y[q] = random(height);
        }
    } 

void draw() {
    background(palette[0]);
    
    for (int q = 0 ; q < n; q++) {
        stroke(random(0, 256));
        ellipse(x[q], y[q], d, d);
        
        strokeWeight(3);
        fill(palette[4]);
        line(x[q], 0, x[q], height);
        
        
        y[q] = random(height);
    }
}
