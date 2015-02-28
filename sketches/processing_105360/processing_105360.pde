
PFont bask;
PFont ariel;
PFont harlow;
PFont comic;
PFont times;



void setup(){
  size(700,600);
  smooth();
  bask = loadFont("BaskOldFace-20.vlw");
  ariel = loadFont("Arial-Black-17.vlw");
  harlow = loadFont("HarlowSolid-27.vlw");
  comic = loadFont("ComicSansMS-40.vlw");
  times = loadFont("TimesNewRomanPSMT-14.vlw");

}

void draw(){
  background(255);
  
  textFont(bask);
  fill(0);
  text("This is, for the record, my first time ever doing this. <br />I do not think I will actually manage it, but here's hoping. I was right.", 30,30);
  
  
  textFont(ariel);
  fill(110,200,30);
  text("Aaaaand this is going to be so utterly hideous by the time I'm done. Bwahaha", 20,100);
  
  textFont(harlow);
  fill(123);
  text("Not so long, this time.", 20, 250);
  
  textFont(comic);
  fill(222,222,0);
  text("Because I had to. Sorry, guys.",20,400);
  
  textFont(times);
  fill(0,222,222);
  text("And of course, the classic.",20,500);
}

