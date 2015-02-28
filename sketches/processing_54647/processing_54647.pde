
PFont font1;
PFont font2;

void setup () {
  size (200,200);
  font1 = loadFont("BellMTItalic-48.vlw");
  font2 = loadFont ("FootlightMTLight-48.vlw");
}

void draw () {
  background(2,36,36);
  fill(30,232,230,20);
  textFont(font1);
  textSize(30);
  text("REAL EYES",(25),(25));
  text("REAL EYES",25,30);
  text("REAL EYES",25,35);
  text("REAL EYES",25,40);
  fill(21,232,230,50);
  textFont (font2);
  textSize(50);
  text("Realize",10,50);
  text("Realize",10,60);
  text("Realize",10,70);
  text("Realize",10,80);
  fill(21,232,230,80);
  textFont(font1);
  textSize (70);
  text("real",1-20,90);
  text("real",1-15,100);
  text("real",1-10,110);
  text("real",1-5,120);
  text("real",1,130);
  text("real",5,140);
  text("REAL",1-10,170);
  fill(216,255,0,90);
  textFont (font2);
  textSize(110);
  text("LIES", 30,205);  
  text("LIES", 37,189);  
  text("LIES", 56,156);  
  text("LIES", 147,168);  
}


