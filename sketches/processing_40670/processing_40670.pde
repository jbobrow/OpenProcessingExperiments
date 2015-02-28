
PFont f;
int x=0;
int y=0;
int input=0;
String typing ="";
String saved ="";

void setup() {
  size(900,600);
  background(200);
 f = loadFont("Serif-48.vlw");
}

void draw() {
background(200);
int indent = 30;
textFont(f);
fill(0);
if (input%2==0) {
  int Keyy=int(saved);
  y=Keyy;
}else{
int Keyx=int(saved);
x=Keyx;
}
 //Set text
 text("Multiply "+x+" and "+y,indent, 100);
 text ("The answer is "+x*y, indent, 350);
 text ("Enter x, press enter and then enter y", indent,250);
 text("Press Enter twice to restart",indent,500);
}

void keyPressed() {
if (key == '\n' ) {
    saved = typing;
    input=input+1;
    typing = ""; 
 } else {
     typing = typing + key; }
 }


