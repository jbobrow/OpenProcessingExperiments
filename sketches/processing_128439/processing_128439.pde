
/*  This is a manipulatable
 flower of life drawing program
created by Pijus Zadeikis, 2014 
first attempt creating something with processing */

int wx=900; //width
int hy=450; //heigth
float oy=hy/2;
float ox=wx/2;
int level = 0;
int dia = 100; //diameter of circles drawn
int t = 4; //level of circles drawn
int hide = 0;
int op1, op2;
int dothis = 1;
boolean black = false;
boolean white = false;
boolean loop = true;

void setup() {
  size(900, 450);
  background(0);
}

void draw() {
  int c = int((((float(mouseX)+1)/wx)*1530));
  int d = dia;
  int r = d/2;
  float px = ox;
  float py = oy;
  infobar info = new infobar(c);
  next coord = new next();
  if (dothis==1){
  object objx = new object(px, py, d, c);
  py= py+r;
  level++;
  for (int i = 1; i<t; i++) {
    if (((py>(hy+r)) && px>(wx+r))||(py<(0-r) && px<(0-r))) {
      return;
    }
    objx = new object(px, py, d, c);
    level = i;
    for (int n=1; n<=level;n++) {
      coord.dr(px, py, r);
      px = coord.x; 
      py = coord.y;
      objx = new object(px, py, d, c);
    }
    for (int n=1; n<=level;n++) {
      coord.dd(px, py, r);
      px = coord.x; 
      py = coord.y;
      objx = new object(px, py, d, c);
    }
    for (int n=1; n<=level;n++) {
      coord.dl(px, py, r);
      px = coord.x; 
      py = coord.y;
      objx = new object(px, py, d, c);
    }
    for (int n=1; n<=level;n++) {
      coord.ul(px, py, r);
      px = coord.x; 
      py = coord.y;
      objx = new object(px, py, d, c);
    }
    for (int n=1; n<=level;n++) {
      coord.uu(px, py, r);
      px = coord.x; 
      py = coord.y;
      objx = new object(px, py, d, c);
    }
    for (int n=1; n<=(level-1);n++) {
      coord.ur(px, py, r);
      px = coord.x; 
      py = coord.y;
      objx = new object(px, py, d, c);
    }
    coord.uur(px, py, r);
    px=coord.x; 
    py=coord.y;
  }}
}

class next { //used for determining coordinates of next circle to be drawn
  float x, y;
  float S = (sqrt(3)/2);
  void dr(float a, float b, int r) {
    x=a+(r*S);
    y=b-(r/2);
  }
  void dd(float a, float b, int r) {
    x=a;
    y=b-r;
  }
  void dl(float a, float b, int r) {
    x=a-(r*S);
    y=b-(r/2);
  }
  void ul(float a, float b, int r) {
    x=a-(r*S);
    y=b+(r/2);
  }
  void uu(float a, float b, int r) {
    x=a;
    y=b+r;
  }
  void ur(float a, float b, int r) {
    x=a+(r*S);
    y=b+(r/2);
  }
  void uur(float a, float b, int r) {
    x=a+(r*S);
    y=b+((3*r)/2);
  }
}

class object { //objects is what I'm calling the circles being drawn
  int r; 
  int g; 
  int b;
  object(float x, float y, int radius, int colour) {
    cID obj; 
    obj = new cID(colour);
    r=obj.r;
    g=obj.g;
    b=obj.b;
    if (black) {
      r=0;
      g=0;
      b=0;
    }
    if (white) {
      r=255;
      g=255;
      b=255;
    }
    noFill();
    //fill(r,g,b,5);
    stroke(r-15, g-15, b-15, 100);
    ellipse(x, y, radius, radius);
    for (int i = 1; radius>=1; i++) {
      radius=radius-(i*(i/3));
      stroke(r-(10*i), g-(10*i), b-(10*i), 50);
      ellipse(x, y, radius-(mouseY/15), radius-(mouseY/15));
    }
  }
}
class cID { //converts a number [0,1530] into a fully saturated color.
  int r;
  int g;
  int b;
  cID(int colID) { 
    int cx = colID;
    if (cx<=255) {
      r=255; 
      g=0; 
      b=cx;
    }
    else if (255<cx && cx<=510) {
      r=510-cx; 
      g=0; 
      b=255;
    }
    else if (510<cx && cx<=765) {
      r=0; 
      g=cx-510; 
      b=255;
    }
    else if (765<cx && cx<=1020) {
      r=0; 
      g=255; 
      b=1020-cx;
    }
    else if (cx>1020 && cx<=1275) {
      r=cx-1020;
      g=255; 
      b=0;
    }
    else if (cx>1275 && cx<=1530) {
      r=255; 
      g=1530-cx;
      b=0;
    }
  }
}

class infobar { //creates a space to show info and instructions
  infobar(int c) {
    if (hide==0) {
      cID bar; 
      bar = new cID(c);
      fill(bar.r, bar.g, bar.b);
      stroke(bar.r+30, bar.g+30, bar.b+30);
      rect(0, 11, 900, 10); //colored bar
      fill(bar.r, bar.g, bar.b);
      textSize(10);
      text("Pijus Zadeikis 2014", 900-93, 9);
      text("Controls: UP & DOWN keys change diameter | LEFT & RIGHT keys change # of levels | press 'Z' to draw in black, 'X' for white | press SPACE to pause | press 'C' to clear ", 3, 9);
      fill(0);
      text(" 'H' hides this bar | MOUSE X coordinate controls color, MOUSE Y does something else | press 'R' to save image!", 3, 20);
      text("hello and <3", 900-60, 1);
      fill(255);
      text("Controls: UP & DOWN keys change diameter | LEFT & RIGHT keys change # of levels | press 'Z' to draw in black, 'X' for white | press SPACE to pause | press 'C' to clear ", 2, 10);
      text(" 'H' hides this bar | MOUSE X coordinate controls color, MOUSE Y does something else | press 'R' to save image!",2, 19);
      text("hello and <3", 900-61, 0);
    }
  }
}

void keyPressed() {
if( key == 'r' || key == 'R' ) {
    saveFrame("####KBAL.png");
  } 

  if (key == 'c'||key == 'C') { //clear drawing
    background(0);
  }
  else if (key == 'z' || key == 'Z') { //draw in black
    if (black) {                       //if already in black, turn off.
      black = false;
    }
    else {
      white =false; 
      black =true;
    }
  }
  if (key == 'x' || key == 'X') { //draw in white
    if (white) { 
      white = false;
    }
    else {
      black =false; 
      white =true;
    }
  }
  if (key == ' ') { //pause drawing
    if (dothis ==1) {
      dothis =0; }
    else dothis=1;
    }
  else if (key == 'h' || key == 'H') { //hide infobar
    if (hide==0) {
      hide=1;
      background(0);
    }
    else hide=0;
  }
  else if (key == CODED) {
    if (keyCode == UP) { //increase diameter
      dia=dia+10;
      if (dia>wx) {
        dia=dia-10;
      } 
      background(0); 
      background(0);
    }
    else if (keyCode == DOWN) { //decrease diameter
      dia=dia-10;
      if (dia==0) {
        dia=dia+10;
      } 
      background(0);
    }
    else if (keyCode == RIGHT) { //increase levels
      t++;
    }
    else if (keyCode == LEFT) { //decrease levels
      if (t==1) {
        return;
      }
      t--; 
      background(0);
    }
  }
}
