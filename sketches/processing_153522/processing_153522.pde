
/*
 * Creative Coding
 * Week 5, 05 - A tribute not for the words but the letters
 * Based on w5_05 by Indae Hwang and Jon McCormack
 *
 * This sketch creates a simple agent-based simulation using text and objects
 * The sketch reads in characters from the keyboard and dynamically creates
 * new objects for each character.
 *
 * Font attributions:
 * Archistico http://www.1001freefonts.com/designer-archistico-fontlisting.php
 * Lancelot http://www.1001freefonts.com/designer-marion-kadi-fontlisting.php
 * Lisbon Script http://www.1001freefonts.com/designer-mario-arturo-fontlisting.php
 * Ubuntu http://font.ubuntu.com/ufl
 */
 /* @pjs font="data/Lancelot-Regular.ttf, data/Archisto_Bold.ttf, data/Lisbon-Script.otf, data/Ubuntu-C.ttf"; */
 /* @pjs font="Lancelot-Regular.ttf, Archisto_Bold.ttf, Lisbon-Script.otf, Ubuntu-C.ttf"; */
ArrayList<AniCharacter> aniChars;

PFont sansFont;
PFont serifFont;
PFont calFont;
PFont novelFont;
int w, h, tl, tr, bl, br;


int currentCount;

void setup() {
  size(700, 700);
  novelFont = createFont("Archistico", 100);
  calFont = createFont("Lisbon Script", 100);
  serifFont = createFont("Lancelot", 100);
  sansFont = createFont("Ubuntu Condensed", 100);

  aniChars = new ArrayList<AniCharacter>();
  aniChars.add( new AniCharacter(random(width), random(height), 't') );
  aniChars.add( new AniCharacter(random(width), random(height), 'y') );
  aniChars.add( new AniCharacter(random(width), random(height), 'p') );
  aniChars.add( new AniCharacter(random(width), random(height), 'e') );

  w = width/2;
  h = height/2;
  tl = 1;
  tr = 0;
  bl = 0;
  br = 1;
  smooth(8); // enable antialiasing
}

void draw() {
  if (frameCount%360 == 0) {
    tl = 1 - tl;
    tr = 1 - tr;
    bl = 1 - bl;
    br = 1 - br;
  }
  renderbg();
  for (int i = aniChars.size ()-1; i >= 0; i--) {
    AniCharacter tempObj = aniChars.get(i);
    tempObj.run(); // run each char
  }
}

void keyReleased() {
  if (debug) println(keyCode);
  if (8 == int(key) && aniChars.size() > 0) {
    if (debug) println("last deleted, glyph total ",aniChars.size()-1);
    aniChars.remove(aniChars.size()-1);
  } else if ((key >= 48) && (key <= 126)) {
    aniChars.add( new AniCharacter(random(width), random(height), key) );
    if (debug) println("added glyph \""+key+"\" glyph total "+(aniChars.size()-1));
  }
}

void renderbg() {
  fill(255*(1-tl));
  rect(0, 0, w, h);
  fill(255*(1-tr));
  rect(w, 0, w, h);
  fill(255*(1-bl));
  rect(0, h, w, h);
  fill(255*(1-br));
  rect(w, h, w, h);
}

boolean debug = false;
void keyPressed() {
  if (key == TAB) debug = !debug;
  if (key == CODED && keyCode == DOWN) saveFrame("typotribute##.png");
}

// AniCharacter class
//
// 
class AniCharacter {

  float x, y;
  float nOff_x;
  float nOff_y;
  float size_font;
  char letter;
  float phase_shift;

  AniCharacter(float x_, float y_, char c_) {
    x = x_;
    y = y_;
    nOff_x = random(3000);
    nOff_y = random(30000);
    letter = c_;
    size_font = random(100, 200);
    phase_shift = random(0, 360);
  }

  void run() {
    // speed of motion
    nOff_x += 0.005;
    nOff_y += 0.005;

    x = width*noise(nOff_x);
    y = height*noise(nOff_y);
    render();
  }

  void render() {
    float text_w =  textWidth(letter);
    float ascent = textAscent() * 0.75;
    if ( x < w && y < h) {
      fill(255*tl);
      textFont(serifFont);
    }
    if ( x > w && y < h) {
      fill(255*tr);
      textFont(novelFont);
    }
    if ( x < w && y > h) {
      fill(255*bl);
      textFont(calFont);
    }
    if ( x > w && y > h) {
      fill(255*br);
      textFont(sansFont);
    }
    textSize(size_font);
    float tx = x-text_w/2;
    float ty = y+ascent/2;
    float angle = radians(millis()/4) + phase_shift;
    tx = tx + 120*cos(angle);
    ty = ty + 100*sin(angle);
    text(letter, tx, ty);
    if (debug) {
      fill(255, 0, 0);
      ellipse(tx, ty, 5, 5);
      fill(0, 255, 0);
      ellipse(x, y, 5, 5);
    }
  }
}



