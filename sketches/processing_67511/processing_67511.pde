
PFont Century;
PFont Futura;
PFont Times84;
PFont Times;
PFont Times48;
PFont actualFont;
PFont Arial;
PFont Arial84;
PFont Arial48;
PFont Baskerville;
String[] latin = {
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
};
String[] hebrew = {
  "א", "ב", "ג", "ד", "ה", "ו", "ז", "ח", "ט", "י", "כ", "ל", "מ", "נ", "ס", "ע", "פ", "צ", "ק", "ר", "ש", "ת"
};
int counter = 0; // letter counter
int letterCounterLatin = 0;
int letterCounterHebrew = 0;

int sizeTimes = 62;
int sizeArial = 62;

void setup() {
  size(800, 800);
  background(255);
  noStroke();
  smooth();
  colorMode(100, 100, 100, 100);
  Times = loadFont("Times-Roman-62.vlw");
  Times84 = loadFont("Times-Roman-84.vlw");
  Times48 = loadFont("Times-Roman-48.vlw");
  Arial = createFont("ArialHB", 62, true);
  Arial48 = createFont("ArialHB", 48, true);
  Arial84 = createFont("ArialHB", 84, true);
}

//-----------------
void draw() {
  checkMouse();
  smooth();
}
//----------------


//-----------------  
void checkMouse() {
  if (mousePressed) {

    if (mouseButton == LEFT) {   
      println("LEFT CLICK");

      textFont(Times, sizeTimes);
      text(latin[ counter % latin.length], mouseX, mouseY);
      fill(random(0, 100)); // drawing line with latin alphabet
    }

    if (mouseButton == RIGHT) {
      println("RIGHT CLICK");

      textFont(Arial, sizeArial);
      text(hebrew[counter % hebrew.length], mouseX, mouseY);
      fill(random(0, 100)); // drawing line with hebrew alphabet
    }
  }
}
//----------------- 


//----------------- 
void keyPressed() {
  if ( keyCode == DOWN ) {
    println("DOWN");
    sizeTimes = 48;
  }   

  if (keyCode == UP) {
    println("UP");
    sizeTimes = 84;
  }

  if ( keyCode == SHIFT ) {
    println("SHIFT");
    sizeTimes = 62;
  }

  if ( keyCode == LEFT ) {
    println("LEFT");
    sizeArial = 48;
  }   

  if (keyCode == RIGHT) {
    println("RIGHT");
    sizeArial = 84;
  }
  
    if ( keyCode == ALT ) {
    println("ALT");
    sizeArial = 62;
  }
}
//----------------- 


//----------------- 
void mouseReleased() {
  counter++;
}
//----------------- 


