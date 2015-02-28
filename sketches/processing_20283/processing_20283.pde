
// SO WHAT'S IN THE FRIDGE? //
// by ANNA REUTINGER //
// 2.7.11//


PFont joslt;

String title;

String l1 = "GRILLED";
String l2 = "SAUTEED";
String l3 = "FRIED";
String l4 = "PICKLED";
String l5 = "SEARED";
String l6 = "BRAISED";
String l7 = "POACHED";
String l8 = "CARMELIZED";

String m1 = "ARTICHOKE";
String m2 = "MUSHROOM";
String m3 = "EGG";
String m4 = "NOUGAT";
String m5 = "PROSCIUTTO";
String m6 = "KALE";
String m7 = "SALMON";
String m8 = "BEET";
String m9 = "CARROT";
String m10 = "AVOCADO";
String m11 = "YAM";
String m12 = "BANANA";
String m13 = "WALNUT";

String r1 = "AU GRATIN";
String r2 = "SOUFFLE";
String r3 = "GESPACHO";
String r4 = "A LA MODE";
String r5 = "CURD";
String r6 = "CASSEROLE";
String r7 = "CRUMBLE";
String r8 = "MOLE";
String r9 = "PUREE";
String r10 = "QUICHE";
String r11 = "OMLETTE";

PImage la;
PImage lb;
PImage lc;
PImage ld;
PImage le;

PImage ma;
PImage mb;
PImage mc;
PImage md;
PImage me;

PImage ra;
PImage rb;
PImage rc;
PImage rd;
PImage re;
PImage rf;





void setup() {
  size (637,480);
  smooth();
 
 // Title Page
 background(255);
 joslt = loadFont ("joslt.vlw");
 fill(0);
 textFont(joslt);
 text ("SO WHAT'S IN THE FRIDGE?", 107, 150);
  
  //Images
  la = loadImage("onionleft.png");
  lb = loadImage("pepperleft.png");
  lc = loadImage("eggsleft.png");
  ld = loadImage("mushroomleft.png");
  le = loadImage("artichokeleft.png");
  
  ma = loadImage("pastamid.png");
  mb = loadImage("toastmid.png");
  mc = loadImage("avocadomid.png");
  md = loadImage("carrotmid.png");
  me = loadImage("buttermid.png");
  
  ra = loadImage("artichokeright.png");
  rb = loadImage("pepperright.png");
  rc = loadImage("onionright.png");
  rd = loadImage("poblanoright.png");
  re = loadImage("bananaright.png");
  rf = loadImage("artichokeright.png");
  

}

void draw() {

// Randomize images in each panel

  if (mousePressed == true) {
    
PImage leftpanel[]={la, lb, lc, ld, le};
PImage leftpanel1 = leftpanel[int(random(0, leftpanel.length))];
image(leftpanel1, 0,0);

PImage midpanel[]={ma, mb, mc, md, me};
PImage midpanel1 = midpanel[int(random(0, midpanel.length))];
image(midpanel1, 213,0);

PImage rightpanel[]={ra, rb, rc, rd, re, rf};
PImage rightpanel1 = rightpanel[int(random(0, rightpanel.length))];
image(rightpanel1, 426,0);

// Randomize text in each panel

fill(255);
textFont (joslt);
String leftpanelt[]= {l1, l2, l3, l4, l5, l6, l7, l8};
String leftpanelt1 = leftpanelt[int(random(0, leftpanelt.length))];
text (leftpanelt1, 10, 460);


String midpanelt[]= {m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13};
String midpanelt1 = midpanelt[int(random(0, midpanelt.length))];
text (midpanelt1, 223, 460);


String rightpanelt[]= {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11};
String rightpanelt1 = rightpanelt[int(random(0, rightpanelt.length))];
text (rightpanelt1, 436, 460);


 
  }
  
}


