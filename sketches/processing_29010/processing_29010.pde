
// Rorshach test
// Jeremy English jhe@jeremyenglish.org
// 05/16/2011

final int WIDTH       = 500;
final int HEIGHT      = 500;
final int H_WIDTH     = WIDTH/2;

final int NUM_WALKERS = 50;  // Each walker has two shapes this is half of the total
final int MAX_BRUSH_W = 20;  // Maximum width of the brush
final int DISPLAY_SEC = 30;  // Number of seconds before a new test
final int MAX_BRUSH_T = 4;   // Maximum number of brush types

class Walker{
    private int x;
    private int y;
    private int w;
    private int alpha;
    private int brushtype;

    Walker(int x, int y, int width, int brushtype){
        this.x = x;
        this.y = y;
        this.w = width;
        this.alpha = 100;
        this.brushtype = brushtype;
    }
    
    void step() {
        int wh = w/2;
        int x2 = WIDTH-x;
        fill(0,0,0,alpha);
        stroke(0,0,0,alpha);
        switch(brushtype){
            case 0:
                rect(x - wh, y - wh, w, w);
                rect(x2 - wh, y - wh, w, w);
                break;
            case 1:
                ellipse(x, y, w, w);
                ellipse(x2, y, w, w);
                break;
            case 2:
                triangle(x, y - wh, x - wh, y + wh, x + wh, y + wh);
                triangle(x2, y - wh, x2 - wh, y + wh, x2 + wh, y + wh);
                break;
            default:
                quad(x, y - wh, x + wh, y, x, y + wh, x - wh, y);
                quad(x2, y - wh, x2 + wh, y, x2, y + wh, x2 - wh, y);
        }
        int s1 = (random(0, 2) < 1) ? -1 : 1;
        int s2 = (random(0, 2) < 1) ? -1 : 1;
        int a1 = (random(0, 50) < 1) ?  -1 : 0;
        x = min(abs(x + s1), H_WIDTH);
        y = abs(y + s2) % HEIGHT;
        alpha = min(alpha + a1, 100);
    }
}

Walker [] w;
int lastm;
boolean newscreen;

void init_walker_arr() {
    w = new Walker[NUM_WALKERS ];
    int bt = int(random(0, MAX_BRUSH_T));
    for(int i = 0; i < NUM_WALKERS; i++){
        w[i] = new Walker(int(random(1,H_WIDTH)), 
                (HEIGHT/NUM_WALKERS) * i, 
                int(random(1, MAX_BRUSH_W)),
                bt);
        w[i].step();
    }
}

void setup(){
    size(WIDTH, HEIGHT);
    frameRate(100);
    newscreen = false;
    lastm = millis();        
    colorMode(RGB, 255, 255, 255, 1000);
    background(200,200,200);
    init_walker_arr();
}

boolean fade_away(){
    boolean done = true;
    loadPixels();
    for (int j = 0; j < WIDTH * HEIGHT; j++) {
        color c = pixels[j];
        float r = red(c);
        float g = green(c);
        float b = blue(c);
        if (r < 200){  //Less than the background color?
            done = false;
            r++;
            g++;
            b++;
        }
        pixels[j] = color(r,g,b);
    }
    updatePixels();
    return done;
}

void draw(){
    if (newscreen){
        boolean done = fade_away();
        if (done){
            lastm = millis();
            newscreen = false;
            init_walker_arr();
        }
        return;
    }

    for(int i = 0; i < NUM_WALKERS;  i++){
        w[i].step();
    }

    int m = millis();
    if (m - lastm > DISPLAY_SEC * 1000){
        newscreen = true;
    }
}

// vim: set ft=java sw=4 ts=4 st=4 expandtab :

