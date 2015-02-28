
/**
 * Peter de Jong attractor applet by Thor Fr&#248;lich.<br>
 * <br>
 * Hold mouse button and move mouse to adjust variables.<br>
 * Release mouse button to render attractor in high quality.
 */

deJongAttractor dj;
boolean stop;
int stepCounter;

void setup() {
  size(640, 640);
  noFill();
  smooth();
  colorMode(HSB, 255);
  dj = new deJongAttractor();
  dj.reparam();
}

void draw() {
  if (!stop) {
    stepCounter++;
    if (stepCounter > 127) {
      stop = true;
      return;
    }
    dj.incrementalupdate();
  }
  image(dj.pi, 0, 0, width, height);
}

void mouseDragged() {
  noLoop();
  stop = true;
  dj.reparam();
  redraw();
}

void mouseReleased() {
  loop();
  stop = false;
  stepCounter = 0;
  dj.updateloop();
}






