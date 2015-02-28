
import controlP5.*;
import processing.pdf.*;
import geomerative.*;
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

ControlP5 cp5;
public float abstand;
public float durchmesser;



RFont font;
String textTyped = "halm";

boolean doSave = false;


void setup() {
  size(800,400);  
  smooth();

  // allways initialize the library in setup
  RG.init(this);
  font = new RFont("IMPACT.TTF", 200, RFont.LEFT);
  
  cp5 = new ControlP5(this);
  cp5.addSlider("abstand",0,100);
  cp5.addSlider("durchmesser",5,50);

}


void draw() {
   RCommand.setSegmentLength (abstand);
  if (doSave) beginRecord(PDF, timestamp()+"_####.pdf");

  background(255);
  // margin border
    pushMatrix();
  translate(130,300);

  if (textTyped.length() > 0) {
    // get the points on font outline
    RGroup grp;
    grp = font.toGroup(textTyped);
    grp = grp.toPolygonGroup();
    RPoint[] pnts = grp.getPoints();


    // dots
    fill(241, 159, 193);
    stroke(245, 163, 250);
    for (int i = 0; i < pnts.length; i++ ) {
      float diameter = durchmesser;
      // on ervery second point
      if (i%1 == 0) {
        ellipse(pnts[i].x, pnts[i].y, diameter, diameter);
      }
    }

    if (doSave) {
      doSave = false;
      endRecord();
      saveFrame(timestamp()+"_####.png");
    }
  }
  popMatrix();
}


void keyPressed() {
  // println(keyCode+" -> "+key);
  if (key != CODED) {
    switch(key) {
    case DELETE:
    case BACKSPACE:
      textTyped = textTyped.substring(0,max(0,textTyped.length()-1));
      break;
    case TAB:   
    case ENTER:
    case RETURN:
    case ESC:
      break;
    default:
      textTyped += key;
    }
  }

  if (keyCode == CONTROL) doSave = true;
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
