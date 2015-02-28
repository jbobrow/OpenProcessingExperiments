
// gil fourth excercise: easing 

float dim=0, XposA, XposB, YposA, YposB, Xpos=0, Ypos=1, ease=0.05;
int count=0;
String[] motto = new String[16];
PFont fontype;

void setup() 
{
  size(450, 450);
  noStroke();
  smooth();
  XposB=int(random(25, width-25)); //start position
  YposB=int(random(25, height-25)); 
  frameRate(15);
}

void draw() 
{   
  if ( (ease+=0.1) < 2 ) { //easing step
    Xpos += ( XposB - Xpos ) * ease;
    Ypos += ( YposB - Ypos ) * ease;
    if ((Xpos>width/2-15 && Xpos<width/2+15) && (Ypos>height/2-15 && Ypos<height/2+15 )) { // red color
      background(255); 
      fill(252, 9, 45, 255); // red harts
      Xpos = width/2; 
      Ypos = height/2; // force center coordinates
    } 
    else { // normal color
      background(100); 
      fill(230, 230, 230, 200); // grey harts
    }
    dim = map(Xpos, 0, height, 2, 0);  
    drawHart(Xpos, height-Ypos, dim);
    dim = map(Xpos, 0, height, 0, 2);  
    drawHart(width-Xpos, Ypos, dim);
    if (Xpos==width/2 && Ypos==height/2) { //stop looping
      endmsg();
    }
  } 
  else { // reset variables for new cicle
    ease=0.05;
    XposA=XposB; 
    YposA=YposB; 
    count++;
    XposB=int(random(25, width-25)); //new coordinates
    YposB=int(random(25, height-25));
  }
}


void drawHart (float px, float py, float dim) {
  // px,py lines coordinates, dim1,dim2 dimensional limits, 
  pushMatrix();
  translate(px, py-35); // to have the harts centered
  scale(dim);
  beginShape(); // hart shape
  vertex(0, 0);
  bezierVertex( 132, -65, 90, 98, 0, 140);
  bezierVertex( -98, 90, -132, -65, 0, 0);
  endShape();
  popMatrix();
}

void endmsg() {
  PFont fontype = loadFont("GillSans-48.vlw");  // carico font
  textFont(fontype);  
  textAlign(CENTER);
  textSize(12);
  text(int(count)+" crossings needed to fell in love", 0, height-35, width, height);
  count=0;
  text("mouse click to retry", 0, height-20, width, height);
  noLoop();  // stop cycling
}

void mousePressed() {
  Xpos=0; 
  Ypos=1; 
  XposB=int(random(25, width-25)); //new coordinates
  YposB=int(random(25, height-25));
  ease=0.05;
  loop();
}


