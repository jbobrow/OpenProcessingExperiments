


import processing.opengl.*;
int NUM = 12;
Line ln;
Line lns[];
PFont myFont1;
PFont myFont2;

void keyPressed() {
  save("sample.png");
}


String words[] = {

  "この作品のコンセプトは『言いたい事は冷静に』です。この作品のコンセ", 
  "プトは『言いたい事は冷静に』です。この作品のコンセプトは『言いたい", 
  "事は冷静に』です。この作品のコンセプトは『言いたい事は冷静に』です。", 
  "この作品のコンセプトは『言いたい事は冷静に』です。この作品のコンセ", 
  "プトは『言いたい事は冷静に』です。この作品のコンセプトは『言いたい", 
  "事は冷静に』です。この作品のコンセプトは『言いたい事は冷静に』です。", 
  "この作品のコンセプトは『言いたい事は冷静に』です。この作品のコンセ", 
  "プトは『言いたい事は冷静に』です。この作品のコンセプトは『言いたい", 
  "事は冷静に』です。この作品のコンセプトは『言いたい事は冷静に』です。", 
  "この作品のコンセプトは『言いたい事は冷静に』です。この作品のコンセ", 
  "プトは『言いたい事は冷静に』です。この作品のコンセプトは『言いたい", 
  "事は冷静に』です。この作品のコンセプトは『言いたい事は冷静に』です。", 


};



void setup() {
  
  smooth();
  size(1024, 768, OPENGL);

  background(0);

  lns = new Line[NUM];

  myFont1 = createFont("ヒラギノ角ゴ pro", 48);
  myFont2 = createFont("小塚ゴシック pro", 48);
}


