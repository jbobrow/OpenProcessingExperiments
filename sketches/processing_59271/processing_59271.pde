
class Mirror {
    float xpos;
    float ypos;
    float d;
    
    Mirror(float tempXpos, float tempYpos, float tempD) {
      xpos = tempXpos;
      ypos = tempYpos;
      d = 800*tempD/42;
    }
    
    void drawMirror(float myAlpha, String title) {
      if (myAlpha > 150) {
        fill(0, myAlpha, 240, 120);
        stroke(80, myAlpha/5);
        ellipse(xpos, ypos, d, d);
        textAlign(CENTER);
        fill(80, myAlpha);
        text(title, xpos, ypos+10); 
      }
    }
}

class HexMirror {
  float shade;
  float x;
  float y;
  float side;
  
  HexMirror(float tempXpos, float tempYpos, float tempSide) {
      x = tempXpos;
      y = tempYpos;
      side = tempSide*800/42;
    }
    
    void drawHexMirror(float myAlpha,  String title) {
      if (myAlpha > 150) {
        fill(0, myAlpha, 240, 120);
        stroke(80, myAlpha/5);
        fill(0, myAlpha, 250, 120);
        beginShape();
        vertex(x + side, y);
        vertex(x + side/2, y + sqrt(3) * side/2);
        vertex(x - side/2, y + sqrt(3) * side/2);
        vertex(x - side, y);
        vertex(x - side/2, y - sqrt(3) * side/2);
        vertex(x + side/2, y - sqrt(3) * side/2);
        endShape(CLOSE);
        textAlign(CENTER);
        fill(80, myAlpha);
        text(title, x, y+10); 
      }
    }
}
PFont font;

Mirror EELT;
Mirror LBT1;
Mirror LBT2;
HexMirror GTC;
HexMirror Keck1;
HexMirror Keck2;
HexMirror SALT;
HexMirror HET;
Mirror Subaru;
Mirror VLT1;
Mirror VLT2;
Mirror VLT3;
Mirror VLT4;
Mirror GeminiN;
Mirror GeminiS;
Mirror MMT;

float cenY;
float cenX;
float a = 150;

void setup() {
  size(800, 800);
  background(255);
  cenX = width/2;
  cenY = height/2;
  font = createFont("AndaleMono", 20); 
  textFont(font);
  EELT = new Mirror(cenX, cenY, 42);
  LBT1 = new Mirror(cenX, cenY-163, 11.9);
  LBT2 = new Mirror(cenX, cenY+163, 11.9);
  Keck1 = new HexMirror(cenX, cenY, 10/sqrt(3));
  Keck2 = new HexMirror(cenX+143, cenY+83, 10/sqrt(3));
  SALT = new HexMirror(cenX-143, cenY-83, 9.2/sqrt(3));
  
  GTC = new HexMirror(cenX+143, cenY-83, 10.4/sqrt(3));
  HET = new HexMirror(cenX-143, cenY+83, 9.2/sqrt(3));
  Subaru = new Mirror(cenX, cenY-320, 8.2);
  VLT1 = new Mirror(cenX+135, cenY-245, 8.2);
  VLT2 = new Mirror(cenX+135, cenY+245, 8.2);
  VLT3 = new Mirror(cenX-135, cenY-245, 8.2);
  VLT4 = new Mirror(cenX-135, cenY+245, 8.2);
  GeminiN = new Mirror(cenX-283, cenY, 8.2);
  GeminiS = new Mirror(cenX+280, cenY, 8.2);
  MMT = new Mirror(cenX, cenY+305, 6.5);
}

void draw() {
  EELT.drawMirror(a, "");
  GTC.drawHexMirror(a-25, "GTC");
  Keck1.drawHexMirror(a-50, "Keck 1");
  Keck2.drawHexMirror(a-75, "Keck 2");
  SALT.drawHexMirror(a-100, "SALT");
  HET.drawHexMirror(a-125, "HET");
  LBT1.drawMirror(a-150, "LBT1");
  LBT2.drawMirror(a-175, "LBT2");
  Subaru.drawMirror(a-200, "Subaru");
  VLT1.drawMirror(a-225, "VLT1");
  VLT2.drawMirror(a-250, "VLT2");
  VLT3.drawMirror(a-275, "VLT3");
  VLT4.drawMirror(a-300, "VLT4");
  GeminiN.drawMirror(a-325, "Gemini North");
  GeminiS.drawMirror(a-350, "Gemini South");
  MMT.drawMirror(a-375, "MMT");
  a = a + 2.0;
}


