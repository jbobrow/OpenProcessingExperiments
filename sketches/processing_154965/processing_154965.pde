
/*
Final sketch for Creative Coding - Monash University
The sketch is based on a poem by Hermann Hesse - Blauer Schmetterling (blue butterfly). At the beginning the text is barely visible, type in some letters and they will start to flutter about in butterfly shapes and the corresponding letters in the text will become more clearly. 
If you are tired of watching your butterflies, click the canvas. The butterflies will dissolve and the letters will head to their place in the poem. But they won't stay there for long, like the butterfly in the poem they will disappear and everything starts over. 

Ressources: 
English translation of the poem: http://thedancingrest.wordpress.com/2014/02/23/poem-of-the-day-blauer-schmetterling-blue-butterfly-by-hermann-hesse/
letter animation based on sketch by Monash University 
letter counting based on sketches from www.generative-gestaltung.de
butterfly shape: rose curve https://en.wikipedia.org/wiki/Rose_curve (a nice example can be found on www.funprogramming.org) 


 aniMode = 0
 key-input, animated characters
 
 aniMode = 1
 determine position of aniCharacters in text
 
 aniMode = 2
 aniCharacters moving towards their text-position 
 
 aniMode = 3
 text-characters vanishing
 
 => back to aniMode 0
 
*/
/* @pjs preload="Seite2.jpg"; */
PImage bgImg;  

PFont font; 
String[] poem; 

String abc = "ABCDEFGHIJKLMNOPQRSTUVWXYZÃ�ï¿½Ã�ï¿½Ã�ï¿½Ã�ï¿½1234567890,.?!"; 
int[] charCount = new int[abc.length()]; 

float yStart, xStart; 
int ySpace = 30;
int tSize = 24; 

ArrayList<AniCharacter> aniChars;
int currentCount;
int numCirclingChar = 8; 
float diamButterfly = 75; 
float mouseDist = 20; 

int aniMode = 0; 
int livingCharacters = 0; 

void setup() {
  size(500, 500); 
  background(255);  

  bgImg = loadImage("Seite2.jpg"); 

  font = createFont("Courier New Bold", 18); 
  poem = loadStrings("hesse.txt");

  textFont(font); 
  yStart = (poem.length - 5) * tSize; 
  yStart += (poem.length - 5) * (ySpace - tSize);
  yStart = yStart / 2;   

  for (int i = 0; i < abc.length (); i++) {
    charCount[i] = 0;
  }

  aniChars = new ArrayList<AniCharacter>();
}

void draw() {
  background(255);
  image(bgImg, 0, 0);

  float yPos = yStart;
  float xPos = 10; 
  float alpha = 25;  
  int cCount; 

  /* change modes */
  if (aniMode == 2 && livingCharacters <= 0) {
    livingCharacters = 0; 
    releaseAniChars();  
    aniMode = 3;
  }
  if (aniMode == 3 && livingCharacters <= 0) {
    initModeZero();
  }  

  /* display poem */
  for (int i = 0; i < poem.length; i++) {

    xStart = (width - textWidth(poem[i]) ) / 2;
    xPos = xStart; 

    for (int j = 0; j < poem[i].length (); j++) {
      textSize(tSize);

      cCount = getCharCount(poem[i].charAt(j)); 
      if (aniMode == 1 && cCount > 0) {
        setAniCharPosition(poem[i].charAt(j), xPos, yPos);
      }

      if (aniMode >= 2) { 
        alpha = 75;
      } else {
        alpha = constrain(25 + 10 * cCount, 25, 255);
      }

      fill(0, alpha);   
      text(poem[i].charAt(j), xPos, yPos);
      xPos += textWidth(poem[i].charAt(j));
    }  

    yPos += ySpace;
  }

  if (aniMode == 1) {
    aniMode = 2;
  } 

  /* animate characters */
  for (int i = 0; i < aniChars.size (); i++) {
    AniCharacter tempObj = aniChars.get(i);
    tempObj.run();
  }
}

