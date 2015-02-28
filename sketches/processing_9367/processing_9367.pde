
PImage mona;
PGraphics mb;
Pixel[] pxls;

int count;
int numCols;
int numRows;

void setup() {
 size (576, 300);
 mona = loadImage ("mona-lisa.jpg");
 mb = createGraphics (192, 300, JAVA2D);  
 pxls = new Pixel[0]; 
 
 numCols = 192/3;
 numRows = 300/3;
 count = 0;
 
 mb.beginDraw();
 mb.image (mona, 0, 0, 192, 300); 
 mb.loadPixels();  
 ArrayList<Pixel> tempPx = new ArrayList<Pixel>(); 
 for (int r = 0; r < numRows; r++) {
   for (int c = 0; c < numCols; c++) {
     float bright = brightness (mb.pixels[((192*r) + c)*3]);
     tempPx.add (new Pixel (c*3, r*3, bright));
   }
 }
 mb.updatePixels(); 
 mb.endDraw();  
 image (mb, 0, 0); 
 
 pxls = tempPx.toArray (pxls);
 Arrays.sort (pxls); 
 for (int r = 0; r < numRows; r++) {
   for (int c = 0; c < numCols; c++) {
     fill ( pxls[ (r*numCols) + c ].bright);
     rect (c * 3 + 192, r * 3, 3, 3);     
   }
 }  
 
 noStroke();
}

void draw() {
  
 Pixel current = pxls[count];
 fill (current.bright);
 rect (current.x + 192*2, current.y, 3, 3);

 if (count < pxls.length - 1) count ++;
}

class Pixel implements Comparable {
  int x;
  int y;
  float bright;

  Pixel (int px, int py, float pb) {
    x = px;
    y = py;
    bright = pb;
  }  
  
  int compareTo (Object obj) {
   return (int)-(((Pixel)obj).bright - this.bright); 
  }
}


