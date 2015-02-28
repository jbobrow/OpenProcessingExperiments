
class GraphicStyle {
  // member
  float stroke_alpha = 255.0;
  float fill_alpha = 255.0;
  color stroke_clr = color(0, 0, 0, stroke_alpha);
  color fill_clr = color(255, 255, 255, fill_alpha);
  int stroke_weight = 1;
  int stroke_cap = 1;
  int stroke_join = 1;
  boolean has_stroke = true;
  boolean has_fill = true;

  // constructors
  GraphicStyle() {
    // default constructor
  }

  GraphicStyle(color fic, color stc, int stw, int stcap, int stjoin) {
    this.fill_clr = fic;
    this.stroke_clr = stc;
    this.stroke_weight = stw;
    this.stroke_cap = stcap;
    this.stroke_join = stjoin;
    this.stroke_alpha = alpha(stroke_clr);
    this.fill_alpha = alpha(fill_clr);
    this.has_stroke = true;
    this.has_fill = true;
  }


  // getter methods
  public color getFillColor() {
    return fill_clr;
  }

  public color getStrokeColor() {
    return stroke_clr;
  }

  public float getStrokeAlpha() {
    return stroke_alpha;
  }

  public float getFillAlpha() {
    return fill_alpha;
  }

  public int getStrokeWeight() {
    return stroke_weight;
  }

  public int getStrokeCap() {
    return stroke_cap;
  }

  public int getStrokeJoin() {
    return stroke_join;
  }

  // setter methods
  public void setFillColor(color fic) {
    this.fill_clr = fic;
  }

  public void setStrokeColor(color stc) {
    this.stroke_clr = stc;
  }

  public void setStrokeAlpha(float a) {
    this.stroke_alpha = a;
    this.stroke_clr = color(red(stroke_clr), green(stroke_clr), blue(stroke_clr), stroke_alpha);
  }

  public void setFillAlpha(float a) {
    this.fill_alpha = a;
    this.fill_clr = color(red(fill_clr), green(fill_clr), blue(fill_clr), fill_alpha);
  }

  public void setStrokeWeight(int stw) {
    this.stroke_weight = stw;
  }

  public void setStrokeCap(int stc) {
    this.stroke_cap = stc;
  }

  public void setStrokeJoin(int stj) {
    this.stroke_join = stj;
  }

  // apply style
  public void applyStyle() {
    if (has_stroke) {
      strokeWeight(stroke_weight);
      
      switch(stroke_cap) {
      case 2:
        strokeCap(ROUND);
        break;
      case 3:
        strokeCap(PROJECT);
        break;
      case 1:
        strokeCap(SQUARE);
        break;
      }
      
      switch(stroke_join) {
      case 2:
        strokeJoin(ROUND);
        break;
      case 3:
        strokeJoin(BEVEL);
        break;
      case 1:
        strokeJoin(MITER);
        break;
      }
      
      stroke(stroke_clr);
    }
    else {
      noStroke();
    }
    
    if (has_fill) {
      fill(fill_clr);
    }
    else {
      noFill();
    }
  }
}


