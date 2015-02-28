
PFont words = createFont("SansSerif", 12);
int heartNum = 30;
Heart [] h = new Heart[heartNum];
int textA [] = new int[225];
int textVA [] = new int[225];
//
int page = 0;
String [] thing = {
  "W", "H", "G", "A", "C", "Y", "E", "M", "H", "R", "D", "V", "M", "E", "U", 
  "Y", "B", "I", "N", "Y", "U", "J", "S", "D", "L", "A", "D", "A", "Y", "X", 
  "W", "O", "N", "U", "I", "O", "Z", "G", "P", "L", "C", "Y", "N", "L", "A", 
  "G", "C", "U", "S", "J", "Z", "A", "N", "E", "G", "J", "P", "I", "A", "A", 
  "O", "Q", "T", "D", "V", "I", "A", "N", "M", "Q", "J", "P", "V", "V", "E", 
  "J", "W", "E", "I", "J", "V", "T", "M", "A", "A", "Z", "A", "E", "V", "M", 
  "E", "X", "H", "S", "K", "I", "A", "Y", "A", "E", "V", "H", "O", "L", "X", 
  "V", "P", "F", "K", "N", "X", "T", "X", "E", "J", "D", "L", "N", "M", "O", 
  "R", "S", "M", "E", "W", "Z", "J", "A", "X", "A", "D", "L", "V", "D", "M", 
  "Q", "W", "S", "J", "V", "O", "G", "Y", "D", "V", "F", "B", "K", "Q", "G", 
  "U", "U", "V", "W", "O", "T", "J", "I", "M", "N", "W", "Q", "D", "T", "Q", 
  "C", "T", "N", "A", "N", "I", "T", "S", "I", "R", "H", "C", "A", "T", "O", 
  "F", "P", "I", "Q", "V", "K", "K", "X", "M", "O", "B", "W", "R", "D", "G", 
  "G", "N", "W", "F", "A", "M", "I", "Y", "W", "C", "E", "R", "E", "C", "G", 
  "D", "O", "K", "W", "E", "A", "O", "F", "Z", "I", "R", "V", "P", "Q", "M"
};
int goIt = 0;
color [] boxC = new color[225];
int colorIt = 0;
String wholeWord = "";
int cantSelect [] = new int[225];
//
String [] answers = {
  "AMAZING", "DAY", "VALENTINES", "ARE", "HAPPY", "YOU", "CHRISTINA", "LOVE"
};
color [] answerC = new color [8];


void setup() {
  size(720, 1192);
  for (int i = 0;i<heartNum;i++)
    h[i] = new Heart();
  for (int i = 0;i<225;i++) {
    boxC[i] = #FF2991;
    cantSelect[i] = 0;
    textA[i] = 255;
    textVA[i] = 5;
  }
  for (int i = 0;i<8;i++)
    answerC[i] = #FFFFFF;
  //0.
}

void draw() {
  background(#FF2991);
  if (page == 0) {
    mainPage();
  }
  else if (page == 1) {
    letter();
  }
  else if (page == 2) {
    game();
  }
}

void game() {
  textFont(words, 25);
  textAlign(LEFT);
  for (int i = 0;i<thing.length;i++) {    
    if (goIt == 1) {
      if (mouseX>(27+45*(i%15)) && mouseX<(27+45*(i%15))+25 && mouseY>177+45*(i/15) && mouseY<177+45*(i/15)+25 && cantSelect[i] == 0) {
        boxC[i] = #FF0000;
        cantSelect[i] = 1;
        wholeWord+=thing[i];
      }
    }
    else {
      cantSelect[i] = 0;
      boxC[i] = 255;
    }
  }

  for (int i = 0;i<225;i++) {
    if (colorIt ==1)
      boxC[i] = #FF0000;
    fill(boxC[i]);
    rect(27+45*(i%15), 177+45*(i/15), 45, 45);
    fill(0);
    text(thing[i], 30+45*(i%15), 200+45*(i/15));
  }
  for (int i = 0;i<8;i++) {
    fill(answerC[i]);
    textFont(words, 30);
    text(answers[i], 30+200*(i%3), 1000+45*(i/3));
  }
}

void letter() {
  textAlign(LEFT);
  fill(255);
  textFont(words, 20);
  text("Dear Christina,\n\nYou are the most amazing girl i've ever met. You are funny, smart, beautiful,\nand most of all you make me extremely happy. Not a day goes by where I\ndon't think about you or where I don't miss you. Whenever i'm not with you I\nmiss you, and when I'm not with you all I do is think about you. When I think\nabout you I just want to be with you. And finally when i'm with you it's like all\nmy dreams have come true. I know that might've sound really corny but it's\ntrue. You mean everything to me, so much that there aren't enough days in\nforever for me to fully express the depth of my love for you(CORNY).\nI know we don't go out and this might seem a little but too much, but I really\ndo love you and you deserve the best.\nI love how huge your head is and how you have happy eyes. I am very excited\nthat I converted you to christianity hahaha. Sometimes my grandma misses you\nmore than I do. Even though I call you a loser all the time(even though you\nare), you're still an amazing person and I wish I can be just like you :(. ", 5, 40);
}

void mainPage() {
  for (int i = 0;i<heartNum;i++)
    h[i].drawHearts();
  textFont(words, 120);
  text("Christina!", width/2, 430);
  fill(255);
  textFont(words, 120);
  textLeading(100);
  textAlign(CENTER);
  text("Happy\nValentine's\nDay", width/2, 120);
  textFont(words, 15);
  fill(255, textA[0]);
  textA[0]-=textVA[0];
  if (textA[0]<=75)
    textVA[0]*=-1;
  else if (textA[0]>=255)
    textVA[0]*=-1;
  text("touch screen!", width/2, 700);
}

class Heart {
  float x, y, vy, a;
  int base = 400;
  Heart() {
    y = (float)random(base);
    x=140+(float)random(width-280);
    vy = 3+(float)random(2);
  }

  void drawHearts() {
    if (y<=-(20+(float)random(100))) {
      y = base+(-10+(float)random(20));
      x=140+(float)random(width-280);
      vy = 3+(float)random(2);
    }
    y-=vy;
    noStroke();
    fill(#FF033E);
    triangle(x, y, x-8, y-15, x+9, y-15);
    ellipse(x-3.5, y-15, 10, 10);
    ellipse(x+3.5, y-15, 10, 10);
  }
}

void mousePressed() {
  if (page == 0 || page == 1)
    page++;
 
  if (page == 2) {
    goIt = 1;
  }
}

void mouseReleased() {
  println("wholeword: " + wholeWord.length() + " answers: " + answers[5].length());
  println(((String)(wholeWord)) == (String)answers[5]);
  for (int i = 0;i<8;i++) {
    if (wholeWord.equals(answers[i])) {
      println("good job");
      answerC[i] = #00FF00;
    }
  }
  wholeWord = "";
  goIt = 0;
}



