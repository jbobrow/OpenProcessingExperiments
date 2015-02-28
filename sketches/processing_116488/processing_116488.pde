
private int    WIDTHSCR      = 800;
private int    HEIGHTSCR      = 800;

private int    paletteLength    = 13;
private int    usedPaletteLength  = 39;
private Palette  palette        = new Palette();

private float  lineSpacing      = 8;
private float  strokeThickness    = 1;

public void setup() {
  size(800, 800);
  strokeCap(SQUARE);
  colorMode(HSB, 360, 100, 100, 100);
}

public void draw() {
  background(60, 5, 95, 100);

  translate(WIDTHSCR / 2, HEIGHTSCR / 2);
  for (int i = 1; i < usedPaletteLength; i++) {
    int numSegments = 36;
    for (int j = 0; j < numSegments; j++) {
      for (int k = 0; k < 1; k++) {

        float radius = lineSpacing * usedPaletteLength;
        float chordLength = 2 * radius * sin(PI / numSegments);
        float colWidth = WIDTHSCR / numSegments;

        float angle = j * (TWO_PI / numSegments);
        PVector offset = new PVector(j * colWidth, k * radius);
        pushMatrix();
        rotate(angle);
        translate(0, offset.y);
        float increment = 0.05f * (0.06f + abs(1f - cos(frameCount * 0.004f)));
        float phase = (
        (i + j + k + 5) *
          log(i + j + k + 10) *
          sqrt(j + 100) / 5
          )
          * (increment);

        float atanWave = 0, logWave = 0, tanWave = 0;
        atanWave = atan(phase) * 1.f;
        logWave = log(phase) * 2;
        tanWave = tan((phase * j - i) / 100) * 0.1f;

        float x0 = 0;
        float x1 = (chordLength * cos(1 + phase));
        float y0 = lineSpacing * i;
        float y1 = y0;

        y0 -= atanWave;
        y1 += atanWave + tanWave + logWave;

        x1 *= i * (k + 1) / (float) usedPaletteLength;

        strokeWeight((1
          + sin(i + (i + j + k + 1) * log(i + j + k) // + sqrt(i + j + k + 0.1f)
        )) * lineSpacing * .5f);

        noFill();
        stroke(hue(palette.getColour(i)), saturation(palette.getColour(i)), brightness(palette.getColour(i)), 100);
        line(x0, y0, x1, y1);
        popMatrix();
      }
    }
  }
}
class Palette {
  int  index    = 0;
  int  colArr[]  = new int[paletteLength];

  Palette() {

    colArr[index++] = (int) unhex("FFA0A5A9");
    colArr[index++] = (int) unhex("FF00A4A7");
    colArr[index++] = (int) unhex("FF95CDBA");
    colArr[index++] = (int) unhex("FF00782A");
    colArr[index++] = (int) unhex("FF84B817");
    colArr[index++] = (int) unhex("FF003688");
    colArr[index++] = (int) unhex("FFFFD300");
    colArr[index++] = (int) unhex("FFEE7C0E");
    colArr[index++] = (int) unhex("FFB36305");
    colArr[index++] = (int) unhex("FF9B0056");
    colArr[index++] = (int) unhex("FF000000");
    colArr[index++] = (int) unhex("FFF3A9BB");
    colArr[index++] = (int) unhex("FFE32017");
  }

  int getColour(int i) {
    return colArr[i % colArr.length];
  }
}
