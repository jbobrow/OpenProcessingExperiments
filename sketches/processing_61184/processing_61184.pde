
import controlP5.*;

import processing.pdf.*;
import geomerative.*;

ControlP5 cp5; //keine werte reinspeichern - dinge machen -> initialisieren

RFont font;
String textTyped = "grafikarin";

boolean doSave = false;
public float tiefe = 5;//variable erstellen
public float durchmesser; //public muss davor stehen, damits auch online funzt
public float dicke;
public float anzahl;
public float rMax;
public float x0;
public float y0; 
public float groesse;
public float kreise;
int num;  


void setup() {
  size(600,600);  
  // make window resizable
  frame.setResizable(true); 
  smooth();


  // allways initialize the library in setup
  RG.init(this);
  font = new RFont("FreeSans.ttf", 100, RFont.LEFT);

  // get the points on the curve's shape
  // set style and segment resultion

  //RCommand.setSegmentStep(11);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);

 // RCommand.setSegmentLength (11);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //RCommand.setSegmentAngle(random(0,HALF_PI));
  //RCommand.setSegmentator(RCommand.ADAPTATIVE);

  cp5 = new ControlP5(this);
  cp5.addSlider("durchmesser",0,100);
  cp5.addSlider("dicke",0,10);
  cp5.addSlider("anzahl",0,20); 
  cp5.addSlider("kreise",0,40, 10, 50, 150, 10);
  cp5.addSlider("groesse",0,2, 230, 50, 150,10); 

  rMax = 150;
  num = 400;
  x0 = (width-100)/2+100;
  y0 = height/2;
  tiefe = 2;
  groesse = 2;  
  kreise = 20;
   }
   
float[] xx = new float[1000];
float[] yy = new float[1000];  


void draw() {

   
    background(0);
     RCommand.setSegmentLength (anzahl);   
  if (doSave) beginRecord(PDF, timestamp()+"_####.pdf");
  // margin border
  pushMatrix();
  translate(100,500);

  if (textTyped.length() > 0) {
    // get the points on font outline
    RGroup grp;
    grp = font.toGroup(textTyped);
    grp = grp.toPolygonGroup();
    RPoint[] pnts = grp.getPoints();

    // lines
    stroke(255, 0, 186);
    strokeWeight(dicke);
    for (int i = 0; i < pnts.length; i++ ) {
      float l = tiefe;
      line(pnts[i].x-l, pnts[i].y-l, pnts[i].x+l, pnts[i].y+l);
    }

    // dots
    fill(255);
    noStroke();
    for (int i = 0; i < pnts.length; i++ ) {
      float diameter = durchmesser;
      // on ervery second point
      if (i%2 == 0) {
        ellipse(pnts[i].x, pnts[i].y, diameter, diameter);
      }
    }
   
  }
  popMatrix();  
 
 
  float a,x,y;
   
  for (int i=0; i<num; i++) {
    a = TWO_PI*i/num;
    xx[i] = cos(a)+groesse*cos(kreise*a);  
    yy[i] = sin(a)+groesse*sin(kreise*a);
  }
  for (int i=0; i<num; i++) {
    circles(i);
  }
}
 
void circles(int n) {
  float rSize = rMax/(1+abs(groesse));
  float x = 300+rSize*xx[n];
  float y = 220-rSize*yy[n];
  int vorher = n-1;
  if (vorher<0) { vorher = vorher+num; }
  float x2 = 300+rSize*xx[vorher];
  float y2 = 220-rSize*yy[vorher];
  stroke(255, 0, 186);
  line(x2,y2,x,y);
        if (doSave) {
      doSave = false;
      endRecord();
      saveFrame(timestamp()+"_####.pdf");
    }

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


