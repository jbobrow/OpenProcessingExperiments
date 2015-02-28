
// DYPP: D.ifferent Y. P.ixel P.osition

int w = 320;
int h = 140;

int rasters[];
byte scrollText[];

int scrW, scrH;
int scrollPos, scrollOffset, sinePos;
short font[];
byte fontLookup[];

int sine[];

PGraphics goff;

void setup(){
  size(w*2,h*2);

  goff = createGraphics(w, h,P2D);

  /* init sine scroller */
  scrW = goff.width;
  scrH = goff.height;

  initFont();
  initScrollText();
  initRasters();
  initSine();

  scrollOffset = 0;
  scrollPos = 0;
  sinePos = 0;

  noStroke();
}

void draw() {      
  goff.loadPixels();
  demoFrame();
  goff.updatePixels();
  image(goff,0,0,width,height);
}

void demoFrame() {
  // obtain current scroll offset/text position and sine position,
  // then advance all of them.
  // scroll offset runs from 0 to 15. when it reaches 15, the
  // scroll position (the scrolltext character to be drawn) advances
  // and the scroll offset goes back to 0.

  scrW = w;
  scrH = h;

  int sco = scrollOffset, scp = scrollPos, sp = sinePos;
  if (++scrollOffset >= 16) {
    scrollOffset = 0;
    if (++scrollPos >= scrollText.length) scrollPos = 0;
  }
  sinePos += 4; 
  if (sinePos >= sine.length) sinePos -= sine.length;

  // clear screen by copying background
  for (int x = 0; x < goff.pixels.length; x++) {
    goff.pixels[x]=color(80);
  }


  //  System.arraycopy(goff.pixels, 0, goff.pixels, 0, goff.pixels.length-1);

  // draw a series of 16-pixel high vertical lines
  for (int x = 0; x < scrW; x++) {
    int ypos = sine[sp++]; 
    if (sp >= sine.length) sp = 0;

    short data = font[(scrollText[scp] * 16) + sco];
    if (++sco >= 16) {
      sco=0; 
      if (++scp >= scrollText.length) scp=0;
    }

    for (int y = 0; y < 16; y++) {
      if ((data & (1<<y)) != 0) {
        goff.pixels[(goff.width*((goff.height-64)/2))+(y+ypos)*scrW + x] = rasters[y+ypos];
        // scroll shadow
        if ((y+ypos+2 < scrH) && (x+2 < scrW))
          goff.pixels[(goff.width*((goff.height-64)/2))+(y+ypos+2)*scrW + x+2] = color(40,40,40);//0x000000;
      }
    }
  }
}

// we use a lookup table for the sine wave rather than calculate it in
// realtime
void initSine() {
  sine = new int[1024];
  // 0-1024 will be for us 0 to 4pi (720 degrees)
  // 1024 * x = 4pi, x=4pi/1024 = pi/(1024/4)  = pi/256
  //
  // the amplitude of the wave the screen height - 2, so there's a 1
  // pixel border top and bottom. But we also have to include the size
  // of the font, so the centre line running through the font has an
  // amplitude of screen height - 18 (16 pixel high font). 
  double ampl = (double) ((height) / 14);
  for (int i = 0; i < sine.length; i++) {
    sine[i] =    (int)((Math.sin((double)i * 1.00 * (Math.PI/256.0) ) *    ampl) + ampl) +1;
  }
}

// a simple set of colour fades down the screen
void initRasters() {
  int cols[] = { 
    0xFF0000, 0xFFFF00, 0x00FF00, 0x00FFFF,
    0xFF00FF, 0x00FFFF, 0x0000FF         };
  int bar = 0, seg = scrH / cols.length-1;

  rasters = new int[scrH];

  int r_from, g_from, b_from, r_to, g_to, b_to;
  r_from = (cols[0] >> 16) & 0xFF;
  g_from = (cols[0] >>  8) & 0xFF;
  b_from = (cols[0]      ) & 0xFF;

  for (int x = 1; x <= cols.length-1; x++) {
    r_to = (cols[x] >> 16) & 0xFF;
    g_to = (cols[x] >>  8) & 0xFF;
    b_to = (cols[x]      ) & 0xFF;
    for (int y = 0; y < seg; y++) {
      int r, g, b;
      r = r_from + ((r_to - r_from) * (y+1)) / seg;
      g = g_from + ((g_to - g_from) * (y+1)) / seg;
      b = b_from + ((b_to - b_from) * (y+1)) / seg;
      rasters[bar++] = 0xFF000000 | (r << 16) | (g << 8) | b;
    }
    r_from = r_to;
    g_from = g_to;
    b_from = b_to;
  }
}

// creates scrollText[], which is an array of glyph lookups rather
// than ascii text
void initScrollText() {
  String text = "DYPP Sinescroller or Different Y Pixel Position scroller.";

  if (text == null) text = "no scrolltext! ";
  text = "                    " + text;
  char chrs[] = text.toCharArray();
  scrollText = new byte[chrs.length];
  for (int i = 0; i < chrs.length; i++) {
    scrollText[i] = fontLookup[chrs[i]];
  }
}

// loads the classic 16x16 font into font[]
// classic_16x16 has 46 glyphs:
//  !'(),-.:?0123456789abcdefghijklmnopqrstuvwxyz
//  http://www.flickr.com/photos/cumbrowski/sets/72157611369269727/
boolean initFont() {
  // set up the font lookup table
  // fontLookup[character] = glyph number
  fontLookup = new byte[256];
  String s = " !'(),-.:?0123456789abcdefghijklmnopqrstuvwxyz";
  char sc[] = s.toCharArray();
  for (int i = 0; i < 256; i++) fontLookup[i] = 0; // space
  for (int i = 0; i < sc.length; i++)
    fontLookup[(byte) sc[i]] = (byte) i;
  for (char c = 'A'; c <= 'Z'; c++) // also do A-Z, not just a-z
    fontLookup[c] = (byte)((int)(c-'A') + 20);

  // grab a stream of 1x16 slivers, from top to bottom, left to right.
  // every 16 of these slivers is one font glyph.
  //	DemoImage img = demoReadImage("font_classic_16x16.gif");


  //  PImage img = loadImage("titus.png");  
  PImage img = loadImage("font_classic_16x16.gif");

  int w = img.width;
  int h = img.height;
  int pix[] = img.pixels; //new int[img.pixels.length];

  int xpos = 0, ypos = 0;
  font = new short[46 * 16];
  for (int i = 0; i < font.length; i++) {
    if (xpos >= w) { 
      xpos = 0; 
      ypos += 16; 
    }
    short data = 0;

    for (short y = 0; y < 16; y++) {
      if ((pix[(ypos+y)*w + xpos] & 0xFFFFFF) != 0) data |= 1 << y;
    }
    font[i] = data;
    xpos++;
  }
  return true;
}


