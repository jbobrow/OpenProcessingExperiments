
// test drawing program
// not exactly sure what this program will do drawing wise
// but its an attempt to allow you to create color squares
// based off the location of the mouse.

void setup() {
size(600,600);
background(24,55,67);
noStroke();
colorMode(RGB); //added to attempt to fix color issue when posted online.
}


void draw() {
}
// draw function must exist.


// beginning of keystroke input functions.
void keyPressed() {
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      fill(87,25,155);
    }
  } else {
  }
  rect(mouseX,mouseY,8,8);
// above is B key color info
{ if (keyPressed) {
  if (key == 'a' || key == 'A') {
    fill(245,106,215);
  }
} else {
}
rect(mouseX,mouseY,10,10); // creates 10x10 pixel box upon letter/mouse click.
}
// above is A key color info 

{ if (keyPressed) {
  if (key == 'c' || key == 'C') {
    fill(35,155,250);
  }
} else {

}
rect(mouseX,mouseY,5,5);
}
// above is C key color info

{ if (keyPressed) {
  if (key == 'd' || key == 'D') {
    fill(67,58,198);
  }
} else {

}
rect(mouseX,mouseY,5,5);
}
// above is D key color info

{ if (keyPressed) {
  if (key == 'e' || key == 'E') {
    fill(130,198,58);
  }
} else {
}
}
// above is E key code.

{ if (keyPressed) {
  if (key == 'f' || key == 'F') {
    fill(240,245,106);
  }
} else {
}
}
// above is F key code

{ if (keyPressed) {
  if (key == 'g' || key == 'G') {
    fill(250,57,35);
  }
} else {
}
}
// above is G key code. 

{ if (keyPressed) {
  if (key == 'h' || key == 'H') {
    fill(100,99,7);
  }
} else {
}
}
// above is H key code.

{ if (keyPressed) {
  if (key == 'i' || key == 'I') {
    fill(33,54,17);
  }
} else {
}
}
// above is I key code.

{ if (keyPressed) {
  if (key == ' ' || key == ' ') {
    background(random(50,255));
  }
} else {
}
}
// above is spacebar. creates random grey background color.
{ if (keyPressed) {
  if (key == 'r' || key == 'R') {
    fill(100,99,99);
  }
} else {
}
}
// above is r key. attempt at random movement.
{ if (keyPressed) {
  if (key == 'p' || key == 'P') {
    fill(100,99,99);
  }
} else {
}
}
// above is p code. creates weird background color on initial
// startup of program. unsure of solution.

{ if (keyPressed) {
  if (key == 'o' || key == 'O') {
    fill(30,30,30);
  }
} else {
}
}
// above code is for O key.

{ if (keyPressed) {
  if (key == 'u' || key == 'U') {
    fill(46,146,242);
  }
} else {
}
}
// above code is for u key.

{ if (keyPressed) {
  if (key == 'y' || key == 'Y') {
    fill(15,240,140);
  }
} else {
}
}
// above code is for y key.

{ if (keyPressed) {
  if (key == 't' || key == 'T') {
    fill(15,87,240);
  }
} else {
}
}
// above code is for t key.
{ if (keyPressed) {
  if (key == 'w' || key == 'W') {
    fill(89,2,178);
  }
} else {
}
}
// above code is for w key.
{ if (keyPressed) {
  if (key == 'q' || key == 'Q') {
    fill(165,122,122);
    beginShape();
    vertex(mouseX,mouseY,2,2);
    endShape();
  }}}
// above is Q key. does not start vertex
{ if (keyPressed) {
  if (key == 'z' || key == 'Z') {
    fill(80,79,77);
    beginShape();
    line(mouseX,mouseY,2,2);
    endShape();
  }}}
// above is Z key code
{ if (keyPressed) {
  if (key == 'x' || key == 'X') {
    fill(113);
  }}}
// above is x key code
{ if (keyPressed) {
  if (key == 'v' || key == 'V') {
    fill(147,121,18);
  }}}
// above is V key code
{ if (keyPressed) {
  if (key == 'n' || key == 'N') {
    fill(167,6,203);
  }}}
// above is N key code
{ if (keyPressed) {
  if (key == 'm' || key == 'M') {
    fill(160,23,91);
  }}}
// above is M key code
{ if (keyPressed) {
  if (key == 'j' || key == 'J') {
    fill(42,209,71);
  }}}
// above is J key code
{ if (keyPressed) {
  if (key == 'k' || key == 'K') {
    fill(90,135,203);
  }}}
// above is K key code
{ if (keyPressed) {
  if (key == 'l' || key == 'L') {
    fill(26,201,156);
  }}}
// above is L key code
{ if (keyPressed) {
  if (key == '3' || key == '#') {
    ellipse(random(1,130),random(155,600),random(90,110),random(80,123));
  }}}
// above is 3 key code. places ellipse on screen.
{ if (keyPressed) {
  if (key == '1' || key == '!') {
      ellipse(random(300,600),random(100,450),random(250,330),random(30,90));
  }}}
// above is 1 key code
{ if (keyPressed) {
  if (key == '2' || key == '@') {
      ellipse(random(50,400),random(50,200),random(0,20),random(40,30));
  }}}
// above is 2 key code.
{ if (keyPressed) {
  if (key == '4' || key == '$') {
      rect(random(0,600),random(0,430),random(0,200),random(0,30));
  }}}
  { if (keyPressed) {
  if (key == '5' || key == '%') {
      ellipse(random(30,500),random(200,500),random(0,50),random(20,50));
  }}}
  { if (keyPressed) {
  if (key == '6' || key == '^') {
      arc(random(0,400),random(100,430),30,30,0, HALF_PI);
  }}}
      
// DO NOT DELETE LINE BELOW
}
// DO NOT DELETE LINE ABOVE
// ends void keyPressed function.
/*{
PFont baskerville;
// The font "Baskervillecopy.ttc" must be located in the 
// current sketch's "data" directory to load successfully
baskerville = loadFont("Baskervillecopy.ttc");
textFont(baskerville, 32);
text("word", 10, 50);
}
tried to get text to work in app. cannot load font.
*/ 

// start of mousePressed function
void mousePressed() {
  rect(mouseX,mouseY,40,48);
}