void draw() {

  background(0);  
  jitabata();

  translate(70, 225, 0);

  textFont(myFont1, 1.0);
  fill(180);


  for (int i = 0; i < NUM; i++) {

    ln = new Line(words[i], 0, i * 41);
    lns[i] = ln;
  }

  rotateY(0.0);

  for (int i = 0; i < NUM; i++) {
    float f1 = sin((i + 1.0) * (millis() / 1000.0) * TWO_PI);
    float f2 = sin((NUM - i) * (millis() / 1000.0) * PI);

    Line line = lns[i];  
    pushMatrix();   
    translate(0.0, line.yPosition, 0.0); 

    for (int j = 0; j < line.myLetters.length; j++) {

      if (j != 0) {
        translate(textWidth(line.myLetters[j - 1].myChar) * 23, 0.0, 0.0);
      }

      if (mousePressed) {

        if (mouseX <= 85  ) {
          rotateY(f1 * 0.001 * f2);
          fill(#FFB4D9);
        } 
        if (85 < mouseX  && mouseX <= 120 ) {
          rotateY(f1 * 0.0025 * f2);
          fill(#FFA2CF);
        } 
        if (120 < mouseX  && mouseX <= 155 ) {
          rotateY(f1 * 0.004 * f2);
          fill(#FF95C9);
        } 
        if (155 < mouseX  && mouseX <= 190 ) {
          rotateY(f1 * 0.006 * f2);
          fill(#FF83BF);
        } 
        if (190 < mouseX  && mouseX <= 225 ) {
          rotateY(f1 * 0.008 * f2);
          fill(#FF74B7);
        }
        if (225 < mouseX  && mouseX <= 260 ) {
          rotateY(f1 * 0.01 * f2);
          fill(#FF64AF);
        } 
        if (260 < mouseX  && mouseX <= 295 ) {
          rotateY(f1 * 0.015 * f2);
          fill(#FF50A5);
        } 
        if (295 < mouseX  && mouseX <= 330 ) {
          rotateY(f1 * 0.025 * f2);
          fill(#FF3B9A);
        } 
        if (330 < mouseX  && mouseX <= 365 ) {
          rotateY(f1 * 0.04 * f2);
          fill(#FF248E);
        } 
        if (365 < mouseX) {
          rotateY(f1 * 0.06 * f2);
          fill(#FF007C);
        }
      }

      pushMatrix();  
      scale(18.0);  
      text(line.myLetters[j].myChar, 0.0, 0.0);
      popMatrix();
    } 

    popMatrix();
  }
}




void jitabata() {
  
  background(0);

  textFont(myFont2, 14);
  fill(215);
  text("↓ click & drag", 38, 80, 0);

  stroke(195);
  line(40, 105, 406, 105);
  line(396, 95, 406, 105);
  line(396, 115, 406, 105);
  line(39, 95, 39, 115);
  line(406, 95, 406, 115);


  if (mousePressed) {
    
    if (mouseX <= 47 ) {
      fill(140);
      ellipse(51, 104, 20, 20);      
      textFont(myFont2, 13);  
      fill(#FFB4D9);
      text("1", 143, 80, 0);
      ellipse(51, 104, 12, 12);
    }
    if (47 < mouseX  && mouseX <= 85 ) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);      
      textFont(myFont2, 13);  
      fill(#FFB4D9);
      text("1", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    } 
    if (85 < mouseX  && mouseX <= 120 ) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);
      textFont(myFont2, 14);  
      fill(#FFA2CF);
      text("2", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    } 
    if (120 < mouseX  && mouseX <= 155 ) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);
      textFont(myFont2, 15);  
      fill(#FF95C9);
      text("3", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    } 
    if (155 < mouseX  && mouseX <= 190 ) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);
      textFont(myFont2, 16);  
      fill(#FF83BF);
      text("4", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    } 
    if (190 < mouseX  && mouseX <= 225 ) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);
      textFont(myFont2, 17);  
      fill(#FF74B7);
      text("5", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    }
    if (225 < mouseX  && mouseX <= 260 ) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);
      textFont(myFont2, 18);  
      fill(#FF64AF);
      text("6", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    } 
    if (260 < mouseX  && mouseX <= 295 ) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);
      textFont(myFont2, 19);  
      fill(#FF50A5);
      text("7", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    } 
    if (295 < mouseX  && mouseX <= 330 ) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);
      textFont(myFont2, 20);   
      fill(#FF3B9A);
      text("8", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    } 
    if (330 < mouseX  && mouseX <= 365 ) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);
      textFont(myFont2, 21);      
      fill(#FF248E);
      text("9", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    } 
    if (365 < mouseX && mouseX <= 395) {
      fill(140);
      ellipse(mouseX, 104, 20, 20);
      textFont(myFont2, 22);
      fill(#FF007C);
      text("MAX", 143, 80, 0);
      ellipse(mouseX, 104, 12, 12);
    }
    if (395 < mouseX) {
      fill(140);
      ellipse(395, 104, 20, 20);
      textFont(myFont2, 22);
      fill(#FF007C);
      text("MAX", 143, 80, 0);
      ellipse(395, 104, 12, 12);
    }
    
  }

  else {
    fill(190);
    ellipse(51, 104, 20, 20);
    text("０", 142, 80, 0);
    fill(0);
    ellipse(51, 104, 12, 12);

    
  }
}




class Letter
{
  char myChar;
  float x;
  float y;
  
  Letter(char c, float f, float f1)
  {
    myChar = c;
    x = f;
    y = f1;
  }
}





class Line
{
  String myString;
  int xPosition;
  int yPosition;
  int highlightNum;
  
  Letter myLetters[];
  
  Line(String s, int i, int j) 
  {
    myString = s;
    xPosition = i;
    yPosition = j;
    myLetters = new Letter[s.length()];
    float f1 = 0.0;
    for(int k = 0; k < s.length(); k++)
    {
      char c = s.charAt(k);
      f1 += textWidth(c);
      Letter letter = new Letter(c, f1, 0.0);
      myLetters[k] = letter;
    }

  }
}






