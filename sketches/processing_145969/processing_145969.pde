
int r, g, b;
String sentence ; 
boolean pressedKey;
void setup()
{
  size(800, 600);
  smooth();
}

void draw()
{
  background(r, g, b);

  //Intro
  fill(255);
  textAlign(CENTER);
  sentence="Synesthesia is a neurological phenomenon \n";
  sentence += "in which stimulation of one sensory \n ";
  sentence+= "or cognitive pathway leads to automatic, \n";
  sentence += "involuntary experiences in a second sensory \n";
  sentence+= "or cognitive pathway.\n\n";
  sentence+= "I am myself a synesthete, and I see numbers and letters \n ";
  sentence+= "in colour. Press on any key to experience.";

  textSize(12);
  text( sentence, width/2, height/2);
  
  textSize(20);
  text(key, width/2, 200);
  
}
 

void keyReleased()
{  
  
 switch ( key ) {
  case 'a':
    r = 95;
    g = 13;
    b = 6;
    break;
  case 'b':
    r = 16;
    g = 141;
    b = 222;
    break;
  case 'c':
    r = 255;
    g = 158;
    b = 0;
    break;
  case 'd':
    r = 250;
    g = 0;
    b = 96;
    break;
  case 'e':
    r = 0;
    g = 0;
    b = 255;
    break;
  case 'f':
    r = 27;
    g = 206;
    b = 37;
    break;
  case 'g':
    r = 106;
    g = 62;
    b = 7;
    break;
  case 'h':
    r = 237;
    g = 55;
    b = 45;
    break;
  case 'i':
    r = 198;
    g =198;
    b =198;
    break;
  case 'j':
    r = 6;
    g =196;
    b =17;
    break;
  case 'k':
    r = 255;
    g =0;
    b =0;
    break;
  case 'l':
    r = 88;
    g =53;
    b =0;
    break;
  case 'm':
    r = 9;
    g =95;
    b =15;
    break;
  case 'n':
    r = 7;
    g = 104;
    b = 180;
    break;
  case 'o':
    r = 67;
    g = 67;
    b = 67;
    break;
  case 'p':
    r = 255;
    g = 64;
    b = 122;
    break;
  case 'q':
    r = 193;
    g = 4;
    b = 86;
    break;
  case 'r':
    r = 52;
    g = 29;
    b = 2;
    break;
  case 's':
    r = 26;
    g = 78;
    b = 8;
    break;
  case 't':
    r = 4;
    g = 9;
    b = 126;
    break;
  case 'u':
    r = 247;
    g = 140;
    b = 147;
    break;
  case 'v':
    r = 255;
    g = 193;
    b = 36;
    break;
  case 'w':
    r = 255;
    g = 143;
    b = 3;
    break;
  case 'x':
    r = 170;
    g = 169;
    b = 168; 
    break;
  case 'y':
    r = 255;
    g = 171;
    b = 13;
    break;
  case 'z':
    r = 85;
    g = 85;
    b = 85;
    break;
  case '1':
    r = 200;
    g = 200;
    b = 200;
    break;
  case '2':
    r = 2;
    g = 170;
    b = 31;
    break;
  case '3':
    r = 9;
    g = 115;
    b = 219;
    break;
  case '4':
    r = 255;
    g = 205;
    b = 0;
    break;
  case '5':
    r = 255;
    g = 0;
    b = 0;
    break;
  case '6':
    r = 255;
    g = 0;
    b = 119;
    break;
  case '7':
    r = 54;
    g = 28;
    b = 1;
    break;
  case '8':
    r = 111;
    g = 2;
    b = 234;
    break;
  case '9':
    r = 234;
    g = 135;
    b = 5;
    break;
  case '0':
    r = 240;
    g = 240;
    b = 240;
    break;
  default:
    r = 0;
    g = 0;
    b = 0;
    break;
  }
}



