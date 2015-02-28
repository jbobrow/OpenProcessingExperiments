
//epigraph: timed text
String[] maltese;
int idx;

//phone records text
String[] oArray = {
  "[sudden silence]", " 'today, tomorrow. . .years between' "," 'they hung up' "
};
String[] cArray = {
  " 'the nearest liquor store?' "," 'twelve dozen white roses--no, I did not misspeak' "," 'just missing my joie de vivre' "
};
String[] hArray = {
  " 'pressed and starched--doesn't matter' "," 'new towels, all new towels' "," 'of course that's not blood' "
};
String[] rsArray = {
  " 'being robbed made me hungry' "," 'extra sauce' "," 'The kitchen's already closed?' "
};
String txt;

//timer
int startTime;
int currentTime;
int elapsedTime;

//images
PImage dial;

//fonts
PFont font1;
PFont font2;
PFont font3;
PFont font4;

void setup() {
  startTime = millis();
  size(620,400);
  background(0);
  frameRate(.45);
  font1 = loadFont("Courier-30.vlw");
  font2 = loadFont("EngraversMT-50.vlw");
  font3 = loadFont("EdwardianScriptITC-50.vlw");
  font4 = loadFont("Apple-Chancery-50.vlw");
  maltese = loadStrings("litrHw2.txt");
  dial = loadImage("dialnew.jpg");
  idx = 0;
  txt = "";
}

//dial 0
void playOperatorText() {
  int txtIdx = (int)random(0,oArray.length);
  txt = oArray[txtIdx];
}
//dial 1
void playConciergeText() {
  int txtIdx = (int)random(0,cArray.length);
  txt = cArray[txtIdx];
}
//dial 2
void playHkText() {
  int txtIdx = (int)random(0,hArray.length);
  txt = hArray[txtIdx];
}
//dial 3
void playRoomsText() {
  int txtIdx = (int)random(0,rsArray.length);
  txt = rsArray[txtIdx];
}

void mousePressed() {
  if ((elapsedTime >= 29) && (mouseX <= 510 && mouseX >= 400 && mouseY >= 350)) playOperatorText();
  if ((elapsedTime >= 29) && (mouseX <= 520 && mouseX >= 445 && mouseY < 80)) playConciergeText();
  if ((elapsedTime >= 29) && (mouseX <= 455 && mouseX >= 375 && mouseY < 75)) playHkText();
  if ((elapsedTime >= 29) && (mouseX <= 370 && mouseX >= 250 && mouseY < 78)) playRoomsText();
}

void draw() {
  currentTime = millis();
  elapsedTime = (currentTime - startTime)/1000;
  println("elapsedTime: " + elapsedTime);
  if (elapsedTime <= 18) {     
    background(100); 
    //epigraph  
    if (idx < maltese.length) {
      textFont(font1,15);
      textAlign(RIGHT);
      fill(140);
      smooth();
      text( maltese[idx],width/2,height/2);
      idx++;
    }
  }
  //transition and first screen
  if ((elapsedTime > 18) && (elapsedTime <=20)) {
    background(0);
  }
  if ((elapsedTime > 20) && (elapsedTime <= 23)) {
    background(224,221,115);
    textFont(font2,45);
    textAlign(CENTER);
    fill(0);
    text("HOTEL WM. PETER",width/2,height/2);
    smooth();
  }
  //second screen
  if ((elapsedTime > 23) && (elapsedTime <=25)) {
    background(224,221,115);
    textFont(font2,35);
    textAlign(CENTER);
    fill(0);
    text("Enjoy your stay.",width/2,height/2);
    smooth();
  }
  //third screen - Guestbook 
  if ((elapsedTime > 25) && (elapsedTime < 29)) {
    frameRate(1);
    background(247,245,225);
    textFont(font2, 20);
    fill(50);
    text("Date",200,100);
    text("Name",400,100);
    text("Guestbook",width/2,50);
    textFont(font4,15);
    fill(0);
    text("5-6 March",200,150);
    text("de Vere, Mrs. Florence",400,150);
    text("6-15 March",200,200);
    text("Malone, Miss Delilah",400,200);
    text("15-19 March",200,250);
    text("Fisher, Det. Harold",400,250);
    text("19 March",200,300);
    textFont(font4,18);
    fill(183,37,37);
    text("Trophonios, Mr. Alexander",400,300);
    smooth();
  }
  //fourth screen - phone
  if (elapsedTime >= 29) {
    background(149,116,42); 
    imageMode(CENTER);
    image(dial,400,height/2);
    textFont(font2,15);
    fill(0);
    text("The phone records of",8,20,150,200);
    text("A. Trophonios",8,50,150,200);
    textFont(font2,13);
    fill(200);
    text("Dial 0 for the Operator, 1 for the Concierge, 2 for Housekeeping, and 3 for Room Service.",8,90,150,200);
    textFont(font1,18);
    fill(0);
    text(txt,30,230,110,185);
    smooth();
  }
}


