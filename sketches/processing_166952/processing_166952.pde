
/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// simple example of the class that draws text on a circle
//
// Controls:
// LeftMouseClick   - add new circular text
//
// Keys:
// S   -  save frame
// I   -  redraw with inverse color
// R   -  redraw
//
/////////////////////////////////////////////////

int clr [] = {255, 0};
PFont font;
String msg [] = {
  "size matters ", "A maximus ad minima ", "Amor vincit omnia ", "Animam in promptu habere ", "Aqua et igni alicui interdicere ", 
  "Aut cum scuto, aut in scuto ", "Bona opinio homini tuttior pecunia est ", "Bonus pater familias ", "Caritas humani generis ", 
  "Cogitationum poenam nemo luit ", "Contra factum non datur argumentum  ", "Contra spem spero ", "Contraria sunt complementa ", 
  "Credo quia absurdum ", "Dum spiro spero ", "Imperare sibi maximum imperium est ", "Post tenebras lux ", "Reti ventos venari "
};

CircleText nvCirc;

void setup() {
  size(700, 700);
  font = createFont("Arial Bold", 10, true);
  nvCirc = new CircleText(width/2, height/2, msg[int(random(msg.length))]);
  background(clr[0]);  fill(clr[1]);
  noLoop();
}

void draw() {
  if (mousePressed) {
    textFont(font, random(10, 40));
    translate (mouseX, mouseY);
    rotate(random(TWO_PI));
    nvCirc.drawTextRing(0, 0, msg[int(random(msg.length))]);
  }
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  switch (key){
  case 's':
  case 'S': { saveFrame("img-###" + (int)random(100, 800) + ".jpg"); break; }
  case 'i': 
  case 'I': { clr[0]=clr[0]^clr[1]; clr[1] = clr[1]^clr[0]; clr[0]=clr[0]^clr[1];}
  default : { background(clr[0]);  fill(clr[1]); redraw(); }
  }
}

// quick helper class by Manoylov AC
// drawing text on circle with different modes
// not perfect. WIP.
// correctly works with textAlign(CENTER);

class CircleText {
  String inText = "Grymziki want to eat ";
  float xPos, yPos;
  float radius = 100;
  private float startAngle = 0; // for future using
  private float crclStrWidth;

  CircleText (float in_posX, float in_posY, String in_txt) {
    setXY(in_posX, in_posY);
    setText(in_txt);
  }

  void setText(String in_txt) {
    this.inText = in_txt;
  }

  void setXY(float in_posX, float in_posY) {
    this.xPos = in_posX;
    this.yPos = in_posY;
  }

  void shiftXY(float in_posX, float in_posY) {
    this.xPos += in_posX;
    this.yPos += in_posY;
  }

  //////////////////////////////////////////////////////////////////////////////////////////////

  // we set string and then method calculates size of the radius
  void drawTextRing(String in_txt) {
    setText(in_txt);
    drawTextOnRingBase();
  }

  void drawTextRing(float in_posX, float in_posY, String in_txt) {
    setXY(in_posX, in_posY);
    drawTextRing(in_txt);
  }

  void drawTextRing() {
    drawTextOnRingBase();
  }
  //////////////////////////////////////////////////////////////////////////////////////////////

  // we set string and radius and then method calculates size of the font
  void drawTextSizeForRadTxt(String in_txt, float in_diam) {
    this.inText = in_txt;
    textSize(10);
    textSize((TWO_PI * in_diam/2) / (widthOfString(in_txt)/10));
    drawTextOnRingBase();
  }

  void drawTextSizeForRadTxt(float in_posX, float in_posY, String in_txt, float in_diam) {
    setXY(in_posX, in_posY);
    drawTextSizeForRadTxt(in_txt, in_diam);
  }

  //////////////////////////////////////////////////////////////////////////////////////////////

  // we set symbol and radius and then method counts amount of the symbols for repetitions
  // if string contains more than 1 symbol then radius will be changed
  void drawSymbolsByRadius(String in_txt, float in_diam) {
    this.radius = in_diam/2;
    resetStrBySymbNum(in_txt, 0);
    calcRadLenFromStirng();
    drawTextOnRingBase();
  }  

  void drawSymbolsByRadius(float in_posX, float in_posY, String in_txt, float in_diam) {
    setXY(in_posX, in_posY);
    drawSymbolsByRadius(in_txt, in_diam);
  }

  //////////////////////////////////////////////////////////////////////////////////////////////  

  // we set string and count of repetitions and then method calculates size of the radius
  void drawStringRepetition(String in_txt, int in_countRepetition) {
    resetStrBySymbNum(in_txt, in_countRepetition);
    calcRadLenFromStirng();
    drawTextOnRingBase();
  }

  void drawStringRepetition(float in_posX, float in_posY, String in_txt, int in_countRepetition) {
    setXY(in_posX, in_posY);
    drawStringRepetition(in_txt, in_countRepetition);
    drawTextOnRingBase();
  }

  //////////////////////////////////////////////////////////////////////////////////////////////
  // helper methods

  // method create a new string that repeats itself as many times as necessary for existing radius
  private void resetStrBySymbNum(String in_txt, int count) {
    if (count == 0) {
      count = int(TWO_PI*radius/ (widthOfString(in_txt)));
    }
    this.inText = "";
    while (count>0) {
      this.inText += in_txt;
      count--;
    }
  }

  // method of calculating the string width and the corresponding radius   
  private void calcRadLenFromStirng() {
    this.crclStrWidth = widthOfString(this.inText); 
    this.radius = crclStrWidth / TWO_PI;
  }

  // widthOfString("String width") != textWidth("String width")
  float widthOfString(String in_str) {
    int cnt = 0;
    float totalWidth = 0;
    while (cnt < in_str.length () ) {
      totalWidth += textWidth(in_str.charAt(cnt));
      ++cnt;
    }
    return totalWidth;
  }

  //////////////////////////////////////////////////////////////////////////////////////////////

  void draw() {
    drawTextOnRingBase();
  }

  private void drawTextOnRingBase() {
    calcRadLenFromStirng();
    textAlign(CENTER);

    int count = 0;
    float arcLength = 0;
    float totalAngle = crclStrWidth/radius;
    float angle;

    while (count < inText.length () ) {
      float wdthTChar = textWidth(inText.charAt(count));
      arcLength += wdthTChar/2;
      angle = PI + arcLength / radius  - totalAngle;  
      float xx = cos(angle + startAngle) * radius + xPos;
      float yy = sin(angle + startAngle) * radius + yPos;

      pushMatrix();
      translate(xx, yy);
      rotate(angle + PI/2);
      text(inText.charAt(count++), 0, 0);
      popMatrix();
      arcLength += wdthTChar/2;
    }
    //    ellipse(xPos, yPos, radius*2, radius*2);
  }
}


