
PGraphics canvas;
final int MIX = 253; //255 is maximum

void setup()
{
  size(800, 600);
  frameRate(600);
    fill(100, 255, 100);

  canvas = createGraphics(width, height, P2D);
  canvas.beginDraw();
  canvas.background(0);
  canvas.noStroke();
  canvas.fill(255, 0, 255);
  canvas.endDraw();
}
void draw()
{
  canvas.loadPixels();
  for (int i=0, y=0; y<canvas.height; y++) {
    for (int x=0; x<canvas.width; x++, i++) {
      canvas.pixels[i] = 0xff000000 | (( canvas.pixels[i]  & 0xFF)*MIX)>>8;
    }
  }
  canvas.updatePixels();

  canvas.beginDraw();
  canvas.ellipse(mouseX, mouseY, 100, 100);
  canvas.endDraw();
  background(canvas);
  text(frameRate, 100, 10);
}


