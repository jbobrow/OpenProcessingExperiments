
PFont font;
PFont fontn;
//variables for different font/size

void setup() {
  size(250,250);
  background(#F5C59F);
  smooth();
  noCursor();
  frameRate(190);
  //make framerate faster than default
}
 
float l = random(-50,150);
float l5= random(-30,100);
float n = random(0,150);
float n3 = random(0,100);
float s = random(-60,100);
float s6 = random(0,100);
//6 variables for six settings of postal code
 
void draw() {
  fill(#F5C59F,60);
  rect(-20, -20, 350, 350);
  //adding translucent backgrounds to create sense of movement
 
   l += (mouseY-l)/random(10, 20);
  l5 += (mouseY-l5)/random(10, 15);
   n += (mouseY-n)/random(10, 30);
  n3 += (mouseY-n3)/random(15, 25);
   s += (mouseY-s)/random(10, 12);
  s6 += (mouseY-s6)/random(20,30);
 // move letters around, each of a different speed


 
  fontn = loadFont("Bauhaus93-80.vlw");
  textFont(fontn);
  
  fill(#655643);
  text("L", mouseX-110, l);
  fill(#F6F7BD);
  text("N", mouseX-40, n);
  fill(#BF4D28);
  text("S", mouseX+30, s);
  
  font = loadFont("Bauhaus93-60.vlw");
  textFont(font);
  
  fill(#137F7F);
  text("6", mouseX+60, s6);
  fill(#80BCA3);
  text("5", mouseX-80, l5);
  fill(#E6AC27);
  text("3", mouseX, n3);
  //numbers and colours 
 
}


