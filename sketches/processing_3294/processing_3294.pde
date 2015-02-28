
class Flag {
  
  float side; //the width and height of the flag
  float x, y, w, h; //coordinates for the flag
  char glyph; //the glyph for the flag

  Flag(float tempX, float tempY, float tempSide) {   
    setPosition(tempX, tempY, tempSide);
    setGlyph(' ');
  }
  
  void setPosition(float tempX, float tempY, float tempS) {
    x = tempX;
    y = tempY;
    w = tempS;
    h = tempS;
  }
  
  void setGlyph(char tempG) {
    glyph = tempG;
  }
  
  void draw() {
    switch(glyph) {
      case 'a':
        drawAlpha(x, y, w, h);
        break;
      case 'b':
        drawBravo(x, y, w, h);
        break;
      case 'c':
        drawCharlie(x, y, w, h);
        break;
      case 'd':
        drawDelta(x, y, w, h);
        break;
      case 'e':
        drawEcho(x, y, w, h);
        break;
      case 'f':
        drawFoxtrot(x, y, w, h);
        break;
      case 'g':
        drawGolf(x, y, w, h);
        break;
      case 'h':
        drawHotel(x, y, w, h);
        break;
      case 'i':
        drawIndia(x, y, w, h);
        break;
      case 'j':
        drawJuliet(x, y, w, h);
        break;
      case 'k':
        drawKilo(x, y, w, h);
        break;
      case 'l':
        drawLima(x, y, w, h);
        break;
      case 'm':
        drawMike(x, y, w, h);
        break;
      case 'n':
        drawNovember(x, y, w, h);
        break;
      case 'o':
        drawOscar(x, y, w, h);
        break;
      case 'p':
        drawPapa(x, y, w, h);
        break;
      case 'q':
        drawQuebec(x, y, w, h);
        break;
      case 'r':
        drawRomeo(x, y, w, h);
        break;
      case 's':
        drawSierra(x, y, w, h);
        break;
      case 't':
        drawTango(x, y, w, h);
        break;
      case 'u':
        drawUniform(x, y, w, h);
        break;
      case 'v':
        drawVictor(x, y, w, h);
        break;
      case 'w':
        drawWhiskey(x, y, w, h);
        break;
      case 'x':
        drawXray(x, y, w, h);
        break;
      case 'y':
        drawYankee(x, y, w, h);
        break;
      case 'z':
        drawZulu(x, y, w, h);
        break;
      case ' ':
        drawSpace(x, y, w, h);
        break;
      case '.':
        drawPeriod(x, y, w, h);
        break;
      case ',':
        drawComma(x, y, w, h);
        break;
      case '\'':
        drawPeriod(x, y, w, h);
        break;
      case '"':
        drawQuote(x, y, w, h);
        break;
      default:
        println("chararcter not mapped yet");
        break;
    }
  }
  
}

