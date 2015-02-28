

//import processing.pdf.*;
//boolean snapshot = false;
ArrayList Pattern;
float x,y;
int bs, maxbs;

/* getcolor variables
PImage img;
int imgx,imgy;
int r,g,b;
color imgpalette; 
*/


void setup() {
  size(550, 350);
  smooth();
  frameRate(24);
  Pattern = new ArrayList();
  maxbs = 30;
  //img = loadImage("test2.jpg");
}

void draw () {
    /*
    image (img, 0, 0);
    imgx = round(random(0,20));
    imgy = round(random(0,20));
    imgpalette = get(imgx,imgy);
    r = (imgpalette>>16)&255;
    g = (imgpalette>>8)&255;
    b = imgpalette&255;
    */
    x = mouseX;
    y = mouseY;
   background(255);
   noStroke();
    
  /*
  if (snapshot == true) {
    beginRecord(PDF, "Bloom.pdf");
  }
  */
  
  for (int i=0; i <= Pattern.size() -1; i++) {
    MouseCoordinate m = (MouseCoordinate)Pattern.get(i);
    m.display();
  }
  if (mousePressed) {
    //println(bs);
    if (bs >= maxbs) {
      bs = maxbs;
    } else {
      bs ++;
    }
    //begin bloomsize estimations
    if (bs <= maxbs/2) {
      fill(0,0,0,40);
    }
    else {
      fill (0,100,0,40);
    }
    ellipse(mouseX,mouseY,bs*10,bs*10);
    //end bloomsize estimations
  }
  
  /*if (snapshot == true) {
    endRecord();
    snapshot = false;
  }*/
}

void mouseReleased () {
  for (int i = 0; i < bs*10; i ++) { //bs*10 is the generated number of strands
    Pattern.add(new MouseCoordinate(x, y, bs));
  }
  bs = 0;
}


void keyPressed () {
  /*if (key == 'e') {
    snapshot = true;
  }*/
  if (key == 'r') {
      Pattern.clear();
  }
}



