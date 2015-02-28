
int counter;
int dx = 0.0;
int dy = 0.0;
boolean doLoop = true;

void setup() {  //setup function called initially, only once
    background(250);
    frameRate(30);
    noiseDetail(5, .55);
    colorMode(RGB);
    size(200, 200); 
    loadPixels();  
}

void keyPressed() {
    if (key == 'p') {
        if (doLoop)
            noLoop();
        else
            loop();
        doLoop  = !doLoop;
    }
}

void draw() {  //draw function loops 
    int xoff = 0.0 + dx;
    int zoff = 1000.0 + dy;
    for (int x = 0; x < width; x++) {
        int yoff = 1000.0 + dy; 
        for (int y = 0; y < height; y++) {
            int bright = map(noise(xoff ,yoff),0,1,20,150);
            pixels[x+y*width] = color(70, bright, 200);
            yoff += 0.01;
        }
        xoff += 0.01;
    } 
    updatePixels();
    dx += 0.01;
    dy += 0.01;
}
