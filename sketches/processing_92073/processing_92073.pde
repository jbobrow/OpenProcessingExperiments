
 import java.text.DecimalFormat;
class animation {
  private PImage[] frames;
  private int current;
  private int x;
  private int y;
  private boolean anim;
  animation(PImage sheet, int w) {
    anim = true;
    x = 0;
    y = 0;
    current = 0;
    frames = new PImage[sheet.width/w];
    for (int i = 0; i < frames.length; i++) {
      frames[i] = createImage(w, sheet.height, ARGB);
      frames[i].loadPixels();
    }
    sheet.loadPixels();
    for (int yi = 0; yi < sheet.height; yi++) {
      for (int i = 0; i < frames.length; i++) {
        for (int xi = 0; xi < w; xi++) {

          int loc = xi + (w * i) + yi * sheet.width;
          float r = red(sheet.pixels[loc]);
          float g = green(sheet.pixels[loc]);
          float b = blue(sheet.pixels[loc]);
          if (g == 255 && r == 0 && b == 0) {
            frames[i].pixels[loc - i * w - (sheet.width - w) * yi] = color(r, g, b, 0);
          } 
          else {
            frames[i].pixels[loc - i * w - (sheet.width - w) * yi] = color(r, g, b, 255);
          }
        }
      }
    }
    for (int i = 0; i < frames.length; i++) {
      frames[i].updatePixels();
    }
    sheet.updatePixels();
  }
  animation(String s, int l) {
    anim = true;
    x = 0;
    y = 0;
    current = 0;
    frames = new PImage[l];
    DecimalFormat df = new DecimalFormat("0000");
    for (int i = 1; i <= frames.length; i++) {
      frames[i-1] = loadImage(s + df.format(i) + ".png");
    }
  }
  public void draw(Boolean go) {
    if (go && (anim || (current == 0 || current == 2))) {
      current++;
    }
    current = current%frames.length;
    if (current < frames.length) {
      image(frames[current], x, y);
    }
    else {
      current = 0;
      image(frames[current], x, y);
    }
  }
  public void multidraw(Boolean go, int n) {
    if(frames.length == 1){
      image(frames[0],x,y);
    }else{
      int mi = millis();
      int m = frames.length/n;
      if(go){
        current = (current+1)%frames.length;
      }
      
      for(int i = 0+current%m; i < frames.length; i += m){
        image(frames[i], x, y);
      }
    }
  }
  public void setX(int n) {
    x = n;
  }
  public int getX() {
    return x;
  }
  public void setY(int n) {
    y = n;
  }
  public int getY() {
    return y;
  }
  public int getFrame() {
    return current;
  }
  public void setFrame(int n) {
    current = n;
  }
  public void stop() {
    anim = false;
  }
  public void resume() {
    anim = true;
  }
}

