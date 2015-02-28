


String myText ="";
PFont font;
int fontSize = 30;
float margin = 14; 
//Gesuchter Buchstabe
char searchChar;
//char n = 'n';
//------
int farbeA= color(0, 0, 0);
int farbeB= color(176, 100, 0);
int farbeC= color(192, 192, 192);
int farbeD= color(200, 152, 0);
int farbeE= color(112, 136, 216);
int farbeF= color(110, 100, 80);
int farbeG= color(120, 100, 80);
int farbeH= color(184, 204, 184);
int farbeI= color(248, 252, 200);
int farbeJ= color(224, 228, 108);
int farbeK= color(0, 108, 64); 
int farbeL= color(176, 160, 144);
int farbeM= color(0, 100, 0);
int farbeN= color(24, 108, 80);
int farbeO= color(184, 0, 0);
int farbeP= color(120, 100, 88); 
int farbeQ= color(176, 176, 176);
int farbeR= color(96, 48, 0); 
int farbeS= color(232, 224, 8);
int farbeT= color(160, 152, 152);
int farbeU= color(144, 72, 0);
int farbeV= color(104, 72, 21); 
int farbeW= color(40, 120, 88); 
int farbeX= color(112, 164, 136); 
int farbeY= color(200, 204, 0); 
int farbeZ= color(144, 168, 120);
int undef=  color(0);
//------
int hoehe= 30;
int breite= 20;
//----------
String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
int[] counters = new int[alphabet.length()];
String[] lines;
String joinedText;
//---------------------------------------------------------

