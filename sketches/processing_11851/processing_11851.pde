
// Star Polygon Explorer by Charles Cave - 9th August 2010 
// charles.cave@gmail.com 
// Read more at http://mathworld.wolfram.com/StarPolygon.html

// Draws a "Star Polygon" by drawing a set of P points on a circle then
// joining each point to the point that is Q steps away. 
// When Q = 1, regular polygons are drawn, eg P = 5 Pentagon

PFont font;
int   xcentre;
int   ycentre;
int   linethickness;
float radius;
int   p, q;
int   dotsize;
int   offset;   
String shapename;

/////////////////////
void polygonName() {
////////////////////
// check the values of p and q and see if the shape has a name

  shapename = "";
  if ((p == 3) && (q == 1)) { shapename = "Triangle"; }
  if ((p == 4) && (q == 1)) { shapename = "Square"; }
  if ((p == 5) && (q == 1)) { shapename = "Pentagon"; }
  if ((p == 6) && (q == 1)) { shapename = "Hexagon"; }  
  if ((p == 7) && (q == 1)) { shapename = "Heptagon"; }  
  if ((p == 8) && (q == 1)) { shapename = "Octagon"; }    
}


void makeAdjustments() {
      // implement rotation
    if ((key == 'z') || (key == 'Z')) {
        offset -= 1;
    }
    if ((key == 'x') || (key == 'X')) {
        offset += 1;
    }
    // increase/decrease number of points around the circle
    if ((key == 'w') || (key == 'W')) {
        if (p < 150) {
            p += 1;     
        } 
    }
    if ((key == 'q') || (key == 'Q')) {
        if (p > 3) {
            p -= 1;
        } 
    }
    // increase/decrease q - length of interval 
    // 1 <= q <= p/2
    if ((key == 's') || (key == 'S')) {
        if (q < p/2) {
            q += 1;
        } 
    }
    if ((key == 'a') || (key == 'A')) {
        if (q > 1) {
            q -= 1;
        } 
    }
    // line thickness
    if ((key == 'd') || (key == 'D')) {
        if (linethickness > 1) {
            linethickness -= 1;
        } 
    }
    if ((key == 'f') || (key == 'F')) {
        linethickness += 1;
    }
    
    // size of the circle drawn over the dot
    if ((key == 'e') || (key == 'E')) {
        if (dotsize > 0) {
            dotsize -= 1;
        } 
    }
    if ((key == 'r') || (key == 'R')) {
        dotsize += 1;
    }
    // save the frame if 'p' is pressed
     if ((key == 'p') || (key == 'P')) {
        saveFrame();
    }
}


//////////////
void draw() {
//////////////
 
  background(255);
  
  // arrays for storing coordinates of points around the circle
  int[] x = new int[200];  
  int[] y = new int[200];

   // if p has been adjusted check that q is <= p/2
   if (q > p/2) {
       q = p/2;              
   }
  
  // print the current parameters to the top left corner
  fill(0);  
  stroke(0);
  textSize(12);
  textAlign(LEFT);
  text("{" + p + "," + q + "} " + offset + " " + dotsize + " " + linethickness, 5, 15);
  
  polygonName();  // check if this combination of P and Q has a name
  textAlign(RIGHT);
  text(shapename, width - 5, 15);
  
  // calculate the points around the circle
  noStroke();
  fill(190,0,0,128);    // Color of the dots 
  for (int i = 0; i < p; i += 1) {
      x[i] = xcentre + int(radius*(cos(radians(offset + float(i)/float(p)*360.0))));
      y[i] = ycentre + int(radius*(sin(radians(offset + float(i)/float(p)*360.0))));
      ellipse(x[i], y[i], dotsize, dotsize);
  }
  stroke(0,0,0,85);   // Color of the lines 
  // now join each point to the next
  for (int i = 0; i < p; i += 1) {
      strokeWeight(linethickness);
      line(x[i], y[i], x[(i + q) % p], y[(i + q) % p]);
  }
  if (keyPressed) {
     makeAdjustments();
  }
}

///////////////
void setup() {
////////////////
 size(400,400);  
 xcentre = width/2;
 ycentre = height/2;
 radius  = float(xcentre - 25);
 linethickness = 1;
 dotsize = 2;
 p = 5;
 q = 2;
 offset = -90;
 font = loadFont("MyFont-12.vlw"); 
 textFont(font); 
 
 frameRate(8);    // one refresh per second is sufficient
 smooth();
}

