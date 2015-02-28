
int popul = 10;
Fish[] fishes    = new Fish[popul];
Plankton[] plank = new Plankton[popul];
float[] fsegs    = new float[10];

float ymin, ymax;
float plank_size = 6;
float fish_size  = 20;

void setup() {
    size(450, 300);
    noStroke();
    smooth();

    ymin = -height/2;
    ymax = height*2;

    // precalc fish segment sizes
    // a fish has 10 segments
    for (int i=0; i < 10; i++)
        fsegs[i] = map(i, 0, 9, fish_size, 1);

    // create objects
    for (int i=0; i < popul; i++) {
        plank[i] = new Plankton();
        fishes[i] = new Fish();
    }
}


void draw() {
    background(#777777);
    for (int i=0; i < popul; i++) {
        plank[i].go();
        fishes[i].go();
    }
}


class Fish {

    float x, y, vx, vy, y2=random(1000); // main movement
    float[] xseg = new float[10]; // segments x coords
    float[] yseg = new float[10]; // segments y coords
    float scale;
    float left_wrap;   // if (x < left_wrap) reset()
    int clr;           // color

    Fish() {
        reset();
    }

    void go() {
        // "sinewave"
        y = ymin + noise(y2+=vy) * ymax;
        x -= vx;

        // (x,y) drags segment [0],
        // segment [i] drags [i+1] and so on
        if (x > left_wrap) {
            xseg[0] = x;
            yseg[0] = y;
            fill(clr);
            for (int i=0; i < 9; i++) {
                ellipse(xseg[i], yseg[i], fsegs[i]*scale, fsegs[i]*scale);
                float t = atan2(yseg[i]-yseg[i+1], xseg[i]-xseg[i+1]);
                xseg[i+1] = xseg[i]-cos(t)*2*scale;
                yseg[i+1] = yseg[i]-sin(t)*2*scale;
            }
        }
        // wrap
        else reset();
    }

    void reset() {
        if (random(100) > 10) {
            // normal fish
            scale = 1;               // normal scale
            x = width+fish_size;     // initial x pos
            left_wrap = -fish_size;
            // random color
            clr = 0xFF000000
                | (int) random(190,255)<<16
                | (int)random(100,255)<<8
                | 10;
        }
        else {
            // big fish
            scale = random(2, 3);     // scale up
            x = width+(fish_size*scale);
            left_wrap = -fish_size*scale;
            // random color
            clr = 0xFF000000
                | (int)random(190,255)<<16
                | (int)random(100,255)<<8
                | 200;
        }

        vx = random(1, 3); // x "velocity"
        vy = vx*0.003;     // y "velocity"
    }
}


class Plankton {

    float x, y, vx, vy, y2=random(1000);

    Plankton() {
        reset();
    }

    void go() {
        x -= vx;
        y = ymin + noise(y2+=vy) * ymax;
        if (x > -plank_size) {
            fill(#FFFFFF);
            ellipse(x, y, plank_size, plank_size);
        } else reset();
    }

    void reset() {
        vx = random(0.5, 2);
        vy = vx*0.003;
        x = width+plank_size;
    }
}
