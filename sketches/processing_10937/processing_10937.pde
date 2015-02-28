
import arb.soundcipher.*;

// Studienarbeit:
// Generatives Design SS 2010
// Prof. Dieter Meiller
// Titel: BoardingOnKeys
// Kurzbeschreibung:
//        - Selbst spielen (Tasten A-S-D-F-G-H-J-K)
//        - Zufallswiedergabe (Zufallstöne in Zufallsrhytmus)
//        - Lied spielen (Lied wird zufällig ausgewählt)
//        - Instrumentenwahl (Piano, Xylohon, Gitarre oder zufällig)

int counter;
float breite, hoehe;
float abstandUnten, abstandSeite;
float tastenabstand;
float c,d,e,f,g,a,h,c2;
boolean C,D,E,F,G,A,H,C2;
boolean gedrueckt, vibrieren;
boolean einmalC, einmalD, einmalE, einmalF, einmalG, einmalA, einmalH, einmalC2;
boolean selbstSpielen, zufallswiedergabe, liedSpielen;
double instrument;
int funktionButtonNr, instrumentButtonNr;
float durchmesser;
float durchmesserZufall;
float buttonHoehe, buttonBreite, buttonAbstand;
SoundCipher sc = new SoundCipher();
double lautstaerke;
double zeit;
int ton;
int tempo;
int SongNummer, AnzahlSongs;
int tonhoehe;
float taste;
String liedname;

void setup(){
  size(550,500);
  smooth();
  frameRate(25);
  background(0);
  abstandSeite = width/20;
  breite = width/10;
  tastenabstand = width/70;
  hoehe = height/3;
  abstandUnten = height/12;
  buttonHoehe = 20;
  buttonBreite = 120;
  buttonAbstand = 7;
  c=abstandSeite;                            //x-Position der Tasten berechnen
  d=abstandSeite+(breite+tastenabstand);
  e=abstandSeite+2*(breite+tastenabstand);
  f=abstandSeite+3*(breite+tastenabstand);
  g=abstandSeite+4*(breite+tastenabstand);
  a=abstandSeite+5*(breite+tastenabstand);
  h=abstandSeite+6*(breite+tastenabstand);
  c2=abstandSeite+7*(breite+tastenabstand);
  durchmesser = min(width/10,height/10);
  einmalC = einmalD = einmalE = einmalF = einmalG = einmalA = einmalH = einmalC2 = true;
  AnzahlSongs = 2;
  tempo = 8;
  liedname = " ";
  
  //SoundCipher-Einstellungen:
  instrument = 1;
  lautstaerke = 70;
  zeit = 10;
  
  //Funktions-Einstellungen zu Beginn:
  selbstSpielen = true;
  zufallswiedergabe = false;
  liedSpielen = false;
}

