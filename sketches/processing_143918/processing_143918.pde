
final static int MAX = 2, GAP = 50, DIM = 120, RAD = DIM >> 1;
int page, cx, cy;
PImage bg;
PImage bg2;
PImage bg3;
int y;

Button back, next;
 
void setup() {
  size(719, 720);
  bg =loadImage("north.png");
  bg2 =loadImage("southr.png");
  bg3 =loadImage("southest.png");
 
  frameRate(50);
  noLoop();
  smooth();
 
  rectMode(CORNER);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
 
  stroke(0);
  strokeWeight(1.5);
 
  cx = width  >> 1;
  cy = height >> 1;
 
  back = new Button("NORTH", GAP, height - Button.H - GAP);
  next = new Button("SOUTH", width - Button.W - GAP, height - Button.H - GAP);
  
  }

 
void draw() {
  background(9, 24, 35);


  textSize(0100);
  fill(Button.TXTC);
  text("Page #" + page, cx, cy);
 
  textSize(020);
  if (page > 0)     back.display();
  if (page < MAX)   next.display();
 
  method("page" + page); 
}

 
void mousePressed() {
  if      (page > 0   && back.hasClicked())   --page;
  else if (page < MAX && next.hasClicked())   ++page;
 
  redraw();
}
 
void page0() {
 fill(#091823);
 image (bg, 0, 0);
}
 
void page1() {
  fill(#091823);
  image (bg2, 0, 0);

}

void page2() {
  fill(#091823);
  image (bg3, 0, 0);
}
  
 
void pageSelector() {
  switch(page) {
  case 0: 
    page0();
    break;
 
  case 1: 
    page1();
    break;
    
  case 2:
    page2();
    break;
  }
}
 
class Button {
  final static int W = 60, H = 40;
  final static color BTNC = #961212, TXTC = 0;
 
  final String label;
  final short x, y, xW, yH;
  boolean on;
 
  Button(String txt, int xx, int yy) {
    label = txt;
 
    x = (short) xx;
    y = (short) yy;
 
    xW = (short) (xx + W);
    yH = (short) (yy + H);
  }
 
  void display() {
    fill(BTNC);
    rect(x, y, W, H);
 
    fill(TXTC);
    text(label, x + W/2, y + H/2);
  }
 
  boolean hasClicked() {
    return mouseX > x & mouseX < xW & mouseY > y & mouseY < yH;
  }
  
}


