
final float DETAIL = 100;

void setup() {
  size(200, 200, P3D);
}

void draw() {
  background(0);

  translate(width/2, height/2, -512);
  rotateX(radians(map(mouseY, 0, height-1, 90, -90)));
  rotateY(radians(map(mouseX, 0, width-1, -90, 90)));

  for (int y = -height; y < height; y+=5) {
    for (int x = -width; x < width; x+=5) {
      int z = (int) (256 * noise((x+frameCount*2)/DETAIL, (y+frameCount*5)/DETAIL));

      stroke(0, 255, 0);
      point(x, y, z);
    }
  }
}
