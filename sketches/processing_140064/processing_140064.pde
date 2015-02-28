
//m:
//0 = radiergummi
//1 = stift
//2 = linie
//3 = viereck
//4 = ellipse
//5 = text
//6 = bild


import g4p_controls.*;
import javax.swing.JOptionPane;

PImage picture;
boolean firstBack = true;
boolean fC = true; //firstClick
boolean sC = true; //secondClick
boolean fill = true;
boolean nV = true; //noValue
boolean sD = false; //stopDraw
boolean debug = false;
String text;
int wP = 0;
int hP = 0;
int m = 1;
int b = 0;
int r = 0;
int g = 0;
int a = 255;
int gr = 20;
int save = 0;
int delete = 0;
int load;
int x;
int y; 

void setup() {
  while (delete ()) {
    delete();
  }

  size(1200, 500, JAVA2D);
  createGUI();
  G4P.setCursorOff(CROSS);
  background(255);
  colorMode(RGB);
  GUI();
  stroke(0);
}



void draw() {
  if (debug) {
    debugInfo();
  }

  if (((m==0||m==1) && mousePressed) && (mouseY>100)) {
    sor();
  }

  else if (m==3) {
    eck();
  }
  else if (m==2) 
  {
    ln();
  }
  else if (m==4) {
    ellipse();
  }
  else if (m==5) {
    text();
  }  
  else if (m==6) {
    bild();
  }
}

void sor() {
  if (!sD) {
    strokeWeight(gr);
    stroke(r, g, b, a);
    if (m==0) {
      stroke(255);
    }
    point(mouseX, mouseY);
    GUI();
    sD = true;
  }
}



void eck() {
  if (!fC) {
    picture = loadImage("save" + save + ".png");
    background(picture);
    if (fill) {
      noStroke();
      fill(r, g, b, a);
    } 
    else {
      noFill();
      strokeWeight(gr);
      stroke(r, g, b, a);
    }
    rect(x, y, mouseX-x, mouseY-y);
    GUI();
  } 
  if (!sC) { 
    save();
    fC = true;
    sC = true;
  }
}



void ln() {
  if (!fC) {
    picture = loadImage("save" + save + ".png");
    background(picture);
    stroke(r, g, b, a);
    strokeWeight(gr);
    line(x, y, mouseX, mouseY);
    GUI();
  }
  if (!sC) { 
    save();
    fC = true;
    sC = true;
  }
}



void ellipse() {
  if (!fC) {
    picture = loadImage("save" + save + ".png");
    background(picture);
    if (fill) {
      noStroke();
      fill(r, g, b, a);
    } 
    else {
      noFill();
      strokeWeight(gr);
      stroke(r, g, b, a);
    }
    ellipse(x, y, (mouseX-x)*2, (mouseY-y)*2);
    GUI();
  } 
  if (!sC) { 
    save();
    fC = true;
    sC = true;
  }
}



void text() { 

  if (nV) {
    text = JOptionPane.showInputDialog(null, "Text:", 
    "", 
    JOptionPane.QUESTION_MESSAGE);
    nV = false;
  }

  picture = loadImage("save" + save + ".png");
  background(picture); 
  textSize(2*gr);
  fill(r, g, b, a);
  text(text, mouseX, mouseY);
  GUI();

  if (!fC) { 
    save();
    fC = true;
  }
}


void bild() {

  if (nV) {
    text = JOptionPane.showInputDialog(null, "Bild:", 
    "", 
    JOptionPane.QUESTION_MESSAGE);

    nV = false;
  }

  picture = requestImage(text + ".png");

  if (fC) {
    picture = loadImage("save" + save + ".png");
    background(picture);


    if (mouseY>100) {
      picture = loadImage(text + ".png");
      image(picture, mouseX, mouseY, picture.width + wP, picture.height + hP);
    }
  }
  else {
    save();
    fC = true;
    wP = 0;
    hP = 0;
  }
}

void keyPressed() {
  if (keyCode==39) { //rechts
    wP++;
  }
  if (keyCode==40) { //runter
    hP++;
  }
  if (keyCode==38) { //hoch
    hP--;
  }
  if (keyCode==37) { //links
    wP--;
  }
  if (key=='d') {
    if (debug) {
      debug = false;
      picture = loadImage("debug.png");
      background(picture);
    } 
    else {
      save("debug.png");
      debug = true;
    }
  }
}

