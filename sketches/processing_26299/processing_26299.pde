
PFont handwriting;
PFont edward;
PImage myimage;

void setup () {
  size (700,700);
 background (255);
 handwriting = loadFont ("Handwriting-Dakota-75.vlw");
 edward = loadFont ("EdwardianScriptITC-50.vlw");
myimage = loadImage ("19th century.gif");
 }

void draw () {


 textFont(handwriting);
 textSize(50);
  text ("Salutations", 15, 200);
  
  fill (0,0,255,100);
 textFont(edward);
 text ("How do you do?", 450,500);
 
 tint (255,50);
image (myimage,100, 0, 550, 700);

}