void keyReleased() {
  /* key input only in mode 0 */
  if (aniMode == 0) {  
    if (8 == int(key) && aniChars.size() > 0) {    
      aniChars.remove(aniChars.size()-1);
      updateCharCount(key, 0);
      currentCount--;
    } else { 
      if (checkChar(key)) {
        currentCount++; 
        updateCharCount(key, 1);
        aniChars.add( new AniCharacter(random(width), random(height), key) );
      }
    }
  }
}

/* check if input is a character (we don't want an animated BLANK fly around) */
boolean checkChar(char _c) {
  String s; 
  char[] c = new char[1];

  c[0] = _c; 
  s = new String(c); 
  s = s.toUpperCase();
  c[0] = s.charAt(0); 
  int ind = abc.indexOf(c[0]);

  if (ind >= 0) {
    return true;
  } 
  return false;
}

/* count the characters */
void updateCharCount(char _c, int _action) {
  String s; 
  char[] c = new char[1];

  c[0] = _c; 
  s = new String(c);

  s = s.toUpperCase();  
  c[0] = s.charAt(0); 

  int ind = abc.indexOf(c[0]);  
  if (ind >= 0) {
    if ( _action == 1) {
      charCount[ind]++;
    } else if (charCount[ind] > 0) {
      charCount[ind]--;
    }
  }
}

int getCharCount(char _c) {
  String s; 
  char[] c = new char[1]; 
  int i; 

  c[0] = _c; 
  s = new String(c);
  c[0] = s.toUpperCase().charAt(0);
  i = abc.indexOf(c[0]);
  if (i >= 0) {
    return charCount[i];
  } else {
    return 0;
  }
}

/* determine the position of each 'animated' character in the text */
void setAniCharPosition(char _c, float _xp, float _yp) {

  for (int i = 0; i < aniChars.size (); i++) {
    AniCharacter tempObj = aniChars.get(i);
   
    if (tempObj.lxpos == -1 && tempObj.lypos == -1 ) {
      if (compareChars(tempObj.letter, _c)) {
        tempObj.setLocalPosition(_xp, _yp); 
        tempObj.letter = _c; 
        livingCharacters++; 
        i = aniChars.size();     // leave for-loop
      }
    }
  }
}

/* set starting position and velocity for the characters (start of mode 3) */
void releaseAniChars() {
  for (int i = 0; i < aniChars.size (); i++) {
    AniCharacter tempObj = aniChars.get(i);
    tempObj.setVelocity(); 
    livingCharacters++;
  }
}

/* Back to the beginning, reset variables */
void initModeZero() {
  aniMode = 0;
  livingCharacters = 0;
  aniChars.clear();  
  currentCount = 0; 

  for (int i = 0; i < abc.length (); i++) {
    charCount[i] = 0;
  }
}

boolean compareChars(char _c1, char _c2) {
  String s1, s2; 
  char[] c1 = new char[1];
  char[] c2 = new char[1];

  c1[0] = _c1;
  c2[0] = _c2;  

  s1 = new String(c1); 
  s2 = new String(c2); 
  s1 = s1.toUpperCase(); 
  s2 = s2.toUpperCase();

  return s1.equals(s2);
}

void mouseReleased() {
  if (aniMode == 0 && aniChars.size() > 0) {
    aniMode = 1;
  }
}

// AniCharacter class
//
// 
class AniCharacter {

  float x, y;
  float vx, vy;       // Velocity
  float dynamic;
  float dynamic_c;
  float size_font;  
  char letter;  
  boolean follower = false;
  boolean alive = true; 
  int number; 
  float lxpos = -1;   // x-position in the text
  float lypos = -1;   // y-position in the text 
  float px, py; 
  color blue; 

  AniCharacter(float x_, float y_, char c_) {

    x = x_;
    y = y_;
    letter = c_;
    blue = color(random(150), random(150), 255);

    size_font = 25; 
    dynamic_c = random(-0.04, 0.04);

    number = currentCount - 1; 
    if (number % (numCirclingChar + 1) != 0) {
      follower = true;
      size_font = diamButterfly / 3.5;
    }
  }