void GUI() {

  fill(255);
  noStroke();
  rect(0, 0, 1200, 100);

  if (m>0&&m<5) {
    noStroke();
    fill(r, g, b, a);
    ellipse(1100, 50, gr, gr);
  }
  
  textSize(20);
  fill(255, 0, 0);
  text("R", 950, 33);
  fill(0, 255, 0);
  text("G", 950, 60);
  fill(0, 0, 255);
  text("B", 950, 87);

  strokeWeight(10);
  stroke(127);
  line(0, 100, 1200, 100);
}







void speichern() {
  String saveName = JOptionPane.showInputDialog(null, "Bitte geben sie einen Dateinamen ein:", 
  "", 
  JOptionPane.QUESTION_MESSAGE);

  File check = sketchFile(saveName + ".png");

  if (check.exists()) {


    Object[] options = {
      "Nein", 
      "Ja",
    };
    int n = JOptionPane.showOptionDialog(frame, 
    "Diese Datei existiert bereits! Wollen sie die Datei überschreiben?", 
    "Achtung!", 
    JOptionPane.YES_NO_OPTION, 
    JOptionPane.WARNING_MESSAGE, 
    null, 
    options, 
    options[1]);

    if (n==1) {
      save(saveName + ".png");
    }
  } 
  else {
    save(saveName + ".png");
  }
}










void load() {
  String loadName;
  loadName = JOptionPane.showInputDialog(null, "Bitte geben sie einen Dateinamen ein:", 
  "", 
  JOptionPane.PLAIN_MESSAGE);


  if (loadName.length()!=0) {

    File bla = sketchFile(loadName + ".png");

    if (bla.exists())
    {
      picture = loadImage(loadName + ".png");
      background(picture);
      GUI();
      delete = 0;
      delete();
      save = 0;
      firstBack = true;
    }
    else
    {
      JOptionPane.showMessageDialog(null, "Datei existiert nicht!", "Fehler:", 
      JOptionPane.PLAIN_MESSAGE);
    }
  }
}


void save() {
  save++;
  rect(0, 0, 1200, 100);
  GUI();
  save("save" + save + ".png");
}




boolean delete() {
  delete++;
  File blub = sketchFile("save" + delete + ".png");
  if (blub.exists()) {
    blub.delete();
    return true;
  } 
  else {
    delete = 0;
    return false;
  }
}


void debugInfo(){
  picture = loadImage("save" + save + ".png");
  background(picture);
  fill(0,255,0);
  textSize(20);
  text("R:" + r + " " + "G:" + g + " " + "B:" + b + "    " + "m:" + m + "    " + "fC:"
  + fC + "    " + "sC:" + sC,10,490);
  
  
  
}
void mouseReleased() {
  sD = false;
  if ((mouseY>100) && (m==1||m==0)) {
    save();
  }
}


void mousePressed() {  
  if ((m>1 && m<5 || m==6) && (fC && mouseY>100)) {
    x = mouseX;
    y = mouseY;
    fC = false;
  } 
  else if ((m==2||m==3||m==4||m==5) && !fC) {
    sC = false;
  }
}


void mouseDragged() {
  sD = false;
}


/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.
 
 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
 // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void Stift_Button_gedrueckt(GButton source, GEvent event) { //_CODE_:Stift:779105:
  m = 1;
  println("Stift Modus!");
} //_CODE_:Stift:779105:

public void Radiergummie_Button_gedrueckt(GButton source, GEvent event) { //_CODE_:Radiergummie:619755:
  m = 0;
  println("Radiergummie Modus!");
} //_CODE_:Radiergummie:619755:

public void groesse_Regler_veraendert(GCustomSlider source, GEvent event) { //_CODE_:Groesse:507072:
  gr = Groesse.getValueI();
  GUI();
} //_CODE_:Groesse:507072:

public void R_Farbregler_veraendert(GCustomSlider source, GEvent event) { //_CODE_:R_Farbe:484177:
  r = R_Farbe.getValueI();
  GUI();
} //_CODE_:R_Farbe:484177:

public void G_Farbregler_veraendert(GCustomSlider source, GEvent event) { //_CODE_:G_Farbe:409984:
  g = G_Farbe.getValueI();
  GUI();
} //_CODE_:G_Farbe:409984:

public void B_Farbregler_veraendert(GCustomSlider source, GEvent event) { //_CODE_:B_Farbe:791273:
  b = B_Farbe.getValueI();
  GUI();
} //_CODE_:B_Farbe:791273:

