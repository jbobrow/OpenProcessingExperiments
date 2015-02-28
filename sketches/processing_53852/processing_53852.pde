
/* This is a template for bus-tops contest on OpenProcessing.org.
 *  Bus-Tops (http://bus-tops.com) is a public art project
 *  in London where we have placed 30 monochromatic red LED screens
 *  on the roofs of bus shelters across the city. Sketches from
 *  OpenProcessing Collections will be selected to be exhibited
 *  on these screens.
 *  For contest information and example sketches and submission:
 *  http://www.openprocessing.org/collections/?collectionID=1337
 */

PFont font;
PFont bigfont;

String [] quotes = {
  "I am on my way", 
  "I am being here\nnow", 
  "I am late", 
  "I am leaving", 
  "I forgot to get it\non the way", 
  "I am late because\nthe bus was late", 
  "Are we there yet?", 
  "I must go", 
  "Must I go?", 
  "Bus stop, bus go\nwhere does love grow?", 
  "I must have left it\non the bus", 
  "You're either on the bus\nor off the bus", 
  "Bus boy.  Rebus.\nBusted.", 
  "I am lost", 
  "Random thoughts\ntravel my mind",
  "I am commuter man", 
  "I want to go home", 
  "Hustle.  Bustle.", 
  "Here we go again", 
  "I just want\nan empty seat", 
  "Mayfair. Unfair.\nBus fare", 
  "The wheels on the bus\ngo round and round", 
  "I'm not sure\nI want to go there", 
  "I met him on the bus",
};

int [] sizes = {
  // 4, 6, 8, 12, 16, 20, 26, 32, 38, 42, 48, 58, 68, 88, 108, 128, 158, 188, 218, 248, 255, 220, 180, 140, 100, 60, 20, 10, 6, 4
  // 40, 38, 36, 34,32, 30, 28, 26, 24, 22, 20, 18, 16, 12,  7, 5, 4, 3, 2
  170, 190,  210, 230, 250, 270, 300, 330, 360, 390,  440, 480, 530, 600, 700, 800, 900, 1000, 1100, 1200, 1300,1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200, 2300, 2400, 2500, 2600
};
int isize, nsizes;
int nquotes, iquote, lastquote = 0;
int doDelay = 0;


public void setup() {
  //do not change, this is fixed for LED screens.
  background(0);
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);

  font = loadFont("FreesiaUPCBold-128.vlw");
//  font = loadFont("CenturyGothic-Bold-255.vlw");

  //  bigfont = loadFont("Garamond-Bold-48.vlw");
  textFont(font);
  textAlign(CENTER);
  nquotes = quotes.length;
  // iquote = (int)random(nquotes);
  iquote = 0;
  nsizes = sizes.length;
  isize = nsizes;
}


int h;
int dtime = 2000;
void draw() {
  delay (dtime);
  background(0); //keep background black (LEDs are brightness based)
  stroke(255, 0, 0); //LEDs are on the scale of red
  fill(255, 0, 0);   //LEDs are on the scale of red

  //----DO WHATEVER YOU LIKE BELOW-----
  //(do not make it interactive, since people won't be able to use mouse/keyboard on a bus stop----


  // time for a new quote
  if (isize >= nsizes) {

    while ( (iquote = (int)random(nquotes)) == lastquote);
    lastquote = iquote;

    // one or two lines? 
    if (quotes[iquote].indexOf('\n') > 0) {
      h = (int)(height/3);
    }
    else {
      h = (int)(height/1.5);
    }

    // draw the new quote full size
    textSize(maxTextSize(quotes[iquote]));
      stroke(255, 0, 0); //LEDs are on the scale of red
  fill(255, 0, 0);   //LEDs are on the scale of red
    // size index for next time
    isize = 0;
    dtime = 3000;
  }

  // same quote, going down in size
  else {
    textSize(sizes[isize++]);
      stroke(255/ (isize * .2), 0, 0); //LEDs are on the scale of red
  fill(255/(isize * .2), 0, 0);   //LEDs are on the scale of red
  h *= 1.05;
    dtime = 80;
  }


  text(quotes[iquote], width/2, h);

 
  
}
int maxTextSize(String s) {
  float strLength;
  for (int tsize = 180; tsize > 0; tsize -=4) {
    textSize(tsize);
    if ((strLength = textWidth(s)) <= width) {
      return (tsize);
    }
  }
  return(-1);
}


/*
void idraw() {
 background(0); //keep background black (LEDs are brightness based)
 stroke(255, 0, 0); //LEDs are on the scale of red
 fill(255, 0, 0);   //LEDs are on the scale of red
 
 //----DO WHATEVER YOU LIKE BELOW-----
 //(do not make it interactive, since people won't be able to use mouse/keyboard on a bus stop----
 int h;
 int tsize;
 int i;
 
 if (iquote >= quotes.length) {
 iquote = 0;
 }
 
 tsize = maxTextSize(quotes[iquote]);
 textSize(tsize);
 
 
 text(quotes[iquote], width/2, h);
 
 delay (2000);
 
 
 iquote++;
 }
 
 */



/* class Quote {
 String q;
 int maxsize;
 
 Quote (String s, int ssize) {
 q = new String(s);
 maxsize = ssize;
 }
 
 void drawQ (int qsize) {
 int h;
 if (q.indexOf('\n') > 0) {
 h = (int)(height/3);
 }
 else {
 h = (int)(height/2);
 }
 
 text(q, width/2, h);
 }
 }
 */

