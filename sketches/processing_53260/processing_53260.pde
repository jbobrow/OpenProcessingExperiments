
import controlP5.*;
//import processing.opengl.*;
PFont myFont;

//separates Fenster für die Controls
ControlWindow controlWindow;
ControlP5 controlP5;
Slider2D s;
Controller sliderA;
Controller sliderB;
Controller sliderC;
Controller sliderD;
Controller sliderE;
Controller sliderF;
Controller sliderG;
Controller sliderH;
Controller sliderI;
Controller sliderJ;
Button buttonA; // Änderung der Shapes
Button buttonB; // Änderung des Modus
Button buttonC; // Wechseln zu Buchstaben als Shapes
Button buttonD; // Random
Button buttonE; // Bild speichern

float durchmesser;
int number = 10;
int graduation = 30; //Anzahl der Ringe pro Element
int anzahlRinge;  //Anzahl der Ringe pro Element in Abhängigkeit von der Anzahl der Elemente
float verschiebungX = 0; //Abstand der Ringe in y-Richtung
float verschiebungY  = 0; //Abstand der Ringe in y-Richtung

color myColor;
int transparenz;
int hue = 36;
int brightness = 255;
int saturation = 255;
int opacity = 255;
int variety = 100;
int form = 0; // 0 = Ellipse / 1 = Rechteck
int outline = 0;

float offsetX;
float offsetY;
float xPos; //Koordinaten für Ringe
float yPos;  //Koordinaten für Ringe
int modus = 0; //Art der Verschiebung
char letter = 'A';
boolean savePattern = false; 
boolean letterScale = false;

void setup() {
  size(1024, 700);
  //size(screen.width-40, screen.height-80);
  frameRate(10);
  rectMode(CENTER);
  myFont = loadFont("Rockwell-Bold-80.vlw");
  textFont(myFont, 80); 
  
  //_________________________________________________________________________________
  //separates Fenster für die Controls
  
  controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(false);
  controlWindow = controlP5.addControlWindow("controlP5window",100,100,280,700);
  controlWindow.hideCoordinates();
  controlWindow.setBackground(color(40));

  //__________________________________________________________________________________
  //Bedienelemente erstellen und in das separate Fenster einfügen

  // 2D-Slider
  s = controlP5.addSlider2D("wave",-30, 30, -30, 30, -30, 30, 40, 40, 200, 200);
  s.setArrayValue(new float[] {16, 16}); 
  s.setWindow(controlWindow);
  
  //Slider
  sliderA = controlP5.addSlider("number",4,24,40,280,175,15); // min, max, posX, posY, Breite, Höhe
  sliderA.setWindow(controlWindow);
  sliderB = controlP5.addSlider("graduation",4,30,40,310,175,15); // min, max, posX, posY, Breite, Höhe
  sliderB.setWindow(controlWindow);
  sliderE = controlP5.addSlider("hue",0,255,40,340,175,15); // min, max, posX, posY, Breite, Höhe
  sliderE.setWindow(controlWindow);
  sliderF = controlP5.addSlider("saturation",0,255,40,370,175,15); // min, max, posX, posY, Breite, Höhe
  sliderF.setWindow(controlWindow);
  sliderG = controlP5.addSlider("brightness",0,255,40,400,175,15); // min, max, posX, posY, Breite, Höhe
  sliderG.setWindow(controlWindow);
  sliderH = controlP5.addSlider("opacity",0,255,40,430,175,15); // min, max, posX, posY, Breite, Höhe
  sliderH.setWindow(controlWindow);
  sliderI = controlP5.addSlider("variety",0,100,40,460,175,15); // min, max, posX, posY, Breite, Höhe
  sliderI.setWindow(controlWindow);
  sliderJ = controlP5.addSlider("outline",0,10,40,490,175,15); // min, max, posX, posY, Breite, Höhe
  sliderJ.setWindow(controlWindow);
  
  // Buttons
  buttonA = controlP5.addButton("change_shape",1,40,530,85,25);
  buttonA.captionLabel().set("Change Shape");
  buttonA.captionLabel().style().marginLeft = 7;
  buttonA.setWindow(controlWindow);
  
  buttonB = controlP5.addButton("change_modus",1,40,560,85,25);
  buttonB.captionLabel().set("Change Modus");
  buttonB.captionLabel().style().marginLeft = 7;
  buttonB.setWindow(controlWindow);
  
  buttonC = controlP5.addButton("letter_shapes",1,40,590,85,25);
  buttonC.captionLabel().set("Letter Shapes");
  buttonC.captionLabel().style().marginLeft = 7;
  buttonC.setWindow(controlWindow);
  
  buttonD = controlP5.addButton("randomizer",1,130,530,85,85);
  buttonD.captionLabel().set("Random");
  buttonD.captionLabel().style().marginLeft = 20;
  buttonD.setWindow(controlWindow);
  
  buttonE = controlP5.addButton("save_pattern",1,40,640,175,25);
  buttonE.captionLabel().set("Save Pattern");
  buttonE.captionLabel().style().marginLeft = 50;
  buttonE.setWindow(controlWindow);
  
  smooth();
  background(0);
  noStroke();
  colorMode(HSB);
}

