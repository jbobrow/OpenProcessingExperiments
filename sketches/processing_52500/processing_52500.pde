
//
//    
//     The original Bezier programming was authored by "Chinchbug", called
//            "High Order Bezier Curve Walking Study". 
//     It is a wonderful illustration of how Bezier curves are created.
//
//     This program, by Zeph, is a modification of Cinchbug's; it emphasizes
//            the Bezier curve building process itself as abstract art.  
//
//  - press the spacebar to start over
//  - press "p" to pause display for 3 seconds
//  - press "s" to save a snapshot picture of the screen
//
//================================================================
//import processing.opengl.*;     // enables 3D and smoother curves

PVector p[];      //using standard vectors - makes the math easier to handle
ArrayList lines;

int numPoints = 12, numPts;         //number of control points
int stepCnt = 100;      //number of steps
float curStep;          //current step
float  stepSize = 1.0/stepCnt;      //treat step size as a straight-up percentage  
float strokeHue;        //line color - hue
float alfa = 30;        //line color - alpha
float x,y,z,x1,y1,z1,x2,y2,z2;
float rotInc = 0.5;
int iter = 0;
 
//================================================================
 
void setup() {

//  size(1200,700,OPENGL);
  size(1200,700,P3D);
  colorMode(HSB,360,100,100,100);      //  hue, saturation, brightness, alpha
  background(0,0,0,100);               //  black
  directionalLight(120,0,100, width/3, height/4, 400);
  noFill();
  noCursor();
  stroke(223, 100, 100, alfa);
  smooth();
   
  lines = new ArrayList();
 
  //get the first set of control points
  newSet();
}
//================================================================
 
void draw() {
  directionalLight(170, 20, 100, width/2, height/2, 400);
  
  if(curStep < 1) {   //we haven't finished the final path yet, start the point recursion
     handlePoints(p, numPoints);
  }
  if((curStep > 0.999) && (curStep < 1.0)) { 
     delay(1000);
  } 
  if(curStep > 1.0) {
     iter++;
     displayLines();
  }  
  curStep += stepSize;           //bump up the step counter by one step
}  
//================================================================
 
void handlePoints(PVector pnt[], int numPts) {

  for(int i = 1; i < numPts; i++) {    //iterate through each control point
     if(i > 0) {     //draw line between the current point and the previous one
        line(pnt[i - 1].x, pnt[i - 1].y, pnt[i - 1].z, pnt[i].x, pnt[i].y, pnt[i].z);
// ------- save line data in array list for later rotation process
        lines.add(new Lines(pnt[i - 1].x, pnt[i - 1].y, pnt[i - 1].z,
                            pnt[i].x, pnt[i].y, pnt[i].z));
     }   
  }
  if(numPts > 1) {   //not the last recursion -- set up the subordinate control points for next recursion
     PVector cp[] = new PVector[numPts - 1];
     for(int i = 1; i < numPts; i++) {
       cp[i - 1] = PVector.sub(pnt[i], pnt[i - 1]);   
       cp[i - 1].mult(curStep);           
       cp[i - 1].add(pnt[i - 1]);
     }
     handlePoints(cp, numPts - 1);
  }
}
//================================================================
 
void newSet() {
  //just picks some random points for x,y,z locations
  p = new PVector[numPoints];      
  for(int i = 0; i < numPoints; i++) {
     x = random(width/6, width/2);
     y = random(50, height-50);
     z = random(-150, 150);
     p[i] = new PVector(x,y,z);
  }  
  curStep = 0.0;
  iter = 0;
}
//================================================================
 
void keyPressed() {
   if(key == ' ') {       // start over
       flushLineList();
       background(0,0,0,100);
       strokeHue = (random(1, 361));
       stroke(strokeHue, 100, 100, alfa);
       newSet();
  }
  if(key == 'p') {       // pause for 3 seconds
    delay(3000);
  }
  if (key == 's'){       // save snapshot of screen as .jpg, .tif, .tga or .png file
    saveFrame("Bezier-####.jpg");
  }
}
//================================================================
class Lines {
   float  x1,y1,z1;
   float  x2,y2,z2;
   
   Lines(float p1x, float p1y, float p1z, float p2x, float p2y, float p2z) {
      x1 = p1x; y1 = p1y; z1 = p1z;
      x2 = p2x; y2 = p2y; z2 = p2z;
   } 
} 

void displayLines() {
   background(0); 
   translate(width/2, 0, -250);
   rotateY(radians(iter*rotInc));
  
//          redraw all Bezier tangent lines from the ArrayList data
   for (int ln = 1; ln < lines.size(); ln++) {             
      Lines item = (Lines) lines.get(ln);
      line(item.x1, item.y1, item.z1, item.x2, item.y2, item.z2);      
   }
} 

void flushLineList() {
  for (int ln = lines.size() -1; ln > 0 ; ln--) {              
         Lines item = (Lines) lines.remove(ln);
  }
} 

