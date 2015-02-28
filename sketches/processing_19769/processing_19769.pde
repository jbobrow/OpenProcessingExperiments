
PFont font;
PFont sil;
PFont type;
PFont last;

void setup(){
size(250,250);
font = loadFont("BookmanOldStyle-48.vlw");
sil = loadFont("Stencil-48.vlw");
type = loadFont("Parchment-Regular-48.vlw");
last = loadFont("Papyrus-Regular-48.vlw");
smooth();
frameRate(2);

}

void draw(){
background(#000000);

textFont(sil,random(100));
fill(#05dcfc);
text("M5A",random(255),random(255));

smooth();
textFont(type,random(200));
fill(#fd0101);
text("3W7",random(200),random(200));

textFont(type,random(200));
fill(#fcf905,150);
text("M5A",random(255),random(255));

smooth();
textFont(last,150);
fill(#4eff00,random(255));
text("3W7",random(200),random(200));

}
