
/* @pjs preload="_DSC0188-2.jpg; font="Juste.ttf"; */

PImage tree;
int y = 700;
int y2 = 750;
int y3 = 650;
int x = 600;
int x2 = 1200;
int x3 = 1700;
PFont la;


void setup(){
  size (700,900);
  tree = loadImage("_DSC0188-2.jpg");
  la = createFont("Juste.ttf", 100);
  
  
}

void draw(){
  
  
  noStroke();
 background (100);
 
 
/* fill (#2E4589);
 rect(0,0,width,height);
fill(#0D401B);
rect (0, 400, width, 100);
fill(255);
ellipse( 400, 80, 100, 100);
*/
image(tree, 0, 0, width,height);
fill(#EA7D34);
ellipse( 100, y, 20, 20);
y++;
if (y > 900) {
  
  y = 700;
}
ellipse( 200, y2, 10, 10);
ellipse( 400, y, 10, 14);
ellipse( 500, y2, 20, 20);
fill (#45954F);
ellipse( 550, y3, 10, 10);
ellipse( 200, y, 10, 14);
ellipse( 150, y3, 20, 20);
fill(#C6DE69);
ellipse( 350, y3, 5, 5);
ellipse( 520, y, 15, 12);
ellipse( 250, y2, 8, 9);
y2= y2 + 2;
if (y2 > 900) {
  y2 = 650;
}
y3 = y3+3;
if (y3 > 899) {
  y3 = 680;
}
fill(255, 90);
rect ( 0, 220, width, 300);
fill (0);
textFont(la, 40);
text("If you reveal your secrets to the wind,", x, 300);
text("you should not blame the wind", x2, 350);
text("for revealing them to the trees.", x3, 400);
text(" -Khalil Gibran", x3+325, 470);


x--;
x2--;
x3--;
if (x < 50) {
  x=50;
}
if (x2 < 90) {
  x2=90;
}
if (x3 < 90) {
  x3=90;
}
}



