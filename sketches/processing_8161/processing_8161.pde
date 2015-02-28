
import ddf.minim.*;

int leftmargin = 10;
int rightmargin = 20;
String buff = "";
String buff2 = "";
boolean didntTypeYet = true;
ArrayList tapecolumns;
float rPos;
float fontY = 50;

Minim minim;
AudioSample snare;

void setup() {
  size(840, 360, P3D);

  PFont font = createFont("ALPNMAIN.TTF", fontY);
  textFont(font, fontY);
  tapecolumns = new ArrayList();

  minim = new Minim(this);
  snare = minim.loadSample("Kick-Drum-5.wav", 2048);
  if ( snare == null ) println("Didn't get snare!");
}

void draw() {
  background(176);
  rPos = textWidth(buff2) + leftmargin;
  
  if(didntTypeYet) {
    fill(0);
    text("Use the keyboard...", 22, fontY);
  }
  
  fill(0);
  //printing text
  pushMatrix();
  translate(rPos,10+35);
  char k;
  for(int i = 0;i < buff2.length(); i++) {
    k = buff2.charAt(i);
    translate(-textWidth(k),0);
    text(k,0,0);
  } 
  popMatrix();
  for (int i=0; i<tapecolumns.size(); i++) {
    TapeColumn tpc = (TapeColumn)tapecolumns.get(i);
    tpc.draw();
  }
}

void keyPressed() {
  char k = (char)key;

  //z malej na duza litere !!!
  String temp = Character.toString(k).toUpperCase();
  k = temp.charAt(0);

  String decoded = char2Tape(k);
  //println(k + " int: " + (int)k + " decoded: " + decoded);
  
  if (decoded.length() > 0) {
    snare.trigger();
    switch(k) {
      case 8:
      if(buff2.length()>0) {
        buff2 = buff2.substring(1);
        //deleting circles from array by backspace
        tapecolumns.remove(tapecolumns.size() - 1);
      }
      break;
      
      case 10: //LF
      break;
      case 13: //CR
      break;
      case 127: //DEL
      break;
      case 27: //SUB
      break;
      
      default:
      if(textWidth(buff2+k)+leftmargin < width-rightmargin){
        didntTypeYet = false;
        buff2 = k + buff2;
        TapeColumn c = new TapeColumn(rPos,255,decoded);
        tapecolumns.add(c);
      }
      break;
    }
  }
}

String char2Tape(char k) {
  String fin = "";
  String input = Integer.toBinaryString(k);
  int len = input.length();
  //print("Len: "+ len +  " " + input + " Fin: ");

  if (len > 7) {
    fin = "";
  }
  else {
    int suma = 0;
    for (int i = 0;i<len;i++) {
      buff=Character.toString(input.charAt(i));
      //checking numbers of '1'
      suma = suma + Integer.parseInt(buff);
    }
    int parity = suma%2;     

    //missing '0' to 8bits
    for (int i = 0;i<7 - len;i++) {
      fin = fin + "0";
    }
    fin = parity + fin + input;
  }
  return fin;
}


class TapeColumn {
  public float x, y;
  public String input;
  
  public TapeColumn(float x, float y,String input ) {
    this.x = x;
    this.y = y;
    this.input = input;
  }
  
  public void draw() {
    float y2 = y;
    for(int i = 0;i<8;i++) {
      if (input.charAt(i) == '1') {
        ellipse(x, y2, 15, 15);       
      }     
      y2 = y2 - 20;
      //the smallest line of circles
      if ( i == 4) {
        //smooth();
        ellipse(x, y2, 9, 9);       
        y2 = y2 - 20;
      }
    }
  }
}



