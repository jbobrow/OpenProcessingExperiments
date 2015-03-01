
int max = 200;
double s, xOff, yOff;
var start;
int[][] cArr;

void setup() {
    size(800, 800);
    cArr = new int[width][height];
    
    reset();
}

void reset() {
    xOff = 0;
    yOff = 0;
    
    start = false;
    
    s = 4;
    
    mandelbrot(s);
}

void keyPressed() {
    if (key == 'r') reset();
}

void mouseClicked() {
    xOff = xOff + (mouseX-(width/2.0))*(s/width);
    yOff = yOff + (mouseY-(height/2.0))*(s/height);
    start = true;
}

void draw() {
    if (!start) return;

    s -= s/4;
    mandelbrot(s);
}

void mandelbrot(double s) {
    int curMin = max, curMax = 0;
    loadPixels();
    
    for (int i = 0; i < height; i++) {
    
        double cR = xOff+(i - width/2.0)*(s/width);
        
        for (int j = 0; j < width; j++) {
        
            double cI = yOff+(j - height/2.0)*(s/height);
            
            double x = 0;
            double y = 0;
            
            int k = 0;
            
            while (x*x+y*y <= 4 && k < max) {
                double x_new = x*x - y*y + cR;
                y = 2*x*y + cI;
                x = x_new;
                k++;
            }
            
            if (curMin > k) curMin = k;
            if (curMax < k) curMax = k;

            cArr[i][j] = k;
        }
    }

    int cRange = curMax - curMin;

    for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
            int c = cArr[x][y];

            if (c == max) {
                c = 0;
            } else c = (int)(((float)(c-curMin)/(float)cRange) * 255);
            pixels[x + (width*y)] = color(min(c*5, 255), min(c, 255), 0);
        }
    }

    updatePixels();

    fill(255);
    text("edge length = " + s + "", 10, 10);
}
