
import geomerative.*;
RFont font;
PFont lato;

String textTyped = "kim albrecht";
String text1 = "kim albrecht";

void setup() {
  size(215,70);  
  smooth();

lato = createFont("Lato-Bla.ttf", 20);
  textFont(lato, 70);
  // allways initialize the library in setup
  RG.init(this);

  // load a truetype font
  font = new RFont("Lato-Bla.ttf", 20, RFont.LEFT);
  RCommand.setSegmentLength(10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}

void draw() {

  background(255);
    noStroke();
    fill(0);
    
if (text1.length() > 0) {
  text("kim albrecht", 28, 45);
  textSize(20);
  fill(0);
}

  translate(28, 45);

  if (textTyped.length() > 0) {
    // get the points on font outline
    RGroup grp;
    grp = font.toGroup(textTyped);
    grp = grp.toPolygonGroup();
    RPoint[] pnts = grp.getPoints();

    // map mouse axis
    float addToAngle = map(mouseX, 0,width, -PI,+PI);
    float curveHeight = map(mouseY, 0,height, 0,2);

    for (int i = 0; i < pnts.length-1; i++ ) {
      float d = dist(pnts[i].x, pnts[i].y, pnts[i+1].x, pnts[i+1].y);
      // create a gap between each letter
      if (d > 20) continue;
      // alternate in every step from -1 to 1
      float stepper = map(i%2,0,1,-1,1);
      float angle = atan2(pnts[i+1].y-pnts[i].y, pnts[i+1].x-pnts[i].x);
      angle = angle + addToAngle;

      float cx = pnts[i].x + cos(angle*stepper) * d*3 * curveHeight;
      float cy = pnts[i].y + sin(angle*stepper) * d*0.8 * curveHeight;

      bezier(pnts[i].x,pnts[i].y,  cx,cy, cx,cy,  pnts[i+1].x,pnts[i+1].y);
    }
  }
}

