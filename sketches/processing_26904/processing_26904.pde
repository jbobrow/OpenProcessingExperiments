
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer player;
AudioInput input;

 
//Zoom in to one shape. Size adjust. Several adjustments to values below to recreate image.
void setup() {
    size(1280, 720);
      smooth();
//minim code
minim = new Minim(this);
  player = minim.loadFile("richtcello__bothkindsofmusic.wav");
  input = minim.getLineIn();
  player.play();

}
 
public void draw() {
    loadPixels();
    for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
 
            float u, v, zoom, c_real, c_imaginary, julia_u, julia_v;
 
                            //the following three values specify the shape of the fractal
            zoom = 1.84f + (mouseY - width/2)*0.0008;
            //this was originally *0.0005
            c_real = -0.25f - (mouseY - width/2)*0.0009;
            c_imaginary = - (mouseX - width/2)*0.001;
 
            u = ((float) x / (float) width - 0.5f) * zoom;
            v = ((float) y / (float) height - 0.5f) * zoom;
 
            julia_u = (u * u - v * v + c_real + 0.5f) * width;
            julia_v = (2 * u * v + c_imaginary + 0.5f) * height;
 
            VectorType complex_squared = new VectorType(julia_u, julia_v);
            int col = getColor(complex_squared, pixels);
            set(x, y, col);
        }
    }
 //for kick - interactivity with mouse rollover
    rect(mouseX, mouseY, 50, 25);
}
 
public int getColor(VectorType subPixelPosition, int[] sourcePixels) {
    int x = floor(subPixelPosition.x);
    int y = floor(subPixelPosition.y);
    float u = subPixelPosition.x - x;
    float v = subPixelPosition.y - y;
 
    if (x < 0 || y < 0 || x >= width - 1 || y >= height - 1) {
        return color(245);
    }
 
    int indexTopLeft = x + y * width;
    int indexTopRight = x + 1 + y * width;
    int indexBottomLeft = x + (y + 1) * width;
    int indexBottomRight = x + 1 + (y + 1) * width;
 
    try {
        int col = lerpColor(lerpColor(sourcePixels[indexTopLeft],
                sourcePixels[indexTopRight], u), lerpColor(
                sourcePixels[indexBottomLeft],
                sourcePixels[indexBottomRight], u), v);
        float r = red(col);
        float g = green(col);
        float b = blue(col);
 
        r = constrain(r - 7, 0, 335); // adjust settings here to change color fade/decay
        g = constrain(g - 6, 0, 255);
        b = constrain(b - 7, 0, 245);
 
        return color(r, g, b);
    } catch (Exception e) {
        System.out.println("getBufferColor: " + x + " | " + y);
    }
    return color(0);
}
 
public class VectorType {
    float x, y;
 
    public VectorType() {
        x = 0;
        y = 0;
    }
 
    public VectorType(float x, float y) {
        this.x = x;
        this.y = y;
    }
 
 //Source: Processing.org, F Wotzel.
 //Experiments with fractal animation (series 1). 
 //Music: Free Sound Archive. Solo Cell Improvisations by user Richtcello.
}

//Minim code

void stop()
{
 
  player.close();
 
  input.close();
  minim.stop();
 
 super.stop();
}

