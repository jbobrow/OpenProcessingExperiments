
PFont font;
//----------------------------------
//Farben Annett

int farbeA = color(0, 0, 0);
int farbeB = color(176, 100, 0);
int farbeC = color(192, 192, 192);
int farbeD = color(200, 152, 0);
int farbeE = color(112, 136, 216);
int farbeF = color(110, 100, 80);
int farbeG = color(120, 150, 170);
int farbeH = color(184, 204, 184);
int farbeI = color(248, 252, 200);
int farbeJ = color(224, 228, 208);
int farbeK = color(0, 108, 64); 
int farbeL = color(176, 160, 144);
int farbeM = color(0, 100, 0);
int farbeN = color(24, 108, 80);
int farbeO = color(184, 0, 0);
int farbeP = color(120, 100, 88); 
int farbeQ = color(176, 176, 176);
int farbeR = color(96, 48, 0); 
int farbeS = color(232, 224, 8);
int farbeT = color(160, 152, 152);
int farbeU = color(145, 72, 0);
int farbeV = color(0, 104, 72); 
int farbeW = color(40, 120, 88); 
int farbeX = color(112, 164, 136); 
int farbeY = color(200, 205, 0); 
int farbeZ = color(144, 168, 120);

int farbe0 = color(208, 188, 176);
int farbe1 = color(176, 212, 208);
int farbe2 = color(225, 200, 0);
int farbe3 = color(30, 105, 65);
int farbe4 = color(144, 16, 40);
int farbe5 = color(170, 132, 72);
int farbe6 = color(0, 50, 95);
int farbe7 = color(144, 156, 32);
int farbe8 = color(104, 0, 0);
int farbe9 = color(55, 100, 120);


//----------------------------------

int undef=  color(255);
int transparent=55;
int transparent2= 255;

String[] lines;
String myText;

int posX;
int posY;
int formX;
int formY;
int base;
int breite;
int hoehe;

void setup() {
  size(1000, 800);
  lines = loadStrings("Genesis_DEU.txt");
  myText = join(lines, " ");

  font = createFont("Courier", 8);
}


void draw() {

  textFont(font);
  background(255);
  noStroke();
  fill(255);
  smooth();

  posX = 5;
  posY = 20;
  formX=posX;
  formY=posY;
  base=5;
  breite = 5;
  hoehe= 5;

  for (int i = 0; i < myText.length(); i++) {
    String s = str(myText.charAt(i)).toUpperCase();
    char uppercaseChar = s.charAt(0);
    switch (myText.charAt(i)) {
    case '.': 
    case ':':
    case ',': 
    case ';': 
    case '?':
    case '"':
    case'-':
    case '!': 
      fill (undef);
      rect(formX, formY-base, breite, hoehe);
      break;
    case 'a':
    case 'A':
      fill((farbeA), transparent2);
      rect(formX, formY-base, breite, hoehe);
      break;
    case 'ä':
    case 'Ä':
      fill((farbeA), transparent2);
      rect(formX, formY-base, breite, hoehe);
      break;
    case 'b':
    case 'B':
      fill((farbeB), transparent);     
      rect(formX, formY-base, breite, hoehe); 
      break;
    case 'c':
    case 'C':
      fill((farbeC), transparent);
      rect(formX, formY-base, breite, hoehe);  
      break;
    case 'd':
    case 'D':
      fill((farbeD), transparent);
      rect(formX, formY-base, breite, hoehe);  
      break;
    case 'e':
    case 'E':
      fill((farbeE), transparent2);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'f':
    case 'F':
      fill((farbeF), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'g':
    case 'G':
      fill((farbeG), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'h':
    case 'H':
      fill((farbeH), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'i':
    case 'I':
      fill((farbeI), transparent2);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'j':
    case 'J':
      fill((farbeJ), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'k':
    case 'K':
      fill((farbeK), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'l':
    case 'L':
      fill((farbeL), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'm':
    case 'M':
      fill((farbeM), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'n':
    case 'N':
      fill((farbeN), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'o':
    case 'O':
      fill((farbeO), transparent2);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'ö':
    case 'Ö':
      fill((farbeO), transparent2);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'p':
    case 'P':
      fill((farbeP), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'q':
    case 'Q':
      fill((farbeQ), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'r':
    case 'R':
      fill((farbeR), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 's':
    case 'S':
      fill((farbeS), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 't':
    case 'T':
      fill((farbeT), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'u':
    case 'U':
      fill((farbeU), transparent2);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'ü':
    case 'Ü':
      fill((farbeU), transparent2);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'v':
    case 'V':
      fill((farbeV), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'w':
    case 'W':
      fill((farbeW), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'x':
    case 'X':
      fill((farbeX), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'y':
    case 'Y':
      fill((farbeY), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    case 'z':
    case 'Z':
      fill((farbeZ), transparent);
      rect(formX, formY-base, breite, hoehe);      
      break;
    default: 
      fill(undef);
      rect(formX, formY-base, breite, hoehe);      
      break;
    }
    text(myText.charAt(i), posX, posY);
    posX += textWidth(myText.charAt(i));
    formX +=textWidth(myText.charAt(i));
    if (posX >= width-150 && uppercaseChar == ' ') {
      posY += 5;
      posX = 5;
      formY += 5;
      formX = 5;
    }
  }
}
//--------------------------------------------------------

void keyReleased() {
  if (keyCode == CONTROL) 
    saveFrame(timestamp()+".jpg");
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


