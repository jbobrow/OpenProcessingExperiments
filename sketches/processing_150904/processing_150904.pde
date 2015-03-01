
// Export GIF Part 1
// import gifAnimation.*;
// GifMaker gifExport;

int h = 0;
int cycle = 720;
color[] palette = {
  #1C0021,
  #240047,#240047,#240047,
  #1C3166,#1C3166,#1C3166,
  #00A9D4,
  #40FFDC
};

void setup() {
    size(1280, 720);
    frameRate(60);
    smooth();
    background(#000000);
    noLoop();

    // Export GIF Part 2
    // gifExport = new GifMaker(this, "render/spinning-rope.gif");
    // gifExport.setRepeat(0); // = loop forever
}

void draw() {
    if (h < cycle) {
        int paletteRandom = int(random(palette.length));
        translate(width/2, height/2);
        rotate(radians(h*10));
        float r = random(100,255);
        fill(palette[paletteRandom]);
        ellipse(h, h, h, h);
        h++;
        loop();
    }

    else if (h >= cycle && h < (cycle*2)) {
        int paletteRandom = int(random(palette.length));
        translate(width/2, height/2);
        rotate(radians(h*10));
        float r = random(100,255);
        fill(palette[paletteRandom]);
        ellipse(h-(cycle*2), h-(cycle*2), h-(cycle*2), h-(cycle*2));
        h++;
        loop();
    }

    else if (h >= 1440) {
        h = 0;
    }

    // Export GIF Part 3
    // if (frameCount % 12 == 0 && frameCount < 600) {
    // gifExport.setDelay(8); // = speed of the animated GIF
    // gifExport.addFrame();
    //  }
    //if (frameCount>600) gifExport.finish();

    // Export PNG for Video:
    // if (frameCount<1440) saveFrame("render/spinning-rope-####.png");
}

