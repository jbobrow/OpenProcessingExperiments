
// Move the mouse across the flower
// to change its value

//fills 
int xar = 255;
int xag = 5;
int xab = 110;

int xbr = 85;
int xbg = 14;
int xbb = 64;

int xcr = 250;
int xcg = 122;
int xcb = 3;

int xdr = 250;
int xdg = 213;
int xdb = 3;

int xer = 125;
int xeg = 25;
int xeb = 60;

int xfr = 17;
int xfg = 80;
int xfb = 90;

int xgr = 185;
int xgg = 15;
int xgb = 146;

int xhr = 15;
int xhg = 141;
int xhb = 185;

int xir = 15;
int xig = 110;
int xib = 185;

int xjr = 15;
int xjg = 185;
int xjb = 73;

int xkr = 15;
int xkg = 110;
int xkb = 185;


void setup() {
size(600, 800);
background(#FF3B05);
}

void draw() {
  background (255, 59, 5);
  noStroke();
  smooth();
 
fill(10, 85, 19);
rect(300, 500, 10, 200);


 
fill(xar, xag, xab);
ellipse(300, 300, 400, 400);
 
fill(xbr, xbg, xbb);
ellipse(300, 300, 380, 380);
 
fill(xcr, xcg, xcb);
ellipse(300, 300, 360, 360);
 
fill(xdr, xdg, xdb);
ellipse(300, 300, 340, 340);
 
fill(xer, xeg, xeb);
ellipse(300, 300, 320, 320);
 
fill(xfr, xfg, xfb);
ellipse(300, 300, 300, 300);
 
fill(xgr, xgg, xgb);
ellipse(300, 300, 280, 280);
 
fill(xhr, xhg, xhb);
ellipse(300, 300, 260, 260);
 
fill (xir, xig, xib);
ellipse(300, 300, 240, 240);
 
fill(xjr, xjg, xjb);
ellipse( 300, 300, 220, 220);
 
fill (xkr, xkg, xkb);
ellipse(300, 300, 200, 200);
 
fill(xhr, xhg, xhb);
ellipse(300, 300, 180, 180);
 
fill(xgr, xgg, xgb);
ellipse(300, 300, 160, 160);
 
fill(xfr, xfg, xfb);
ellipse(300, 300, 140, 140);
 
fill(xer, xeg, xeb);
ellipse(300, 300, 120, 120);
 
fill(xdr, xdg, xdb);
ellipse(300, 300, 100, 100);
 
fill(xcr, xcg, xcb);
ellipse(300, 300, 80, 80);
 
fill(xbr, xbg, xbb);
ellipse(300, 300, 60, 60);
 
fill(xar, xag, xab);
ellipse(300, 300, 40, 40);
 
fill(0);
ellipse(300, 300, 20, 20);
 
fill(255);
triangle(290,90, 310,90, 300, 80); //top//
triangle(290,510, 310,510, 300, 520); //bottom//
triangle(510,290, 510,310, 520, 300); //right//
triangle(90,290, 90,310, 80, 300);//left//
 
triangle(160,140, 140,160, 135, 135); //NW//
triangle(160,460, 140, 440, 135, 465); //SW//
triangle(440,460, 460,440, 465,465); //SE//
triangle(440,140, 460, 160, 465, 135); //NE//
 
fill(6, 52, 12);
triangle(315, 600, 315, 620, 330,605);
triangle(295, 600, 295, 620, 280,605);

}

void mouseMoved() {
  xar = xar - 1;
  if (xar < 85) {
    xar = 255;
  }
    
  xag = xag + 1;
if (xag > 14) {
  xag = 5;
  }
  
  xab = xab - 1;
  if (xab < 64){
    xab = 110;
  }
  
  xbr = xbr + 1;
  if (xbr < 250) {
    xbr = 85;
  }
  
  xbg = xbg + 1;
  if (xbg > 122) {
    xbg = 14;
  }
  
  xbb = xbb - 1;
  if (xbb < 3) {
    xbb = 64;
  }
  
  xcg = xcg + 1;
  if (xcg > 213) {
    xcg = 122;
  }
  
  xdr = xdr - 1;
  if (xdr < 125) {
    xdr = 250;
  }
  
  xdg = xdg - 1;
  if (xdg < 25) {
    xdg = 213;
  }
  
  xdb = xdb + 1;
  if (xdb > 60) {
    xdb = 3;
  }
  
  xer = xer - 1;
  if (xer < 17) {
    xer = 125;
  }
  
  xeg = xeg + 1;
  if (xeg > 80) {
    xeg = 25;
  }
  
  xeb = xeb + 1;
  if (xeg > 90) {
    xeb = 60;
  }
  
  xfr = xfr + 1;
  if (xfr > 185) {
    xfr = 17;
  }
  
  xfg = xfg - 1;
  if (xfg < 15) {
    xfg = 80;
  }
  
  xfb = xfb + 1;
  if (xfb > 146) {
    xfb = 90;
  }
  
  xgr = xgr - 1;
  if (xgr < 15) {
    xgr = 185;
  }
  
  xgg = xgg + 1;
  if (xgg > 141) {
    xgg = 15;
  }
  
  xgb = xgb + 1;
  if (xgb > 185) {
    xgb = 146;
  }
  
  xhg = xhg - 1;
  if (xhg < 110) {
    xhg = 141;
  }
  
  xig = xig + 1;
  if (xig > 185) {
    xig = 110;
  }
  
  xib = xib -1;
  if (xib < 73) {
    xib = 185;
  }
  
  xjg = xjg - 1;
  if (xjg < 110) {
    xjg = 185;
  }
  
  xjb = xjb + 1;
  if (xjb > 185) {
    xjb = 73;
  }
  
  
  
  
  
  
  
  
  
  
}


