
class ColorBox {
  private int ir;
  private int ig;
  private int ib;
  
  private color c;
  
  ColorBox() {
    this.ir = 1;
    this.ig = 1;
    this.ib = 1;
    this.c = color(#000000);
  }
  
  color getColor() {
    return this.c;
  }
  
  color getColorPlusRandom() {
    float r = red(this.c) + floor(random(-100, 100));
    float g = green(this.c) + floor(random(-100, 100));
    float b = blue(this.c) + floor(random(-100, 100));
    return color(r, g, b);
  }
  
  void changeColor() {
    float r = red(this.c);
    float g = green(this.c);
    float b = blue(this.c);
    r += this.ir*floor(random(7));
    g += this.ig*floor(random(10));
    b += this.ib*floor(random(13));
    if(r > 255) {
      r = 255;
      this.ir = -1*this.ir;
    }
    else if(r < 0) {
      r = 0;
      this.ir = -1*this.ir;
    }
    if(g > 255) {
      g = 255;
      this.ig = -1*this.ig;
    }
    else if(g < 0) {
      g = 0;
      this.ig = -1*this.ig;
    }
    if(b > 255) {
      b = 255;
      this.ib = -1*this.ib;
    }
    else if(b < 0) {
      b = 0;
      this.ib = -1*this.ib;
    }
    this.c = color(r, g, b);
  }
}

