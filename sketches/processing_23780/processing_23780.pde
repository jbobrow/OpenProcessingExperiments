

PFont font;        // font variable
PFont font2;

String lyric1 = "I turn sideways to the sun";
String lyric2 = "keep my thoughts from everyone.";
String lyric3 = "It's a jungle,";
String lyric4 = "I'm a freak.";
String lyric5 = "Hear me talk,";
String lyric6 = "but never speak.";    
String attr = "Bernard Sumner";

int a = 300;
int b = 150;

void setup() 
{  
  size(640, 480);
  background(120); 
  font = loadFont("BaileySansITCTT-Book-20.vlw");     // create a font object
  font2 = loadFont("BaileySansITCTT-BookItalic-42.vlw");     // create a font object
}

void draw() {
  background(120);
  textLeading(20);
  
    // First Section
    if(mouseX < 240 && mouseY < 175 ) {
      background(223, 240, 46);
      fill(46, 66, 240);
      textAlign(RIGHT);
      textFont(font);
      text(lyric1, mouseX, mouseY, a, a); // defines a box
    }
    if(mouseX > 240 && mouseY < 175 ) {
      background(240, 179, 46);
      fill(197, 46, 240);
      fill(255);
      textAlign(LEFT);
      textFont(font2);
      text(lyric2, mouseX, mouseY, a, a); // defines a box
    }
    
    
    // Second Section
    if(mouseX < 240 && mouseY > 175 && mouseY < 300) {
      background(240, 46, 143);
      fill(46, 240, 105);
      textAlign(RIGHT);
      textFont(font);
      text(lyric3, mouseX, mouseY, b, b); // defines a box
    }
    if(mouseX > 240 && mouseY > 175 && mouseY < 300) {
      background(46, 225, 240);
      fill(240, 46, 46);
      textAlign(LEFT);
      textFont(font2);
      text(lyric4, mouseX, mouseY, a, b); // defines a box
    }


    // Third Section
    if(mouseX < 240 && mouseY > 300) {
      background(240);
      fill(0);
      textAlign(RIGHT);
      textFont(font);
      text(lyric5, mouseX, mouseY, b, b); // defines a box
    }
    
    if(mouseX > 240 && mouseY > 300) {
      background(25);
      fill(240);
      textAlign(LEFT);
      textFont(font2);
      text(lyric6, mouseX, mouseY, a, b); // defines a box
    }
 
}
