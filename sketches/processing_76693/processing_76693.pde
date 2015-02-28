
int MAX = 500;
int[] xspeed = new int[MAX];
int[] yspeed = new int[MAX];
int[] x = new int[MAX];
int[] y = new int[MAX];
int[] r = new int[MAX];

void setup() {
    size(200,200);
    frameRate(30);
    smooth();
    noStroke();   
    fill(64,64,255,100);  
    //initialize all arrays
    for (int i = 0; i < MAX; i++) {
        xspeed[i] = int(random(-4,4));
        yspeed[i] = int(random(-4,4));
        x[i] = int(random(width));
        y[i] = int(random(height));
        r[i] = int(random(10,40));
    }
}

void draw() {
    background(32);
    for (int i = 0; i < MAX; i++) {
        ellipse(x[i],y[i],r[i],r[i]);               
        x[i] = x[i] + xspeed[i];
        y[i] = y[i] + yspeed[i];
        if ((x[i] > width) || (x[i] < 0)) {
            xspeed[i] = xspeed[i] * -1;
        }
        if ((y[i] > height) || (y[i] < 0)) {
            yspeed[i] = yspeed[i] * -1;
        }
    }
}
