
import colorLib.Gradient;

int[] colors;

void setup() {
  size(400, 400);
  colors = (new Gradient(this, new int[]{color(#95ACBF),color(#734C29), color(#59341E), color(#A6978F), color(#730C02)}, 50, true)).getColors();
}

public void draw() {
  loadPixels();
  for (int i = 0; i < width; i+=1) {
    for (int j = 0; j < height; j+=1) {
      pixels[j*width+i] = colors[(int) ((noise(frameCount/20f, i/60f,j/60f) * colors.length) % colors.length)];
    }
  }
  updatePixels();
}






