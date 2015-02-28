
Button clearButton;
Button quitButton;
Tool bleiStift;
Tool buntStift;
Tool radierer;

color bgColor = 255;

void setup() {
  size(600,600);
  smooth();
  background(bgColor);
  colorMode(HSB, 359,100,100);
  clearButton = new Button(color(200,48,94), 100, 480, 20, "Clear"); // clearButton initialisieren
  quitButton = new Button(color(200,48,94), 380, 480, 20, "Quit");
  colorMode(RGB, 255,255,255);
  bleiStift = new Tool(color (0), 3, 'p');
  buntStift = new Tool(color (255,0,0), 8, 'r');
  radierer = new Tool(color (bgColor), 15, 'e'); 
  frameRate(600);
}
  
void draw() {
  
  if (clearButton.mouseOver() || clearButton.mouseOver()  == false) { // Prüfen, ob Maus über einem Button ist    
  if (mousePressed) {
    
    if (mouseButton == LEFT) { // Linke Maustaste - Stift
      bleiStift.display();
    }
    
    else if (mouseButton == RIGHT) { // Rechte Maustaste - Radierer
      radierer.display();
    }
      
    else { // Mittlere Maustaste - Rotstift
      buntStift.display();
    }
  }
  
  }
  else {
    cursor(ARROW);
  }
 
   
  clearButton.display();
  quitButton.display();
  
    
  if (clearButton.pressed(true)) {
    background(bgColor);
  }
  else if (quitButton.pressed(true)) {
   /* exit(); */
  }
  
  
}



class Tool { // Werkzeug Klasse
/*  PImage iconPen;
  PImage iconEraser;
  PImage iconRedpen; */
  int strichStaerke;
  color strokeC;
  char toolIcon;
  
  Tool(color tempStrokeC, int tempStrichStaerke, char tempToolIcon) {
   /* iconPen = loadImage("icon_pen.png");
    iconRedpen = loadImage("icon_redpen.png");
    iconEraser = loadImage("icon_eraser.png"); */
    toolIcon = tempToolIcon;
    strichStaerke = tempStrichStaerke;
    strokeC = tempStrokeC;
  }
  
  void display() {
    /*switch(toolIcon) {
      case 'p':
        cursor(iconPen, 31,31);
        break;
      case 'r':
        cursor(iconRedpen, 31,31);
        break;
      case 'e':
        cursor(iconEraser, 0,0);
        break;
    }*/
    noStroke();
    fill(strokeC);
    ellipse(mouseX,mouseY,strichStaerke,strichStaerke);
  }
}

class Button { // Button Klasse
  
  float xpos, ypos, // Position Button
  breite, hoehe, btnRad; //Größe Button
  String btnTxt; // Button Text
  color c;
  
  Button(color tempC, float tempXpos, float tempYpos, float tempBtnRad, String tempBtnTxt) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    btnRad = tempBtnRad;
    btnTxt = tempBtnTxt;
    breite = 120;
    hoehe = 50;
  }
  
  void display() {
    noStroke();
    fill(c);
    rect(xpos,ypos,breite,hoehe,btnRad,btnRad,btnRad,btnRad);
    fill(255);
    text(btnTxt, xpos+45, ypos+30);
    mouseOver();
  }
  
  boolean mouseOver() {
    boolean statusMo;
    if (overBtn(xpos,ypos,breite,hoehe)) {
      fill(c);
      rect(xpos,ypos,breite,hoehe,btnRad,btnRad,btnRad,btnRad);
      fill(0);
      text(btnTxt, xpos+45, ypos+30);
      statusMo = true;
    }
    else { statusMo = false; }
    return statusMo;
  }
  
  boolean overBtn(float x, float y, float width, float height) {
  if (mouseX >= x && mouseX <= x+width &&
  mouseY >= y && mouseY <= y+height) {
    return true;
  }
  else { return false; }
  }
  
  boolean pressed(boolean pressedStatus) {
    if (overBtn(xpos,ypos,breite,hoehe)) { // nur, wenn Maus über Button ist
      if (mousePressed == true) {
        pressedStatus = true;
      }
      else { pressedStatus = false; }
    }
    else { pressedStatus = false; }
    return pressedStatus;
  }
}

