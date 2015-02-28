
/** This class draws a line with arrows at its ends. One can specify wether the line is horizontal or vertical
 *   and provide a label text which is centered on the line.*/

class Measurement {
  float start_x; // starting x-coordinate top or left
  float start_y; // starting y-coordinate top or left 
  float end_x;   // ending x-coordinate bottom or right
  float end_y;   // ending y-coordinate bottom or right
  color mass_clr;// color used to render line and label
  String label;  // the label's string
  PFont schrift; // the font "SansSerif-14.vlw" should be in the data folder of the sketch
  int dir;       // direction of the line 1: horizontal 2: vertical

  Measurement(float stx, float sty, float endx, float endy, color clr, String lab, int di) {
    this.start_x = stx;
    this.start_y = sty;
    this.end_x = endx;
    this.end_y = endy;
    this.mass_clr = clr;
    this.label = lab;
    this.dir = di;
    this.schrift = loadFont("SansSerif-14.vlw");
  }

  public void display() {
    noFill();
    stroke(mass_clr);
    //line
    line(start_x, start_y, end_x, end_y);
    switch(dir) {
      //horizontal
    case 1:

      // arrow left
      line(start_x, start_y, start_x+5, start_y-5);
      line(start_x, start_y, start_x+5, start_y+5);
      // arrow right
      line(end_x, end_y, end_x-5, end_y-5);
      line(end_x, end_y, end_x-5, end_y+5);
      // label
      fill(mass_clr);
      textFont(schrift);
      textMode(MODEL);
      textAlign(CENTER);
      pushMatrix();
      translate(start_x+((end_x-start_x)/2), start_y+((end_y-start_y)/2));
      text(label, 0, 0);
      popMatrix();
      break;

      //vertical
    case 2:
      // arrow top
      line(start_x, start_y, start_x-5, start_y+5);
      line(start_x, start_y, start_x+5, start_y+5);
      // arrow bottom
      line(end_x, end_y, end_x-5, end_y-5);
      line(end_x, end_y, end_x+5, end_y-5);
      // label
      fill(mass_clr);
      textFont(schrift);
      textMode(MODEL);
      textAlign(CENTER);
      pushMatrix();
      translate(start_x+((end_x-start_x)/2)+10, start_y+((end_y-start_y)/2));
      rotate(HALF_PI);
      text(label, 0, 0);
      popMatrix();
      break;
    }
  }
}


