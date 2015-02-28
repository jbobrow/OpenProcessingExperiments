
void setup(){
  size(150,150);
}
void draw(){
  fill(38,85,129);
  //colorMode c1 = #314F6C;
rect(30,20,110,110,14);
fill(255);
ellipse(100,105,10,10);
PFont letterBerlin;
//the front "BerlinSansFBDemi-Bold-72.vlx" must be located in the
//current sketch's "data" directiory to load successfully
letterBerlin = loadFont("BerlinSansFBDemi-Bold-72.vlw");
textFont(letterBerlin,72);
text("t",70,110);
//createFont(BerlinSansFBDemi-Bold-72.vlw,72);
}
