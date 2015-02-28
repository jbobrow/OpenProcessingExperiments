
class Mass {
  float start_x;
  float start_y;
  float end_x;
  float end_y;
  float length;
  color mass_clr;
  String label;
  PFont schrift;
  int dir;

   Mass(float stx, float sty, float endx, float endy, color clr, String lab,int di) {
    this.start_x = stx;
    this.start_y = sty;
    this.end_x = endx;
    this.end_y = endy;
    this.mass_clr = clr;
    this.label = lab;
    this.dir = di;
    this.schrift = loadFont("SansSerif-14.vlw");
    if(dir == 1){
      this.length = end_x-start_x;
      this.end_x = start_x+length;
    }
    if(dir == 2){
      this.length = end_y-start_y;
      this.end_y = start_y+length;
    }
  }

  public void display() {
    noFill();
    stroke(mass_clr);
    //linie
    line(start_x, start_y, end_x, end_y);
    switch(dir){
    
    //horizontal
    case 1:
    // pfeil links
    line(start_x, start_y, start_x+5, start_y-5);
    line(start_x, start_y, start_x+5, start_y+5);
    // pfeil rechts
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
    // pfeil oben
    line(start_x, start_y, start_x-5, start_y+5);
    line(start_x, start_y, start_x+5, start_y+5);
    // pfeil unten
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
  
  public void setLabel(String lab){
    this.label=lab;
  }
  
  public void setLength(float l){
    this.length=l;
    if(dir == 1){
      this.end_x = start_x+length;
    }
    if(dir == 2){
      this.end_y = start_y+length;
    }
  }
}