  void run() {

    switch(aniMode) {
    case 0: 
      dynamic += dynamic_c;
      vx += random(-1.5, 1.5);     
      vy += random(-1.5, 1.5);
      vx *= 0.85;
      vy *= 0.85;  
      x += vx; 
      y += vy; 

      checkWall();
      
      if (!follower) {
        if (checkMouseDist()) {
          vx += cos(-getMouseAngle()); 
          vy += sin(-getMouseAngle()); 
        }
      }
            
      visual();

      break; 

    case 2: 
      visual_2();
      break; 

    case 3: 
      if (alive) {
        visual_3();
      }
      break; 

    default: 
      break;
    }

  }

  /*
   * visual (animate the butterflies)
   */
  void visual() {
    float tx, ty; 
    float textW, ascent; 
    float k = 2; 

    textSize(size_font);
    textW =  textWidth(letter);
    ascent = textAscent() * 0.75;

    // Leader
    if (!follower) {      
      drawButterflyShape(x, y); 
      fill(blue);  
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
    } else { // Follower (circling around the butterfly-shape)            
      int leader = floor(number / (numCirclingChar+1));
      AniCharacter tempChar = aniChars.get(leader*(numCirclingChar+1));

      fill(tempChar.blue); 
      noStroke();
      pushMatrix();
      translate(tempChar.x, tempChar.y);
      tx = cos(k*dynamic) * sin(dynamic+PI/4) * diamButterfly; 
      ty = cos(k*dynamic) * cos(dynamic+PI/4) * diamButterfly + ascent/2; 
      text(letter, tx, ty);  
      popMatrix();
    }
  }

  /*
   * visual aniMode 2 -> fly to your text-position 
   */
  void visual_2() {  
    textSize(tSize);
    fill(blue, 150);  
    px = lerp(px, lxpos, 0.05);
    py = lerp(py, lypos, 0.05);
    text(letter, px, py);

    if (abs(px - lxpos) < 0.001 && abs(py - lypos) < 0.001) {
      livingCharacters--;
    }
  }    

  /*
   * visual aniMode 3 -> vanish 
   */
  void visual_3() {  
    x += vx; 
    y += vy; 

    fill(blue);     
    textSize(tSize);     
    text(letter, x, y); 

    if ( (x < 0 || x > width) && (y < 0 || y > height) ) {
      alive = false; 
      livingCharacters--;
    }
  }

  /* draw the butterfly shape around the leader */
  void drawButterflyShape(float _x, float _y) {
    float tx, ty;
    float k = 2; 

    fill(blue, 75);
    noStroke(); 

    pushMatrix();
    translate(_x, _y);
    beginShape();
    for (float angle = 0; angle <= PI*3; angle += 0.05) {
      tx = cos(k*angle) * sin(angle+PI/4) * diamButterfly; 
      ty = cos(k*angle) * cos(angle+PI/4) * diamButterfly;
      vertex(tx, ty);
    }
    endShape(CLOSE);
    popMatrix();
  }

  void setLocalPosition(float _lxpos, float _lypos) {
    lxpos = _lxpos; 
    lypos = _lypos; 
    px = x; 
    py = y;
  } 

  /* set starting position and velocity for vanishing characters */ 
  void setVelocity() {
    float direction; 

    x = lxpos; 
    y = lypos; 
    size_font = tSize;

    vx = random(2, 4);
    direction = random(1); 
    if (direction > 0.5) {
      vx *= -1;
    } 
    vy = random(2, 4); 
    direction = random(1); 
    if (direction > 0.5) {
      vy *= -1;
    }
  }

  void checkWall() {
    float r = diamButterfly; 

    if (x < r) {
      x = r; 
      vx *= -1;
    }
    if (x > width-r) {
      x = width-r; 
      vx *= -1;
    }
    if (y < r) {
      y = r; 
      vy *= -1;
    }
    if (y > height-r) {
      y = height-r; 
      vy *= -1;
    }
  }
  
  boolean checkMouseDist() {
    float d = dist(x, y, mouseX, mouseY); 
    if (d <= mouseDist + diamButterfly/2) {
      return true;
    } 
    return false;
  }  

  float getMouseAngle() { 
    float angle = atan2(mouseY - y, mouseX - x);
    return angle;
  }
}



