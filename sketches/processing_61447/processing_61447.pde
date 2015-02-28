

  PFont myfont;
  PFont mine;
  PFont me;
  PFont I;
  PFont You;
  PFont Your;
  PFont Yours;
  PFont Youu;
  PFont We;
  PFont Wee;
  PFont Us;
  PFont Ha;
  PFont Ho;
  PFont He;

void setup(){
  size(800,800);
  background(0,0,0);
  myfont = loadFont("Baskerville-45.vlw");
  mine = loadFont("AdobeArabic-Regular-90.vlw");
  me = loadFont("AdobeFangsongStd-Regular-90.vlw");
  I = loadFont("AdobeArabic-Regular-90.vlw");
  You = loadFont("AdobeHeitiStd-Regular-90.vlw");
  Your = loadFont("BookmanOldStyle-BoldItalic-90.vlw");
  Yours = loadFont("AGaramondPro-Italic-90.vlw");
  Youu = loadFont("AdobeHeitiStd-Regular-90.vlw");
  We = loadFont("AlBayan-90.vlw");
  Wee = loadFont("AmericanTypewriter-Condensed-90.vlw");
  Us = loadFont("BlairMdITCTT-Medium-90.vlw");
  Ha = loadFont("Calibri-BoldItalic-90.vlw");
  Ho = loadFont("BookmanOldStyle-BoldItalic-90.vlw");
  He = loadFont("AdobeArabic-Regular-90.vlw");
}

void draw(){
  fill(240,106,82);
  textFont(myfont);
  textSize(58);
  text("CANAL WALK",100,300);
  
  fill(44,52,46);
  textFont(Ho);
  textSize(25);
  text("Please use revolving door",240,375);
  
  fill(245,190,146);
  textFont(mine);
  textSize(70);
  text("Textron",500,400);
  
  fill(219,179,146);
  textFont(me);
  textSize(20);
  text("metro PARK",390,320);
  
  fill(54,29,4);
  textFont(Your);
  textSize(10);
  text("CVS",450,335);
  
  fill(116,103,92);
  textFont(I);
  textSize(19);
  text("GARDA",410,350);
  
  fill(106,105,252);
  textFont(You);
  textSize(98);
  text("exchange building", 50,230);
  
  fill(237,126,14);
  textFont(Yours);
  textSize(100);
  text("The Real",200,119);
  
  
  fill(146,202,250);
  textFont(He);
  textSize(199);
  text("GEM",0,188);
  
  
  fill(252,22,46);
  textFont(Yours);
  textSize(140);
  text("greyhound",70,600);
  
  fill(93,45,40);
  textFont(Youu);
  textSize(16);
  text("put au feu",470,340);
  
  fill(134,22,50);
  textFont(We);
  textSize(76);
  text("South Water",165,500);
  
  fill(34,54,160);
  textFont(Wee);
  textSize(40);
  text("BIKE ROUTE",170,312);
  
  fill(157,11,157);
  textFont(Us);
  textSize(60);
  text("moslEr",205,430);
  
  fill(78,15,255);
  textFont(Ha);
  textSize(230);
  text("RIPTA",320,630);
  
  fill(248,255,70);
  textFont(Your);
  textSize(300);
  text("FREE 7 water",70,790);
  
  
  
  
  
  
 
}

