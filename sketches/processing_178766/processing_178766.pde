
import ddf.minim.*;

//First of all, sorry if I have some misspellings, english is not my first language
//Exercise: Urumi's PC Mini Piano
/*
I tried to make an interactive mini piano using some images created in Photoshop
 and tones created in Audacity.
 The original image in public domain (I modified it) can be found in: 
 http://upload.wikimedia.org/wikipedia/commons/0/03/Middle_C.png
 I used, for each tone, the frecuencies founded in:
 http://jetcityorange.com/musical-notes/
 */

//Instructions
/*
 You can use it just following the next steps:
 1.  Select the note you want to play pressing the following keys:
 1 for middle C (DO)
 2 for D (RE)
 3 for E (MI)
 4 for F (FA)
 5 for G (SOL)
 6 for A (LA)
 7 for B (SI)
 8 for D5 (Major DO)
 2.  The program will show a related image in a pentagram.
 3.  If you want to return to the instructions, just press the Backspace or Delete key.
 4.  If you want to save a snapshot, just press the s/S key.
 5.  If you want to know more about the program, press ENTER
 Note: you can mix the different sounds just pressing different "permited" numbers but
 the frecuency can be combined resulting another tone.
 Enjoy!
 */

Minim minim;
AudioSample c;
AudioSample re;
AudioSample mi;
AudioSample fa;
AudioSample sol;
AudioSample la;
AudioSample si;
AudioSample do1;

//Images creation
PImage C;
PImage D;
PImage E;
PImage F;
PImage G;
PImage A;
PImage B;
PImage C1;

//setup  block
void setup() {
  minim=new Minim(this);
  c=minim.loadSample("do.wav");
  re=minim.loadSample("re.wav");
  mi=minim.loadSample("mi.wav");
  fa=minim.loadSample("fa.wav");
  sol=minim.loadSample("sol.wav");
  la=minim.loadSample("la.wav");
  si=minim.loadSample("si.wav");
  do1=minim.loadSample("do#.wav");
  size(539, 252);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(316, 71, 79);  //Establishing Background
  fill(29, 14, 97);

  //Writing the instructions
  textFont(createFont("Arial", 20, true), 20);    
  textAlign(CENTER);
  text("Urumi's PC Mini Piano", 270, 22);
  textFont(createFont("Arial", 14, true), 14);    
  textAlign(LEFT);
  text("I had a mini piano when I was a child... Now I have a mini piano made for me!.", 10, 40);
  text("s/S: save a snapshot", 10, 57);
  text("1: plays DO (C4 or middle C)", 10, 72);
  text("2: plays RE (D4)", 10, 89);
  text("3: plays MI (E4)", 10, 106);
  text("4: plays FA (F4)", 10, 123);
  text("5: plays SOL (G4)", 10, 140);
  text("6: plays LA (A4)", 10, 157);
  text("7: plays SI (B4)", 10, 174);
  text("8: plays MAJOR DO (C5)", 10, 191);
  text("DELETE/BACKSPACE: return to the instructions", 10, 208);
  text("ENTER: About PC Mini Piano", 10, 225);
  text("Let's gonna play!!", 10, 242);

  //Loading the images
  A=loadImage("A.png");
  B=loadImage("B.png");
  C=loadImage("C.png");
  D=loadImage("D.png");
  E=loadImage("E.png");
  F=loadImage("F.png");
  G=loadImage("G.png");
  C1=loadImage("C#.png");
}

void draw() {
  pushMatrix();
  popMatrix();
}

void keyPressed() {
  if (key==ENTER) {
    background(316, 71, 79);  //Establishing Background
    textFont(createFont("Arial", 24, true), 24);    
    textAlign(CENTER);
    text("Urumi's PC Mini Piano", 270, 50);
    textFont(createFont("Arial", 15, true), 15);    
    textAlign(LEFT);
    text("Program created by: Urumi", 8, 100);
    text("Date: 2014/12/19", 8, 125);
    text("Sounds created by: Urumi", 8, 150);
    text("Images created by: Urumi", 8, 175);
    text("Sounds frecuency information: http://jetcityorange.com/musical-notes/", 8, 200);
    text("Base image: http://upload.wikimedia.org/wikipedia/commons/0/03/Middle_C.png", 8, 225);
    text("(public domain)", 8, 240);
  }
  if (key==DELETE || key==BACKSPACE) {  //Clear the sketch
    background(316, 71, 79);  //Establishing Background
    textFont(createFont("Arial", 20, true), 20);    
    textAlign(CENTER);
    text("Urumi's PC Mini Piano", 270, 22);
    textFont(createFont("Arial", 14, true), 14);    
    textAlign(LEFT);
    text("I had a mini piano when I was a child... Now I have a mini piano made for me!.", 10, 40);
    text("s/S: save a snapshot", 10, 57);
    text("1: plays DO (C4 or middle C)", 10, 72);
    text("2: plays RE (D4)", 10, 89);
    text("3: plays MI (E4)", 10, 106);
    text("4: plays FA (F4)", 10, 123);
    text("5: plays SOL (G4)", 10, 140);
    text("6: plays LA (A4)", 10, 157);
    text("7: plays SI (B4)", 10, 174);
    text("8: plays MAJOR DO (C5)", 10, 191);
    text("DELETE/BACKSPACE: return to the instructions", 10, 208);
    text("ENTER: About PC Mini Piano", 10, 225);
    text("Let's gonna play!!", 10, 242);
  }
  if (key=='s' || key=='S') saveFrame("screenshot.png");  //Saving a snapshot
  if (key=='1') {  //Showing little rectangles
    image(C, 0, 0);  
    c.trigger();
  }
  if (key=='2') {  //Showing bigger rectangles
    image(D, 0, 0);
    re.trigger();
  }
  if (key=='3') {  //Showing horizontal bars
    image(E, 0, 0);
    mi.trigger();
  }
  if (key=='4') {  //Showing vertical bars
    image(F, 0, 0);
    fa.trigger();
  }
  if (key=='5') {  //Showing vertical bars
    image(G, 0, 0);
    sol.trigger();
  }
  if (key=='6') {  //Showing vertical bars
    image(A, 0, 0);
    la.trigger();
  }
  if (key=='7') {  //Showing vertical bars
    image(B, 0, 0);
    si.trigger();
  }
  if (key=='8') {  //Showing vertical bars
    image(C1, 0, 0);
    do1.trigger();
  }
}