void setup () {
  size (800, 600);
  font = loadFont("FuturaBT-Book-48.vlw");
  //font = createFont ("Arial", fontSize);
  textFont (font, fontSize);
  myText +="stanleys expeditionszug quer durch afrika wird\n";
  myText +="von jedermann bewundert. vogel quax zwickt johnys pferd.\n";
  myText +="prall vom whisky flog quax den jet im wald zu bruch.\n";
  myText +="jeder wackere bayer vertilgt bequem zwo pfund kalbshaxen.\n";
  myText +="franz jagt im komplett verwahrlosten taxi.\n";

  lines = loadStrings("text.txt");  //laden des zu analysierenden textes
  joinedText = join(lines, " ");


  countCharacters();
}
//----
void draw () {
  background (255);
  smooth ();
  float x = 0;
  //float lastEx = -1;
  //text(myText, posX, posY);
  // Variable 'base' zur y-Positionierung
  float base = height / 5 - fontSize;
  //-------------------------


  //--------------------------------------------------------------------------------------------
  for (int i = 0; i < alphabet.length(); i++) {
    textSize(16);
    textAlign(RIGHT);
    int textBeginn = 32;

    //counter zahlen:   
    if (i==0) {  
      if (key=='a'||key=='A') {
        fill (farbeA);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==1) {      
      if (key=='b'||key=='B') {
        fill (farbeB);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==2) {  
      if (key=='c'||key=='C') {
        fill (farbeC);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==3) {      
      if (key=='d'||key=='D') {
        fill (farbeD);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==4) {  
      if (key=='e'||key=='E') {
        fill (farbeE);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==5) {      
      if (key=='f'||key=='F') {
        fill (farbeF);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==6) {      
      if (key=='g'||key=='G') {
        fill (farbeG);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==7) {      
      if (key=='h'||key=='H') {
        fill (farbeH);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==8) {      
      if (key=='i'||key=='I') {
        fill (farbeI);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==9) {      
      if (key=='j'||key=='J') {
        fill (farbeJ);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==10) {      
      if (key=='k'||key=='K') {
        fill (farbeK);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==11) {      
      if (key=='l'||key=='L') {
        fill (farbeL);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==12) {      
      if (key=='m'||key=='M') {
        fill (farbeM);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==13) {      
      if (key=='n'||key=='N') {
        fill (farbeN);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==14) {      
      if (key=='o'||key=='O') {
        fill (farbeO);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==15) {      
      if (key=='p'||key=='P') {
        fill (farbeP);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==16) {      
      if (key=='q'||key=='Q') {
        fill (farbeQ);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==17) {      
      if (key=='r'||key=='R') {
        fill (farbeR);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==18) {      
      if (key=='s'||key=='S') {
        fill (farbeS);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==19) {      
      if (key=='t'||key=='T') {
        fill (farbeT);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==20) {      
      if (key=='u'||key=='U') {
        fill (farbeU);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==21) {      
      if (key=='v'||key=='V') {
        fill (farbeV);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==22) {      
      if (key=='w'||key=='W') {
        fill (farbeW);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==23) {      
      if (key=='x'||key=='X') {
        fill (farbeX);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==24) {      
      if (key=='y'||key=='Y') {
        fill (farbeY);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
    if (i==25) {      
      if (key=='z'||key=='Z') {
        fill (farbeZ);
        rect(15, 560, breite*counters[i], hoehe); //rect(i*30+15, 560, breite, hoehe);
        text(counters[i], textBeginn, 550); // text(counters[i], i*30+25, 550); //zeigt die Anzahl an
        //text(alphabet.charAt(i), i*30+25, 530); // Zeigt den Buchstaben an
      }
    }
  }

  //--------------------------------------------------------------------------------------------

  // Für jeden einzelnen Buchstaben im Text...
  for (int i=0; i < myText.length (); i++) {
    char letter = myText.charAt(i);  //Buchstabe
    char c = myText.charAt(i);
    float letterWidth = textWidth(letter);  //Breite des Letters
    textSize(fontSize);
    textAlign(LEFT);
    switch (letter) {
    case '\n':
      translate (-margin*50, 40);
      //translate (-(margin+x)+margin, 40);
      break;
    }

    //----------------------------------------------------------------------
    // Wähle Zeichen an Position 'i' aus
    //...//

    // Wenn Zeichen ein 'e' ist...
    if (c == searchChar) {
      // Wenn dies nicht das erste 'e' ist...
     // if (lastEx > +1) {
        if (key=='a'||key=='A') {
          stroke (farbeA);
        }
        if (key=='b'||key=='B') {
          stroke (farbeB);
        }
        if (key=='c'||key=='C') {
          stroke (farbeC);
        }
        if (key=='d'||key=='D') {
          stroke (farbeD);
        }
        if (key=='e'||key=='E') {
          stroke (farbeE);
        }
        if (key=='f'||key=='F') {
          stroke (farbeF);
        }
        if (key=='g'||key=='G') {
          stroke (farbeG);
        }
        if (key=='h'||key=='H') {
          stroke (farbeH);
        }
        if (key=='i'||key=='I') {
          stroke (farbeI);
        }
        if (key=='j'||key=='J') {
          stroke (farbeJ);
        }
        if (key=='k'||key=='K') {
          stroke (farbeK);
        }
        if (key=='l'||key=='L') {
          stroke (farbeL);
        }
        if (key=='m'||key=='M') {
          stroke (farbeM);
        }
        if (key=='n'||key=='N') {
          stroke (farbeN);
        }
        if (key=='o'||key=='O') {
          stroke (farbeO);
        }
        if (key=='p'||key=='P') {
          stroke (farbeP);
        }
        if (key=='q'||key=='Q') {
          stroke (farbeQ);
        }
        if (key=='r'||key=='R') {
          stroke (farbeR);
        }
        if (key=='s'||key=='S') {
          stroke (farbeS);
        }
        if (key=='t'||key=='T') {
          stroke (farbeT);
        }
        if (key=='u'||key=='U') {
          stroke (farbeU);
        }
        if (key=='v'||key=='V') {
          stroke (farbeV);
        }
        if (key=='w'||key=='W') {
          stroke (farbeW);
        }
        if (key=='x'||key=='X') {
          stroke (farbeX);
        }
        if (key=='y'||key=='Y') {
          stroke (farbeY);
        }
        if (key=='z'||key=='Z') {
          stroke (farbeZ);
        }

        // Berechne die Entfernung zwischen
        // diesem und dem vorigen 'e'
      /*  float space = x + margin - lastEx;
        space = space / 2;
        // Zeichne Kurve zwischen beiden 'e's
        noStroke();
        //strokeWeight (1);
        // fill (farbeE);
        noFill ();
        bezier (lastEx+6, base+3, lastEx+6, base + 3 + space, 
        x + margin+6, base + 3 + space, x + margin+6, base + 3);
        */
      };

      // Merke die Position des akuellen
      // 'e's als 'lastEx'
     // lastEx = margin + x;
    //}

    //----------------------------------------------------------------------
    // Füllfarbe abhängig vom Buchstaben
    if (c == searchChar) {
      noStroke();
      if (key=='a'||key=='A') {
        fill (farbeA);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='b'||key=='B') {
        fill (farbeB);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='c'||key=='C') {
        fill (farbeC);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='d'||key=='D') {
        fill (farbeD);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='e'||key=='E') {
        fill (farbeE);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='f'||key=='F') {
        fill (farbeF);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='g'||key=='G') {
        fill (farbeG);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='h'||key=='H') {
        fill (farbeH);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='i'||key=='I') {
        fill (farbeI);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='j'||key=='J') {
        fill (farbeJ);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='k'||key=='K') {
        fill (farbeK);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='l'||key=='L') {
        fill (farbeL);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='m'||key=='M') {
        fill (farbeM);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='n'||key=='N') {
        fill (farbeN);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='o'||key=='O') {
        fill (farbeO);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='p'||key=='P') {
        fill (farbeP);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='q'||key=='Q') {
        fill (farbeQ);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='r'||key=='R') {
        fill (farbeR);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='s'||key=='S') {
        fill (farbeS);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='t'||key=='T') {
        fill (farbeT);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='u'||key=='U') {
        fill (farbeU);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='v'||key=='V') {
        fill (farbeV);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='w'||key=='W') {
        fill (farbeW);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='x'||key=='X') {
        fill (farbeX);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='y'||key=='Y') {
        fill (farbeY);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
      if (key=='z'||key=='Z') {
        fill (farbeZ);
        rect (x+margin, base-hoehe, letterWidth, hoehe);
      }
    }
    else {
      fill (undef); // Achtung färbt auch den eigentlichen Text ein
    }
  

noStroke ();
// Buchstaben darstellen
text (c, margin+x, base);
//text (myText.charAt(c), posX, posY);
// Den Zeichen-'cursor' nach 
// rechts verschieben...
x = x + textWidth (c);
}

// bei String eine Variable für Zeilenaufteilung... // 
/*for (int i = 0; i < myText.length(); i++) {
  float posY = 40;
  float posX =0;
  posX += textWidth(myText.charAt(i));
  if (posX >= width-100) {
    posY += 40;
    posX = 0;
  }
}*/
//------------------------------------    



} 
//-------------------------------------------------


void countCharacters() {
  for (int i = 0; i < myText.length(); i++) {
    // get one char from the text, convert it to a string and turn it to uppercase
    String s = str(myText.charAt(i)).toUpperCase();
    // convert it back to a char
    char uppercaseChar = s.charAt(0);
    // get the position of this char inside the alphabet string
    int index = alphabet.indexOf(uppercaseChar);
    // increase the respective counter
    if (index >= 0) counters[index]++;
    //println(counters);
  }
}

//-------------------------------------------------

void keyPressed() {
  searchChar = key;

  if (keyCode == CONTROL) 
    saveFrame(timestamp()+".jpg");
}


void keyReleased () {
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