public void zurueck_button_gedruckt(GButton source, GEvent event) { //_CODE_:Zurueck:920362:
  if (firstBack) {
    firstBack = false;
    load = save;
  }

  load--;

  File blub = sketchFile("save" + load + ".png");
  if (blub.exists()) {
    picture = loadImage("save" + load + ".png");
    background(picture);
    GUI();
  } 
  else {

    println("Keine ältere Sicherung vorhanden!");
    load++;
  }
} //_CODE_:Zurueck:920362:

public void vorwaerts_button_gedrueckt(GButton source, GEvent event) { //_CODE_:vorwaerts:245192:

  load++;

  File blub = sketchFile("save" + load + ".png");
  if (blub.exists()) {
    picture = loadImage("save" + load + ".png");
    background(picture);
    GUI();
  } 
  else {
    println("Keine neuere Sicherung vorhanden!");
    load--;
  }
} //_CODE_:vorwaerts:245192:

public void loeschen_button_gedrueckt(GButton source, GEvent event) { //_CODE_:loeschen:581788:
  background(255);
  GUI();
  delete = 0;
  delete();
  save = 0;
  firstBack = true;
} //_CODE_:loeschen:581788:

public void speicher_button_gedrueckt(GButton source, GEvent event) { //_CODE_:speichern:328680:
  speichern();
} //_CODE_:speichern:328680:

public void laden_button_gedruckt(GButton source, GEvent event) { //_CODE_:laden:613024:
  load();
} //_CODE_:laden:613024:

public void viereck_button_gedrueckt(GButton source, GEvent event) { //_CODE_:viereck:778368:
  m = 3;
} //_CODE_:viereck:778368:

public void linien_button_gedrueckt(GButton source, GEvent event) { //_CODE_:Linie:224703:
  m = 2;
} //_CODE_:Linie:224703:

public void kreis_button_gedrueckt(GButton source, GEvent event) { //_CODE_:kreis:388642:
  m = 4;
} //_CODE_:kreis:388642:

public void alphaWertgeaendert(GCustomSlider source, GEvent event) { //_CODE_:alphaWert:717134:
  a = alphaWert.getValueI();
  GUI();
} //_CODE_:alphaWert:717134:

public void gefuel_geaendert(GCheckbox source, GEvent event) { //_CODE_:gefuellt:932076:
  if (fill) {
    fill = false;
  } 
  else {
    fill = true;
  }
} //_CODE_:gefuellt:932076:

public void text_button_gedrueckt(GButton source, GEvent event) { //_CODE_:textb:427776:
  m = 5;
  nV = true;
} //_CODE_:textb:427776:

public void bild_button_gedrueckt(GButton source, GEvent event) { //_CODE_:bild:340997:
  m = 6;
  nV = true;
} //_CODE_:bild:340997:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if (frame != null)
    frame.setTitle("Sketch Window");
  Stift = new GButton(this, 10, 10, 80, 30);
  Stift.setText("Stift");
  Stift.setTextBold();
  Stift.addEventHandler(this, "Stift_Button_gedrueckt");
  Radiergummie = new GButton(this, 590, 10, 95, 30);
  Radiergummie.setText("Radiergummie");
  Radiergummie.setTextBold();
  Radiergummie.setLocalColorScheme(GCScheme.RED_SCHEME);
  Radiergummie.addEventHandler(this, "Radiergummie_Button_gedrueckt");
  Groesse = new GCustomSlider(this, 205, 45, 100, 40, "grey_blue");
  Groesse.setShowValue(true);
  Groesse.setLimits(20, 1, 80);
  Groesse.setNumberFormat(G4P.INTEGER, 0);
  Groesse.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  Groesse.setOpaque(false);
  Groesse.addEventHandler(this, "groesse_Regler_veraendert");
  R_Farbe = new GCustomSlider(this, 840, 5, 100, 40, "grey_blue");
  R_Farbe.setShowValue(true);
  R_Farbe.setLimits(0, 0, 255);
  R_Farbe.setNumberFormat(G4P.INTEGER, 0);
  R_Farbe.setLocalColorScheme(GCScheme.RED_SCHEME);
  R_Farbe.setOpaque(false);
  R_Farbe.addEventHandler(this, "R_Farbregler_veraendert");
  G_Farbe = new GCustomSlider(this, 840, 35, 100, 40, "grey_blue");
  G_Farbe.setShowValue(true);
  G_Farbe.setLimits(0, 0, 255);
  G_Farbe.setNumberFormat(G4P.INTEGER, 0);
  G_Farbe.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  G_Farbe.setOpaque(false);
  G_Farbe.addEventHandler(this, "G_Farbregler_veraendert");
  B_Farbe = new GCustomSlider(this, 840, 65, 100, 40, "grey_blue");
  B_Farbe.setShowValue(true);
  B_Farbe.setLimits(0, 0, 255);
  B_Farbe.setNumberFormat(G4P.INTEGER, 0);
  B_Farbe.setOpaque(false);
  B_Farbe.addEventHandler(this, "B_Farbregler_veraendert");
  Zurueck = new GButton(this, 10, 50, 80, 30);
  Zurueck.setText("<<");
  Zurueck.setTextBold();
  Zurueck.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  Zurueck.addEventHandler(this, "zurueck_button_gedruckt");
  vorwaerts = new GButton(this, 110, 50, 80, 30);
  vorwaerts.setText(">>");
  vorwaerts.setTextBold();
  vorwaerts.addEventHandler(this, "vorwaerts_button_gedrueckt");
  loeschen = new GButton(this, 110, 10, 80, 30);
  loeschen.setText("Löschen");
  loeschen.setTextBold();
  loeschen.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  loeschen.addEventHandler(this, "loeschen_button_gedrueckt");
  speichern = new GButton(this, 320, 10, 80, 30);
  speichern.setText("Speichern");
  speichern.setTextBold();
  speichern.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  speichern.addEventHandler(this, "speicher_button_gedrueckt");
  laden = new GButton(this, 320, 50, 80, 30);
  laden.setText("Laden");
  laden.setTextBold();
  laden.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  laden.addEventHandler(this, "laden_button_gedruckt");
  viereck = new GButton(this, 410, 10, 80, 30);
  viereck.setText("Viereck");
  viereck.setTextBold();
  viereck.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  viereck.addEventHandler(this, "viereck_button_gedrueckt");
  togGroup1 = new GToggleGroup();
  togGroup2 = new GToggleGroup();
  togGroup3 = new GToggleGroup();
  togGroup4 = new GToggleGroup();
  Linie = new GButton(this, 410, 50, 80, 30);
  Linie.setText("Linie");
  Linie.setTextBold();
  Linie.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  Linie.addEventHandler(this, "linien_button_gedrueckt");
  kreis = new GButton(this, 500, 10, 80, 30);
  kreis.setText("Kreis");
  kreis.setTextBold();
  kreis.addEventHandler(this, "kreis_button_gedrueckt");
  alphaWert = new GCustomSlider(this, 205, 6, 100, 40, "grey_blue");
  alphaWert.setShowValue(true);
  alphaWert.setLimits(255, 0, 255);
  alphaWert.setNumberFormat(G4P.INTEGER, 0);
  alphaWert.setOpaque(false);
  alphaWert.addEventHandler(this, "alphaWertgeaendert");
  gefuellt = new GCheckbox(this, 500, 55, 79, 20);
  gefuellt.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  gefuellt.setText("Gefüllt");
  gefuellt.setTextBold();
  gefuellt.setOpaque(false);
  gefuellt.addEventHandler(this, "gefuel_geaendert");
  gefuellt.setSelected(true);
  textb = new GButton(this, 590, 50, 95, 30);
  textb.setText("Text");
  textb.setTextBold();
  textb.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  textb.addEventHandler(this, "text_button_gedrueckt");
  bild = new GButton(this, 695, 10, 80, 30);
  bild.setText("Bild");
  bild.setTextBold();
  bild.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  bild.addEventHandler(this, "bild_button_gedrueckt");
}

// Variable declarations 
// autogenerated do not edit
GButton Stift; 
GButton Radiergummie; 
GCustomSlider Groesse; 
GCustomSlider R_Farbe; 
GCustomSlider G_Farbe; 
GCustomSlider B_Farbe; 
GButton Zurueck; 
GButton vorwaerts; 
GButton loeschen; 
GButton speichern; 
GButton laden; 
GButton viereck; 
GToggleGroup togGroup1; 
GToggleGroup togGroup2; 
GToggleGroup togGroup3; 
GToggleGroup togGroup4; 
GButton Linie; 
GButton kreis; 
GCustomSlider alphaWert; 
GCheckbox gefuellt; 
GButton textb; 
GButton bild; 



