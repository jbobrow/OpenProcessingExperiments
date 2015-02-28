
PImage redImg, greenImg, blueImg;

PImage createChannel(float r, float g, float b) {
    PGraphics pg = createGraphics(200, 200);
    pg.beginDraw();
    pg.background(0x00);
    pg.stroke(r, g, b);
    pg.strokeWeight(20);
    pg.noFill();
    pg.ellipse(0.5 * pg.width, 0.5 * pg.height, pg.width - 22, pg.height - 22);
    pg.endDraw();
    return pg;
}

PImage drawChannel(PImage img, float x, float y) {
    float u = img.width;
    float v = img.height;
    blend(img, 0, 0, u, v, x - 0.5 * u, y - 0.5 * v, u, v, SUBTRACT); 
}

boolean paused;
void mouseClicked() {
    paused = !paused;
    if (paused)
        noLoop();
    else
        loop();
}

void setup() {
    size(400, 400);
    redImg = createChannel(0xff, 0x00, 0x00);
    greenImg = createChannel(0x00, 0xff, 0x00);
    blueImg = createChannel(0x00, 0x00, 0xff);
}

void draw() {
    float x0 = 0.5 * width;
    float y0 = 0.5 * height;
    float dmouseX = mouseX - pmouseX;
    float dmouseY = mouseY - pmouseY;
    background(0xff);
    drawChannel(redImg, x0 - dmouseX, y0 - dmouseY);
    drawChannel(greenImg, x0, y0);
    drawChannel(blueImg, x0 + dmouseX, y0 + dmouseY);
}
