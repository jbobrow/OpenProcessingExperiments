
//----------------------------------------------
class Letter {

  //Farben Annette
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
  int undef=  color(255);
  //---
  int hoehe = 80;
  int breite = 80;
  float letter_width = 80;          // Width of the letter
  float x=-letter_width;         
  float y=10;                    

  float y_pos = y;
  char letter_key;
  float size_offset;
  float transparent;
  float x1;
  float y1;
  float fade_rate;

  //Buchstabenverhalten
  Letter(char constr_key, int size_offset) {
    this(constr_key, size_offset, int(height), int(width), fade_speed/2); // (?, schriftgröße (size_offset),random(width-20)
  } 
  Letter(char constr_key, int size_offset, float x1, float y1, float fade_rate) {
    this.letter_key = constr_key;
    this.size_offset = size_offset;
    this.transparent = 255;
    this.x1 = x1;
    this.y1 = y1;
    this.fade_rate = fade_rate;
  }

  // Buchstaben und Farben auf die Buehne holen
  void display() {
    fill((0), transparent);
    textFont(font, fontsize);    //textFont(font, fontsize+size_offset);
    text(letter_key, x+90, y_pos+50); //text auf die bühne mit dem versatz 
    translate(40, 0);//translate(letter_width, 0); //die übertragung auf jeden buchstaben
    transparent-= fade_rate; 
    //---
    switch (letter_key) {
    case 'a':
      fill((farbeA), transparent);
      rect(x, y_pos, breite, hoehe);
      break;
    case 'b':
      fill((farbeB), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'c':
      fill((farbeC), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'd':
      fill((farbeD), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'e':
      fill((farbeE), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'f':
      fill((farbeF), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'g':
      fill((farbeG), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'h':
      fill((farbeH), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'i':
      fill((farbeI), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'j':
      fill((farbeJ), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'k':
      fill((farbeK), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'l':
      fill((farbeL), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'm':
      fill((farbeM), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'n':
      fill((farbeN), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'o':
      fill((farbeO), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'p':
      fill((farbeP), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'q':
      fill((farbeQ), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'r':
      fill((farbeR), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 's':
      fill((farbeS), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 't':
      fill((farbeT), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'u':
      fill((farbeU), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'v':
      fill((farbeV), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'w':
      fill((farbeW), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'x':
      fill((farbeX), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'y':
      fill((farbeY), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    case 'z':
      fill((farbeZ), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    default:
      fill((undef), transparent);
      rect(x, y_pos, breite, hoehe);      
      break;
    }
  }

  // buchtaben verschwinden
  boolean gone() {
    if (transparent < 10) {
      return true;
    } 
    else {
      return false;
    }
  }
}
//------------------------------------------------------------
//--------------------Ende Class------------------------------
//------------------------------------------------------------

int htg = color(255);   // Hintergrundfarbe

ArrayList keys; // Stores key strokes
PFont font;
int fontsize = 30; //Schriftgröße
float fade_speed = 4; // die zeit, bis die buchstaben verschwinden
int multiples = 0;

//---

void setup() {
  size (1000, 100);
  noStroke();
  colorMode(RGB);
  //----
  font = loadFont("GillSansMT-Bold-48.vlw");
  textFont(font, fontsize);

  //----
  keys = new ArrayList();
}

//---

void draw() {
  background(htg);
  smooth();


  //Buchstaben auto backspace
  for (int i = 0; i <= keys.size()-1; i++) {
    Letter temp_letter = (Letter) keys.get(i);
    temp_letter.display();
    if (temp_letter.gone()) {
      keys.remove(i);
    }
  }
}

//------------------------------------
void keyPressed() {
  for (int i = 0; i <= multiples; i++) {
    Letter pressed_letter = new Letter((char) key, 1);
    keys.add(pressed_letter);
  }

  //Speichern
  if (keyCode == CONTROL) 
    saveFrame(timestamp()+".jpg");
}



// zeitstempel datei
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}








