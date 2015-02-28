

PFont myfont;
PFont mine;
PFont he;
PFont heh;
PFont ho;
PFont hi;
PFont hey;

void setup(){
  size(600,600);
  background(255,255,255);
  myfont = loadFont("AdobeArabic-Regular-48.vlw");
  mine = loadFont("AdobeArabic-Regular-48.vlw");
  he = loadFont("AdobeArabic-Regular-48.vlw");
  heh = loadFont("AdobeArabic-Regular-48.vlw");
  ho = loadFont("AdobeArabic-Regular-48.vlw");
  hi = loadFont("AdobeArabic-Regular-48.vlw");
  hey = loadFont("AdobeArabic-Regular-48.vlw");
}

void draw(){
  fill(254,255,224);
  textFont(myfont);
  textSize(20);
  text("way",458,65);
  
  fill(254,255,203);
  textFont(hey);
  textSize(29);
  text("sub",430,94);
  
  
  
  fill(251,255,161);
  textFont(hi);
  textSize(49);
  text("water",399,170);
  
  fill(253,255,149);
  textFont(ho);
  textSize(67);
  text("south",439,254);
  
  fill(255,247,152);
  textFont(heh);
  textSize(97);
  text("Wave",329,320);
  
  
  fill(255,242,95);
  textFont(he);
  textSize(183);
  text("the",230,430);
  
  fill(255,236,21);
  textFont(mine);
  textSize(259);
  text("Ride",10,537);
}

