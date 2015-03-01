
PGraphics rend;
float readerX = 0;
void setup(){
  size(600, 400, P2D);
  //background(0);
  noCursor();
  noSmooth();
  rend = createGraphics(width,height);
}

void draw(){
  rend.beginDraw();
    rend.noStroke();
    rend.colorMode(RGB, 255);
    rend.background(0, 12);
    for(float x = 0; x < width; x += width / 120){
      rend.colorMode(HSB, 1.0);
        rend.stroke(noise(x + readerX), noise(x + readerX), noise(x + readerX));
          rend.ellipse(x, (height - (height / 2)) - ((noise(x + readerX) * (height / 2))), 2, 2);
    }
    for(float y = 0; y < width; y += width / 120){
      rend.colorMode(HSB, 1.0);
        rend.stroke(noise((y + 50) + readerX), noise((y + 50) + readerX), noise((y + 50) + readerX));
          rend.ellipse(y, (height) - ((noise((y + 50) + readerX) * (height / 2))), 2, 2);
    }
  rend.endDraw();
  image(rend, 0, 0);
  readerX += .05;
}


