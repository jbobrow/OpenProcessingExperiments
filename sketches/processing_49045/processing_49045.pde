
class MeasureArrow {
  float start_x;                           // start x coordinate
  float start_y;                           // start y coordinate
  float length;                            // length of arrow head
  float angle = 0.0;                       // angle in degrees
  color mass_clr = color(51, 51, 51, 100);  // default color arrow and label
  String label = "";                       // default empty label
  PFont schrift = loadFont("SansSerif-14.vlw"); // font must be in data folder
 
  // Constructor for default arrowhead
  MeasureArrow(float stx, float sty, float len, float ang) {
    this.start_x = stx;
    this.start_y = sty;
    this.length = len;
    this.angle = ang;
  }

  public void display() {
    float theta = radians(angle);      // calculate angle in radians
    float sine = sin(theta);           // precalculate sine
    float cosine = cos(theta);         // precalculate cosine
    float ex = start_x + cosine*length;// calculate endpoint x
    float ey = start_y + sine*length;  // calculate endpoint y
    noFill();
    stroke(mass_clr);
    // draw line
    line(start_x, start_y, ex, ey);
    
    // draw arrow top/left
    float epx = cos(theta-PI/8)*10;
    float epy = sin(theta-PI/8)*10;
    pushMatrix();
    translate(start_x, start_y);
    line(0,0,epx,epy);
    epx = cos(theta+PI/8)*10;
    epy = sin(theta+PI/8)*10;
    line(0,0,epx,epy);
    popMatrix();
    
    //draw arrow bottom/right
    pushMatrix();
    translate(ex, ey);
    epx = cos(theta+PI/8*7)*10;
    epy = sin(theta+PI/8*7)*10;
    line(0,0,epx,epy);
    epx = cos(theta-PI/8*7)*10;
    epy = sin(theta-PI/8*7)*10;
    line(0,0,epx,epy);
    popMatrix();
    
    // draw label
    fill(mass_clr);
    textFont(schrift);
    textMode(MODEL);
    textAlign(CENTER);
    pushMatrix();
    translate(start_x+cosine*(length/2), start_y+sine*(length/2));
    rotate(theta);
    text(label,0, -4);
    popMatrix();
  }

  // set the label text
  public void setLabel(String lab) {
    this.label=lab;
  }
 
  // set the arrow head's length
  public void setLength(float l) {
    this.length=l;
  }
  
  // set the angle of the arrow head
  public void setAngle(float ang) {
    this.angle=ang;
  }
  
  // set the color of the arrowhead and label
  public void setColor(color clr){
    this.mass_clr = clr;
  }
  
}


