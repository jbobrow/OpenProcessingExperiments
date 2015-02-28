
class GradientSpot {
  PVector position;
  float diam;
  float start_hue;
  float start_sat;
  float start_bri;
  int steps;
  GradientSpot() {
    this(new PVector(100, 100), 100f, 0f, 100f, 100f, 20);
  } 
  GradientSpot(PVector pos, float dia, float hu, float sa, float br, int st) {
    this.position = pos;
    this.diam = dia;
    this.start_hue = hu;
    this.start_sat = sa;
    this.start_bri = br;
    this.steps = st;
  }

  void display() {
    ellipseMode(CENTER);
    pushMatrix();
    translate(position.x,position.y);
    for(int i=steps;i>0;i--){
      color c = color(start_hue,start_sat,start_bri,start_sat*1/i);
      noStroke();
      fill(c);
      ellipse(0,0,diam/2 + diam/2/steps*i,diam/2 + diam/2/steps*i);
    }
    popMatrix();
  }
  void setPosition(PVector pos){
    this.position = pos;
  }
}