void draw(){
  //SoundCipher-Einstellungen:
  if (instrumentButtonNr == 0) instrument = 1; //Piano
  else if (instrumentButtonNr == 1) instrument = 10; //Xylophon
  else if(instrumentButtonNr == 2) instrument = 6; //Gitarre
  else if(instrumentButtonNr == 3) { //Zufallsinstrument: Piano, Xylophon oder Gitarre
    float i = random(0,3);
    if (i < 1) instrument = 1;
    else if (i > 1 && i < 2) instrument = 10;
    else if(i > 2) instrument = 6;
  }
  sc.instrument(instrument);
  //Hintergrundfläche zeichnen:
  fill(128); 
  rect(abstandSeite/2,height-abstandUnten-hoehe-height/30,width-abstandSeite,hoehe+hoehe/10);
  //Auwahlboxen Funktion zeichnen:
  fill(25);
  for(int i=0; i<3; i++){
    rect(width/2-buttonBreite/2,height/12+i*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  }  
  //ausgewählte Auswahlbox Funktion zeichnen:
  fill(0,0,200);
  rect(width/2-buttonBreite/2,height/12+funktionButtonNr*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  //Auwahlboxen Instrument zeichnen:
  fill(25);
  for(int i=0; i<4; i++){
    rect(width/2-buttonBreite/2,height/12+(4+i)*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  }
  //ausgewählte Auswahlbox Instrument zeichnen:
  fill(200,0,0);
  rect(width/2-buttonBreite/2,height/12+(4+instrumentButtonNr)*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  //Auswahlboxen beschriften
  fill(150);
  textAlign(CENTER);
  text("Selbst spielen",width/2-buttonBreite/2,height/12+0*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  text("Zufallswiedergabe",width/2-buttonBreite/2,height/12+1*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  text("Lied spielen",width/2-buttonBreite/2,height/12+2*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  text("Piano",width/2-buttonBreite/2,height/12+4*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  text("Xylophon",width/2-buttonBreite/2,height/12+5*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  text("Gitarre",width/2-buttonBreite/2,height/12+6*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  text("Zufallsinstrument",width/2-buttonBreite/2,height/12+7*(buttonHoehe+buttonAbstand),buttonBreite,buttonHoehe);
  //8 weiße Tasten zeichnen:
  fill(255);
  for (int i=0; i<8; i++){
    rect (abstandSeite+i*(breite+tastenabstand),height-abstandUnten-hoehe,breite,hoehe);
  }
  //stille Lautsprecherboxen zeichnen: 
  if (vibrieren == false) {
    fill(50);
    //Gehäuse:
    rect(abstandSeite*2, height/10, breite*2, hoehe);
    rect(width-abstandSeite*2-breite*2, height/10, breite*2, hoehe);
    //Lautsprecher:
    fill(30);
    ellipse(abstandSeite*2+breite, 1.8*(height/10), durchmesser, durchmesser);
    ellipse(abstandSeite*2+breite, 3.4*(height/10), durchmesser*1.4, durchmesser*1.4);
    ellipse(width-abstandSeite*2-breite, 1.8*(height/10), durchmesser, durchmesser);
    ellipse(width-abstandSeite*2-breite, 3.4*(height/10), durchmesser*1.4, durchmesser*1.4);
  }
  //vibrierende Lautsprecherboxen zeichnen:
  if (vibrieren == true) {
    fill(50);
    //Gehäuse:
    rect(abstandSeite*2, height/10, breite*2, hoehe);
    rect(width-abstandSeite*2, height/10, -breite*2, hoehe);
    //Lautsprecher:
    fill(30);
    durchmesserZufall = random(9,10)/10 * durchmesser;
    ellipse(abstandSeite*2+breite, 1.8*(height/10), durchmesserZufall, durchmesserZufall); //links oben
    ellipse(width-abstandSeite*2-breite, 1.8*(height/10), durchmesserZufall, durchmesserZufall); //rechts oben
    durchmesserZufall = random(14,15)/10 * durchmesser;
    ellipse(abstandSeite*2+breite, 3.4*(height/10), durchmesserZufall, durchmesserZufall); //links unten
    ellipse(width-abstandSeite*2-breite, 3.4*(height/10), durchmesserZufall, durchmesserZufall); //rechts unten
  }
  //Liedname löschen
  fill(0,0,0);
  rect(width/2-buttonBreite/2-buttonBreite/10,height/12+3*(buttonHoehe+buttonAbstand),buttonBreite+buttonBreite/5,buttonHoehe);
  //Liedname schreiben
  fill(180,180,180);
  text(liedname,width/2-buttonBreite/2-buttonBreite/10,height/12+3*(buttonHoehe+buttonAbstand),buttonBreite+buttonBreite/5,buttonHoehe);
  
  //wenn selbstSpielen aktiviert:
  //und wenn Taste gedrückt: grüne Taste zeichnen und Ton spielen, dazu Lautsprecher vibrieren:
  fill(0,255,0);
  if (selbstSpielen == true) {
    vibrieren = gedrueckt;
    if (C == true) {
      rect(c,height-abstandUnten-hoehe,breite,hoehe);
      if (einmalC == true) {
        sc.playNote(60, lautstaerke, zeit);
        einmalC = false;
      }
    }
    if (D == true) {
      rect(d,height-abstandUnten-hoehe,breite,hoehe);
      if (einmalD == true) {
        sc.playNote(62, lautstaerke, zeit);
        einmalD = false;
      }
    }
    if (E == true) {
      rect(e,height-abstandUnten-hoehe,breite,hoehe);
      if (einmalE == true) {
        sc.playNote(64, lautstaerke, zeit);
        einmalE = false;
      }
    }
    if (F == true) {
      rect(f,height-abstandUnten-hoehe,breite,hoehe);
      if (einmalF == true) {
        sc.playNote(65, lautstaerke, zeit);
        einmalF = false;
      }
    }
    if (G == true) {
      rect(g,height-abstandUnten-hoehe,breite,hoehe);
      if (einmalG == true) {
        sc.playNote(67, lautstaerke, zeit);
        einmalG = false;
      }
    }
    if (A == true) {
      rect(a,height-abstandUnten-hoehe,breite,hoehe);
      if (einmalA == true) {
        sc.playNote(69, lautstaerke, zeit);
        einmalA = false;
      }
    }
    if (H == true) {
      rect(h,height-abstandUnten-hoehe,breite,hoehe);
      if (einmalH == true) {
        sc.playNote(71, lautstaerke, zeit);
        einmalH = false;
      }
    }
    if (C2 == true) {
      rect(c2,height-abstandUnten-hoehe,breite,hoehe);
      if (einmalC2 == true) {
        sc.playNote(72, lautstaerke, zeit);
        einmalC2 = false;
      }
    }
  }
  
  //wenn Zufallswiedergabe aktiviert: Töne spielen und Lautsprecher vibrieren (mit zufälligen Pausen)
  if (zufallswiedergabe == true) {
    vibrieren = true;
    tempo = (int)random(6,10);
      if (counter % 5 == 0 && random(1) <  0.7) {
        vibrieren = true;
        ton = (int)random(1,9);
        switch (ton) {
          case 1: sc.playNote(60, lautstaerke, zeit); rect(c,height-abstandUnten-hoehe,breite,hoehe); break;
          case 2: sc.playNote(62, lautstaerke, zeit); rect(d,height-abstandUnten-hoehe,breite,hoehe); break;
          case 3: sc.playNote(64, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
          case 4: sc.playNote(65, lautstaerke, zeit); rect(f,height-abstandUnten-hoehe,breite,hoehe); break;
          case 5: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
          case 6: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
          case 7: sc.playNote(71, lautstaerke, zeit); rect(h,height-abstandUnten-hoehe,breite,hoehe); break;
          case 8: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
        }
      }
    counter ++;
  }
  
  //wenn Lied spielen aktiviert:
  if (liedSpielen == true) {
    vibrieren = true;
    if (SongNummer == 0){ //Alle meine Entchen
      liedname = "Alle meine Entchen";
      tempo = 8;
        if (counter % tempo == 0) {
          switch (counter/tempo) {
            case 1: sc.playNote(60, lautstaerke, zeit); rect(c,height-abstandUnten-hoehe,breite,hoehe); break;
            case 2: sc.playNote(62, lautstaerke, zeit); rect(d,height-abstandUnten-hoehe,breite,hoehe); break;
            case 3: sc.playNote(64, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 4: sc.playNote(65, lautstaerke, zeit); rect(f,height-abstandUnten-hoehe,breite,hoehe); break;
            case 5: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 7: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 9: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 10: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 11: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 12: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 13: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 17: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 18: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 19: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 20: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 21: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 25: sc.playNote(65, lautstaerke, zeit); rect(f,height-abstandUnten-hoehe,breite,hoehe); break;
            case 26: sc.playNote(65, lautstaerke, zeit); rect(f,height-abstandUnten-hoehe,breite,hoehe); break;
            case 27: sc.playNote(65, lautstaerke, zeit); rect(f,height-abstandUnten-hoehe,breite,hoehe); break;
            case 28: sc.playNote(65, lautstaerke, zeit); rect(f,height-abstandUnten-hoehe,breite,hoehe); break;
            case 29: sc.playNote(64, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 31: sc.playNote(64, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 33: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 34: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 35: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 36: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 37: sc.playNote(60, lautstaerke, zeit); rect(c,height-abstandUnten-hoehe,breite,hoehe); break;
            case 42: funktionButtonNr = 0;
                     selbstSpielen = true;
                     zufallswiedergabe = false;
                     liedSpielen = false;
                     liedname = " ";
                     break;
        }
      }
    } else if (SongNummer == 1){ // Die Gedanken sind frei
        liedname = "Die Gedanken sind frei";
        tempo = 6;
        if (counter % tempo == 0) {
          switch (counter/tempo) {
            case 1: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 2: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 3: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 5: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 7: sc.playNote(76, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 8: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 9: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 13: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 15: sc.playNote(65, lautstaerke, zeit); rect(f,height-abstandUnten-hoehe,breite,hoehe); break;
            case 17: sc.playNote(62, lautstaerke, zeit); rect(d,height-abstandUnten-hoehe,breite,hoehe); break;
            case 19: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 21: sc.playNote(64, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 23: sc.playNote(60, lautstaerke, zeit); rect(c,height-abstandUnten-hoehe,breite,hoehe); break;
            case 25: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 27: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 29: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 31: sc.playNote(76, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 32: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 33: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 37: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 39: sc.playNote(65, lautstaerke, zeit); rect(f,height-abstandUnten-hoehe,breite,hoehe); break;
            case 41: sc.playNote(62, lautstaerke, zeit); rect(d,height-abstandUnten-hoehe,breite,hoehe); break;
            case 43: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 45: sc.playNote(64, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 47: sc.playNote(60, lautstaerke, zeit); rect(c,height-abstandUnten-hoehe,breite,hoehe); break;
            case 49: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 51: sc.playNote(71, lautstaerke, zeit); rect(h,height-abstandUnten-hoehe,breite,hoehe); break;
            case 53: sc.playNote(74, lautstaerke, zeit); rect(d,height-abstandUnten-hoehe,breite,hoehe); break;
            case 55: sc.playNote(71, lautstaerke, zeit); rect(h,height-abstandUnten-hoehe,breite,hoehe); break;
            case 57: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 59: sc.playNote(76, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 61: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 63: sc.playNote(71, lautstaerke, zeit); rect(h,height-abstandUnten-hoehe,breite,hoehe); break;
            case 65: sc.playNote(74, lautstaerke, zeit); rect(d,height-abstandUnten-hoehe,breite,hoehe); break;
            case 67: sc.playNote(71, lautstaerke, zeit); rect(h,height-abstandUnten-hoehe,breite,hoehe); break;
            case 69: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 71: sc.playNote(76, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 73: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 75: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 77: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 79: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 80: sc.playNote(69, lautstaerke, zeit); rect(a,height-abstandUnten-hoehe,breite,hoehe); break;
            case 81: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 85: sc.playNote(67, lautstaerke, zeit); rect(g,height-abstandUnten-hoehe,breite,hoehe); break;
            case 86: sc.playNote(76, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 87: sc.playNote(76, lautstaerke, zeit); rect(e,height-abstandUnten-hoehe,breite,hoehe); break;
            case 88: sc.playNote(74, lautstaerke, zeit); rect(d,height-abstandUnten-hoehe,breite,hoehe); break;
            case 89: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 91: sc.playNote(71, lautstaerke, zeit); rect(h,height-abstandUnten-hoehe,breite,hoehe); break;
            case 93: sc.playNote(72, lautstaerke, zeit); rect(c2,height-abstandUnten-hoehe,breite,hoehe); break;
            case 100: funktionButtonNr = 0;
                     selbstSpielen = true;
                     zufallswiedergabe = false;
                     liedSpielen = false;
                     liedname = " ";
                     break;
        }
      }
    }
    counter++;
  }
}

void keyPressed() {
  if (keyCode == 65) /*A*/ {
    C = true;
    gedrueckt = true;
  }
  if (keyCode == 83) /*S*/ {
    D = true;
    gedrueckt = true;
  }
  if (keyCode == 68) /*D*/ {
    E = true;
    gedrueckt = true;
  }
  if (keyCode == 70) /*F*/ {
    F = true;
    gedrueckt = true;
  }
  if (keyCode == 71) /*G*/ {
    G = true;
    gedrueckt = true;
  }
  if (keyCode == 72) /*H*/ {
    A = true;
    gedrueckt = true;
  }
  if (keyCode == 74) /*J*/ {
    H = true;
    gedrueckt = true;
  }
  if (keyCode == 75) /*K*/ {
    C2 = true;
    gedrueckt = true;
  }
}

void keyReleased() {
    if (keyCode == 65) /*A*/ {
    C = false;
    gedrueckt = false;
    einmalC = true;
  }
  if (keyCode == 83) /*S*/ {
    D = false;
    gedrueckt = false;
    einmalD = true;
  }
  if (keyCode == 68) /*D*/ {
    E = false;
    gedrueckt = false;
    einmalE = true;
  }
  if (keyCode == 70) /*F*/ {
    F = false;
    gedrueckt = false;
    einmalF = true;
  }
  if (keyCode == 71) /*G*/ {
    G = false;
    gedrueckt = false;
    einmalG = true;
  }
  if (keyCode == 72) /*H*/ {
    A = false;
    gedrueckt = false;
    einmalA = true;
  }
  if (keyCode == 74) /*J*/ {
    H = false;
    gedrueckt = false;
    einmalH = true;
  }
  if (keyCode == 75) /*K*/ {
    C2 = false;
    gedrueckt = false;
    einmalC2 = true;
  }
}

void mouseClicked(){
  //Auswahlboxen Funktion markieren
  if (mouseX > width/2-buttonBreite/2 && mouseX < width/2+buttonBreite/2){
    if(mouseY > height/12+0*(buttonHoehe+buttonAbstand) && mouseY < height/12+0*(buttonHoehe+buttonAbstand)+buttonHoehe) {
      println("FButton1");
      funktionButtonNr = 0;
      selbstSpielen = true;
      zufallswiedergabe = false;
      liedSpielen = false;
      counter = 0;
      liedname = " ";
    }
    if(mouseY > height/12+1*(buttonHoehe+buttonAbstand) && mouseY < height/12+1*(buttonHoehe+buttonAbstand)+buttonHoehe) {
      println("FButton2");
      funktionButtonNr = 1;
      selbstSpielen = false;
      zufallswiedergabe = true;
      liedSpielen = false;
      counter = 0;
      liedname = " ";
    }
    if(mouseY > height/12+2*(buttonHoehe+buttonAbstand) && mouseY < height/12+2*(buttonHoehe+buttonAbstand)+buttonHoehe) {
      println("FButton3");
      funktionButtonNr = 2;
      selbstSpielen = false;
      zufallswiedergabe = false;
      liedSpielen = true;
      counter = 0;
      SongNummer = int(random(AnzahlSongs));
    }
    //Auswahlboxen Instrument markieren
    if(mouseY > height/12+(4+0)*(buttonHoehe+buttonAbstand) && mouseY < height/12+(4+0)*(buttonHoehe+buttonAbstand)+buttonHoehe) {
      println("InstrumentButton1");
      instrumentButtonNr = 0;
    }
    if(mouseY > height/12+(4+1)*(buttonHoehe+buttonAbstand) && mouseY < height/12+(4+1)*(buttonHoehe+buttonAbstand)+buttonHoehe) {
      println("InstrumentButton2");
      instrumentButtonNr = 1;
    }
    if(mouseY > height/12+(4+2)*(buttonHoehe+buttonAbstand) && mouseY < height/12+(4+2)*(buttonHoehe+buttonAbstand)+buttonHoehe) {
      println("InstrumentButton3");
      instrumentButtonNr = 2;
    }
    if(mouseY > height/12+(4+3)*(buttonHoehe+buttonAbstand) && mouseY < height/12+(4+3)*(buttonHoehe+buttonAbstand)+buttonHoehe) {
      println("InstrumentButton4");
      instrumentButtonNr = 3;
    }
  }
}

