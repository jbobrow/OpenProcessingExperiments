
robot r1;
robot r2;
robot r3;

void setup () {
  size (640, 480);
  smooth ();
  r1 = new robot (width*0.4, 100, random (100));
  r2 = new robot (width*0.3, 100, random (300));
  r3 = new robot (width*0.2, 100, random (200));
 
}
 
void draw () {
 
  background (100);
  
  translate (0, height* 0.4);
 
  pushMatrix ();
  r1. motion (20);
  r1. antennae ();
  r1. head ();
  r1. base ();
  popMatrix ();
  
  pushMatrix ();
  r2. motion (30);
  r2. antennae ();
  r2. head ();
  r2. base ();
  popMatrix ();
  
  pushMatrix ();
  r3. motion (40);
  r3. antennae ();
  r3. head ();
  r3. base ();
  popMatrix ();
}
 
class robot {
 
 
  float x;
  float y;
  float sbw;
  float v;
  float r = random (255);
  float g = random (255);
  float b = random (255);
  float lineX = random (30, 55);
  float lineY = random (75, 10);
  float headH = random (180, 165);
  float headW = random (180, 190);
  float bodyW = random (50, 85);
  float bodyH = random (60, 75);
  float trig = random (35, 95);
  color c = color (162, 100, 100);
 
  robot (float tempX, float tempY, float tempSBW) {
    x = tempX;
    y = tempY;
    sbw = tempSBW;
  }
 
 
  //void robot (int x, int y, float s){
 
  //randomSeed (0);
  //for (int i=135; i <  width +240 ; i += 240) {
  //float scalar = random (0.25, 1.0);
  //cyclops (i-330, 130, scalar);
 
  //  translate (x,y);
  //scale (s);
  //}
  //}
 
  //void display () {
 
  //void cyclops (int x, int y, float s) {
  //pushMatrix ();
  //translate (x, y);
  //scale (s);
 
  void antennae () {
    translate (x, y);
    fill (r, g, b);
    //antennae
    strokeWeight (7);
    stroke (sbw);
    line (x - 60, y-70, x +10, y+10);
    line (x + 60, y-70, x -10, y+10);
  }
 
 
  void neck () {
 
  line (x - 60, y-70, x - 60, y+10);
  line (x + 60, y-70, x + 60, y+10);
  //neck
  strokeWeight (7);
  stroke (sbw);
  line (x - 10, y+20, x - 10, y+100);
  strokeWeight (2);
  line (x+9, y+20, x+9, y+100);
  }
 
  void head () {
    //head
    noStroke ();
    ellipse (x, y, headW, headH);
    fill (252, 252, 252);
    ellipse (x, y, headW-80, headH-80);
    //iris
    if (v >90) {
      float iris = random (0, 90);
    fill (3, 3, 3);
    ellipse (x, y, iris, iris);
    //ellipse (x, y, 10, 10);
  }
  
  else {
    float iris = random (0,10);
    fill (31, 31, 31);
    ellipse (x, y, iris +20, iris+20);
  }
  }
  //base
  void base () {
    fill (r, g, b);
    noStroke();
    ellipse (x, y+200, 85, 85);
    //ellipse (x, y+200, headW-78, headH-65);
    fill (c);
    rect (x-43, y+70, 85, 128);
    fill (139, 123, 139);
    triangle (x-67, y+68, x + 67, y+68, x, 150);
 
    //popMatrix ();
  }
 
  void motion (float speed) {
    y = cos (frameCount/speed) *50;
  }
}
  
  
  
  
  
  
  
  
  
  