void draw() {

  //Muster als Bild speichern
  if ( savePattern == true ) {
    saveFrame("Muster-####.png");
    savePattern = false;
  }
  
  background(0);
  if ( outline != 0 ) {
    stroke(brightness,opacity);
    strokeWeight(outline);
  }else{
    noStroke();
  }
  durchmesser = width/number;
  anzahlRinge = int(durchmesser/graduation);
  
  
  //Verschiebung - Werte aus dem 2D-Slider auslesen
  verschiebungX = s.arrayValue()[0];
  verschiebungY = s.arrayValue()[1];
  
  //Ringe (einzelnes Element)
  for ( int k = 0; k < anzahlRinge; k++) {
    //Zeilen
    for (int i = 0; i <= number; i++) {
      //Spalten
      for (int j = 0; j <= number; j++) {
        myColor = color(hue-(k*(variety+graduation)*0.1), saturation , brightness-(k*(variety+graduation)*0.1), opacity-(k*(variety+graduation)*0.1));
        fill(myColor);
        int groesse = int(durchmesser-(k*graduation));
        //________________________________________________________________________________
        //Koordinaten berechnen
        
        //Modus 0
        if ( modus == 0 ) {    
           if ( i % 2 == 1 && j % 2 == 1 ){
              xPos = i*durchmesser + (k*verschiebungX);
              yPos = j*durchmesser + (k*verschiebungY);
                
          }else if ( i % 2 == 0 && j % 2 == 1  ) {
            xPos = i*durchmesser - (k*verschiebungX);
            yPos = j*durchmesser + (k*verschiebungY);

          }else if ( i % 2 == 1 && j % 2 == 0  ) {
            xPos = i*durchmesser + (k*verschiebungX);
            yPos = j*durchmesser - (k*verschiebungY);

          }else if ( i % 2 == 0 && j % 2 == 0  ){
            xPos = i*durchmesser - (k*verschiebungX);
            yPos = j*durchmesser - (k*verschiebungY);
          }
            
        }else if ( modus == 1 ) {
          if ( i % 2 == 0 ){
            xPos = i*durchmesser + (k*verschiebungX);
            yPos = j*durchmesser + (k*verschiebungY);

          }else{
            xPos = i*durchmesser - (k*verschiebungX);
            yPos = j*durchmesser - (k*verschiebungY);
          }  
        }else if ( modus == 2 ) {

            xPos = i*durchmesser + (k*verschiebungX);
            yPos = j*durchmesser + (k*verschiebungY);

        }
        //____________________________________________________________________________
        //Formen (Shapes) zeichnen

        switch(form) {
                  
        case 0: //Ellipse 
          ellipse(xPos, yPos, durchmesser-(k*graduation), durchmesser-(k*graduation));
          break;
         
        case 1: //Rechteck 
          rect(xPos, yPos, groesse, groesse);
          break;
          
        case 2: //Triangle 1
          triangle(xPos,yPos, xPos+groesse,yPos, xPos+(groesse/2), yPos+groesse);
          break;
          
        case 3: //Triangle 2
          triangle(xPos,yPos+(groesse/2), xPos+(groesse/2),yPos, xPos+(groesse*2), yPos+(groesse*2));
          break;
          
        case 4: //Triangle 3
          triangle(xPos,yPos, xPos+groesse,yPos, xPos+groesse, yPos+groesse);
          break;
          
        case 5: //Letter Shapes
          if ( keyPressed == true ) {
            letter = key;
          }
          letterScaling(letterScale, groesse);
          text(letter, xPos, yPos);
        }  
      }//ende dritte for-Schleife (j)
    }//ende zweite for-Schleife (i)
  }//ende erste for-Schleife (k)
}//end of draw



//________________________________________________________________________________
// P5-Button-Funktionen

//Ändern der Form
public void change_shape(int theValue) {
  println(theValue);
  if ( form < 4 ) {
    form ++;
  }else{
    form = 0;
  }
}

//Ändern des Modus
public void change_modus(int theValue) {
  letterScale = !letterScale;
  if ( modus < 2 ) {
    modus ++;
  }else{
    modus = 0;
  }
}

//Wechseln zu Buchstaben
public void letter_shapes(int theValue) {
  println(theValue);
  form = 5;
  letter = 'A';
}

//Random
public void randomizer(int theValue) {
  randomize();
}

void mouseReleased(){
  randomize();
}

//Bild speichern
public void save_pattern(int theValue) {
  savePattern = true;
}

//Buchstabengröße konstant oder dynamisch
void letterScaling (boolean lScale, int lSize){
  if (lScale == true) {
    textFont(myFont, lSize);
  }else{
    textFont(myFont, 80);
  }
}

void randomize() {
  //Random Verschiebung
  int randomX = int(random(60));
  int randomY = int(random(60));
  s.setArrayValue(new float[] {randomX, randomY}); 
  
  //Random Anzahl
  number = int(random(1,24));
  controlP5.controller("number").setValue(number);
  
  //Random Feinheit
  graduation = int(random(4,30));
  controlP5.controller("graduation").setValue(graduation);
  
  //Random Farbton
  hue = int(random(255));
  controlP5.controller("hue").setValue(hue);
  
  //Random Sättigung
  saturation = int(random(50,255));
  controlP5.controller("saturation").setValue(saturation);
  
  //Random Deckkraft
  opacity = int(random(30,255));
  controlP5.controller("opacity").setValue(opacity);
  
  //Random Buntheit
  variety = int(random(0,100));
  controlP5.controller("variety").setValue(variety);
  
  //Random Kontur
  if ( opacity > 220 ) {
    outline = int(random(0,10));
  }else{
    outline = 0;
  }
  controlP5.controller("outline").setValue(outline);
  
  //Random Shape
  if ( form != 5 ) {
    form = int(random(5));
  }
  
  //Random Modus
  modus = int(random(2));
}


