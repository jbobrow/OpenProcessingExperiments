
// Export GIF Part 1
// import gifAnimation.*;
// GifMaker gifExport;

int h = 0;

void setup() {
    size(1280, 720);
    frameRate(60);
    smooth();
    background(#000000);
    noLoop();

    // Export GIF Part 2
    // gifExport = new GifMaker(this, "rope.gif");
    // gifExport.setRepeat(0); // = loop forever
}

void draw() {
    translate(width/2, height/2);
    rotate(radians(h*10));
    float r = random(100,255);
    fill(r, 0, 0);
    ellipse(h, h, h, h);
    h = h + 1;
    loop();

    // Export GIF Part 3
    // if (frameCount % 6 == 0 && frameCount < 240) {
    // gifExport.setDelay(8); // = speed of the animated GIF
    // gifExport.addFrame();
    // }
    // if (frameCount>240) gifExport.finish();

    // Export PNG for Video:
    // if (frameCount<1000) saveFrame("rope-####.png");
}

