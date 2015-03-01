
int max = 200;

void setup() {
    size(800, 800);
    background(255);
    mandelbrot();
}

void mandelbrot() {
    loadPixels();
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            double cR = (i - width/2)*4/width;
            double cI = (j - height/2)*4/height;
            double x = 0, y = 0;
            int k = 0;
            while (x*x+y*y <= 4 && k < max) {
                double x_new = x*x - y*y + cR;
                y = 2*x*y + cI;
                x = x_new;
                k++;
            }
            if (k < max) {
                c = color(k*5, k, 0);
            } else c = color(0);
            
            pixels[i + (j*width)] = c;
        }
    }
    updatePixels();
}
