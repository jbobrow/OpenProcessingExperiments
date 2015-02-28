
/*
!---keyboard
 0 // count <-> smooth
 
 1 // speed down (min:1)
 2 // default speed (2)
 3 // speed up (3~)
 
 a // size up
 s // size down
 h // default size
 
 d // stroke weight thicker
 f // stroke weight thinner
 g // stroke weight default (=rad value)
 
 x // stroke black <-> white
 z // background white <-> black
 
 !---mouse
 RIGHT // color change (random)
 LEFT PRESSED // ring length (mouseX) *smooth // arc_r
 */


int rad = 100;
int thick = rad;

int sp = 2; // second/n; default 2
int count = 0;
int arc_r;

int bgc = 255;
int stc = 0;

boolean f_count = true;
boolean bg = false;

//---------------------

void setup() {
  size(600, 600);
  smooth();
  noFill();
  stroke(stc);
  strokeWeight(thick);
  strokeCap(SQUARE);
}

//-------------------

void draw() {
  background(bgc);  
  arc(width/2, height/2, rad*2, rad*2, radians(90), radians(arc_r));

  if (f_count) {
    f_count();
  }
  else if (!f_count) {
    f_smoo();
  }  

  if (mousePressed) {
    if (mouseButton == RIGHT) {
      colorMode(HSB);
      stroke(random(255), 255, 255);
      strokeWeight(random(1, thick));
    }
  }
}


