
PFont font;
//----------------------------------
//Farben Jibiel

int farbeA = color(255,255,0);
int farbeB = color(150,180,225);
int farbeC = color(255,195,67);
int farbeD = color(150,180,225);
int farbeE = color(255,92,70);
int farbeF = color(175,255,85);
int farbeG = color(152,112,235);
int farbeH = color(246,245,245);
int farbeI = color(246,245,245);
int farbeJ = color(255,111,180);
int farbeK = color(120,215,100); 
int farbeL = color(255,218,40);
int farbeM = color(150,180,225);
int farbeN = color(235,255,78);
int farbeO = color(246,245,245);
int farbeP = color(152,112,235);
int farbeQ = color(246,245,245);
int farbeR = color(190,116,116);
int farbeS = color(250,250,122);
int farbeT = color(150,180,225);
int farbeU = color(222,93,93);
int farbeV = color(113,230,120);
int farbeW = color(222,93,93); 
int farbeX = color(236,240,244);
int farbeY = color(222,93,93);  
int farbeZ = color(245,227,105);

int farbeSZ = color(250,250,170);

int farbeMin = color(175,175,245); //?-=_<>"/\()
int farbePlus = color(255,111,180); //€^+&
int farbeNum = color(182,170,167); //#:;,.

int farbe0 = color(246,245,245);
int farbe1 = color(236,240,244);
int farbe2 = color(250,250,122);
int farbe3 = color(255,111,180);
int farbe4 = color(235,255,105);
int farbe5 = color(150,180,225);
int farbe6 = color(255,111,180);
int farbe7 = color(215,85,235);
int farbe8 = color(220,255,175);
int farbe9 = color(167,110,90);



//----------------------------------

int undef=  color(255);
int transparent=255;
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
    fill (farbeNum);
      rect(formX, formY-base, breite, hoehe);
      break;
    case '?':
    case '"':
    case'-':
    fill (farbeMin);
      rect(formX, formY-base, breite, hoehe);
      break;
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


