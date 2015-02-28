
//import processing.pdf.*;

final double DEFAULT_K0     = 2.4                       ,
             DEFAULT_K1     = 4.0                       ,
             DEFAULT_X0     = 0.0                       ,
             DEFAULT_X1     = 1.0                       ,
             AR             = (DEFAULT_K1 - DEFAULT_K0) /
                              (DEFAULT_X1 - DEFAULT_X0) ;
final int    W              = 800                       ,
             H              = round(W / AR)             ,
             MAX_ITERATIONS = 1 << 20                   ,
             MAX_MULTIPLIER = 1 << 10                   ;


double K0            ,
       K1            ,
       X0            ,
       X1            ,
       RectX0        ,
       RectX1        ,
       RectY0        ,
       RectY1        ;
int    Iterations = 3,
       Multiplier = 1,
       MouseX0       ,
       MouseY0       ,
       MouseX1       ,
       MouseY1       ;
PImage Bif           ;
PFont  Font          ;

void setup() {
    size(W, H, JAVA2D);
    //size(W, H, PDF, "bif.pdf");
    hint(ENABLE_NATIVE_FONTS);
    hint(DISABLE_DEPTH_TEST);
    smooth();
    //noSmooth();
    noLoop();
    noFill();
    stroke(0);
    Bif  = createImage(W, H, RGB);
    Font = loadFont("SansSerif.plain-16.vlw");
    textFont(Font);

    set(DEFAULT_K0, DEFAULT_K1, DEFAULT_X0, DEFAULT_X1);
}

void draw() {
    image(Bif, 0, 0);
    fill(0);
    text("Iterations (use +/- to change): "           + Iterations * Multiplier, 10, 20);
    text("Iteration multiplier (use >/< to change): " + Multiplier, 10, 40);
    text("View (use 'r' to restore the default): (" + round(K0, 3) + ", " 
                   + round(X0, 3) + ") x (" 
                   + round(K1, 3) + ", "
                   + round(X1, 3) + ")", 10, 60);
    if(mousePressed) {
      text("(" + round(RectX0, 3) + ", " 
               + round(RectY0, 3) + ", " 
               + round(RectX1, 3) + ", " 
               + round(RectY1, 3) + ")", MouseX0, MouseY0);
      noFill();
      rect(MouseX0, MouseY0, MouseX1 - MouseX0, MouseY1 - MouseY0);
    }
    //exit();
}

void set(double k0, double k1, double x0, double x1) {
    K0 = min(k0, k1);
    K1 = max(k0, k1);
    X0 = min(x0, x1);
    X1 = max(x0, x1);
    updateBif();
}

void updateBif() {
    Bif.loadPixels();
    // Clear image
    for(int i = 0; i < Bif.pixels.length; ++i)
       Bif.pixels[i] = 0xffffff;

    int iterations = Iterations * Multiplier;
    for(int k = 0; k < W; ++k) {
        double fk = mapK(k);
        // Begin at an arbitrary point and stabilize trajectory.
        double x = Math.random();//X0 + (X1 - X0) / 2.0;
        for(int i = 0; i < iterations; ++i)
           x = fk * x * (1.0 - x);

        // Plot trajectory for a certain amount of points.
        int n = min(H, iterations);
        for(int i = 0; i < n; ++i) {
           x = fk * x * (1.0 - x);
           if(x >= X0 && x <= X1)
              Bif.pixels[unmapX(x) * W + k] = 0;
        }
        // Slower, but more accurate inner loop. */
        /*for(int x = 0; x < H; ++x) {
            double fx = (double)x / (H - 1);
            for(int i = 0; i < iterations; ++i)
                fx = fk * fx * (1.0 - fx);
            if(fx >= X0 && fx <= X1)
                Bif.pixels[unmapX(fx) * W + k] = 0;
        }*/
        Bif.updatePixels();
        redraw();
    }
    /*Bif.updatePixels();
    redraw();*/
}

void mousePressed() {
    MouseX0 = MouseX1 = mouseX;
    MouseY0 = MouseY1 = mouseY;
    redraw();
}

void mouseDragged() {
    /*int w = mouseX - MouseX0,
        h = mouseY - MouseY0; 
    if(AR > 1.0) { 
        MouseX1 = mouseX                 ;
        MouseY1 = MouseY0 + round(w / AR);
    }
    else {
        MouseX1 = MouseX0 + round(h * AR);
        MouseY1 = mouseY                 ;
    }*/
    MouseX1 = mouseX;
    MouseY1 = mouseY;
    RectX0 = mapK(MouseX0);
    RectY0 = mapX(MouseY0);
    RectX1 = mapK(MouseX1);
    RectY1 = mapX(MouseY1);
    redraw();
}

void mouseReleased() {
    set(RectX0, RectX1, RectY0, RectY1);
}

void keyPressed() {
    switch(key) {
        case '+': if(Iterations < MAX_ITERATIONS) ++Iterations;
                  updateBif();
                  break;
        case '-': if(Iterations > 0) --Iterations;
                  updateBif();
                  break;
        case '>': if(Multiplier < MAX_MULTIPLIER) ++Multiplier;
                  updateBif();
                  break;
        case '<': if(Multiplier > 1) --Multiplier;
                  updateBif();
                  break;
        case 'r': set(DEFAULT_K0, DEFAULT_K1, DEFAULT_X0, DEFAULT_X1); break;
    }
}

double min(double a, double b) { return a < b ? a : b; }
double max(double a, double b) { return a > b ? a : b; }

double mapK(int k) {
    return K0 + k * (K1 - K0) / (W - 1);
}

double mapX(int x) {
    final int h = H - 1;
    return X0 + (h - x) * (X1 - X0) / h;
}

int unmapX(double x) {
    final int h = H - 1;
    return h - round((x - X0) * h / (X1 - X0));
}

int round(double x) {
    return (int)(x + 0.5);
}

double round(double x, int digits) {
    double d = Math.pow(10, digits);
    return round(d * x) / d;
}

