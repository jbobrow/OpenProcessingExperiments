
import interfascia.*;

GUIController c;
IFTextField t;
IFLabel l;
IFLookAndFeel theLook;
PFont f;
String paragraph;
char[] para = new char[29];
int[] lsizes = new int[29];
float[] asize = new float[29];
float top;

void setup() {
  size(900, 450);
  f = loadFont("TrebuchetMS-48.vlw");
  background(0);
  theLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);


  
  paragraph = "";
  c = new GUIController(this);
  t = new IFTextField("Text Field", 325, 360, 250);

 
  
  c.add(t);

  c.setLookAndFeel(theLook);
  t.addActionListener(this);
  
}

void draw() {
  fill(255);
  textFont(f);
  textFont(f, 20);
  text("Please type a small paragraph in the box and press enter.", 195, 420);
}

void actionPerformed(GUIEvent e) {
  if (e.getMessage().equals("Completed")) {
    paragraph = t.getValue();
    paragraph.toLowerCase();
    para = paragraph.toCharArray();
    
    //*set all values in lsizes[] to 0*//
    
    //*run through array to check for number of times for each letter*//
    for (int i = 0; i < paragraph.length(); i++) {
      if (para[i] == 'a') {
        lsizes[0] = lsizes[0] + 1;
      }
      else if (para[i] == 'b') {
        lsizes[1] = lsizes[1] + 1;
        println(lsizes[1]);
      }
      else if (para[i] == 'c') {
        lsizes[2] = lsizes[2] + 1;
      }
      else if (para[i] == 'd') {
        lsizes[3] = lsizes[3] + 1;
      }
      else if (para[i] == 'e') {
        lsizes[4] = lsizes[4] + 1;
      }
      else if (para[i] == 'f') {
        lsizes[5] = lsizes[5] + 1;
      }
      else if (para[i] == 'g') {
        lsizes[6] = lsizes[6] + 1;
      }
      else if (para[i] == 'h') {
        lsizes[7] = lsizes[7] + 1;
      }
      else if (para[i] == 'i') {
        lsizes[8] = lsizes[8] + 1;
      }
      else if (para[i] == 'j') {
        lsizes[9] = lsizes[9] + 1;
      }
      else if (para[i] == 'k') {
        lsizes[10] = lsizes[10] + 1;
      }
      else if (para[i] == 'l') {
        lsizes[11] = lsizes[11] + 1;
      }
      else if (para[i] == 'm') {
        lsizes[12] = lsizes[12] + 1;
      }
      else if (para[i] == 'n') {
        lsizes[13] = lsizes[13] + 1;
      }
      else if (para[i] == 'o') {
        lsizes[14] = lsizes[14] + 1;
      }
      else if (para[i] == 'p') {
        lsizes[15] = lsizes[15] + 1;
      }
      else if (para[i] == 'q') {
        lsizes[16] = lsizes[16] + 1;
      }
      else if (para[i] == 'r') {
        lsizes[17] = lsizes[17] + 1;
      }
      else if (para[i] == 's') {
        lsizes[18] = lsizes[18] + 1;
      }
      else if (para[i] == 't') {
        lsizes[19] = lsizes[19] + 1;
      }
      else if (para[i] == 'u') {
        lsizes[20] = lsizes[20] + 1;
      }
      else if (para[i] == 'v') {
        lsizes[21] = lsizes[21] + 1;
      }
      else if (para[i] == 'w') {
        lsizes[22] = lsizes[22] + 1;
      }
      else if (para[i] == 'x') {
        lsizes[23] = lsizes[23] + 1;
      }
      else if (para[i] == 'y') {
        lsizes[24] = lsizes[24] + 1;
      }
      else if (para[i] == 'z') {
        lsizes[25] = lsizes[25] + 1;
      }
      else if (para[i] == ',') {
        lsizes[26] = lsizes[26] + 1;
      }
      else if (para[i] == '!') {
        lsizes[27] = lsizes[27] + 1;
      }
      else if (para[i] == '.') {
        lsizes[28] = lsizes[28] + 1;
      }
    }
    
    //*run through sizes and find largest value*//
    for (int y = 0; y < 29; y++) {
      if (lsizes[y] > top) {
        top = lsizes[y];
       
      }
    }
    
    //*Calculate font sizes*//
    for (int z = 0; z < 29; z++) {
        asize[z] = (( lsizes[z] / top ) * 80);
        println(asize[z]);
    }
    
    //*display letters*//
    textAlign(CENTER);
    textFont(f, asize[0]);
    text("a", 90, 80);
    
    textFont(f, asize[1]);
    text("b", 140, 80);
    
    textFont(f, asize[2]);
    text("c", 190, 80);
    
    textFont(f, asize[3]);
    text("d", 240, 80);
    
    textFont(f, (asize[4]));
    text("e", 290, 80);
    
    textFont(f, (asize[5]));
    text("f", 340, 80);
    
    textFont(f, (asize[6]));
    text("g", 390, 80);
    
    textFont(f, (asize[7]));
    text("h", 440, 80);
    
    textFont(f, (asize[8]));
    text("i", 490, 80);
    
    textFont(f, (asize[9]));
    text("j", 540, 80);
    
    textFont(f, (asize[10]));
    text("k", 590, 80);
    
    textFont(f, (asize[11]));
    text("l", 640, 80);
    
    textFont(f, (asize[12]));
    text("m", 690, 80);
    
    textFont(f, (asize[13]));
    text("n", 740, 80);
    
    textFont(f, (asize[14]));
    text("o", 790, 80);
    
    textFont(f, (asize[15]));
    text("p", 190, 160);
  
    textFont(f, (asize[16]));
    text("q", 240, 160);
    
    textFont(f, (asize[17]));
    text("r", 290, 160);
    
    textFont(f, (asize[18]));
    text("s", 340, 160);
    
    textFont(f, (asize[19]));
    text("t", 390, 160);
    
    textFont(f, (asize[20]));
    text("u", 440, 160);
    
    textFont(f, (asize[21]));
    text("v", 490, 160);
    
    textFont(f, (asize[22]));
    text("w", 540, 160);
    
    textFont(f, (asize[23]));
    text("x", 590, 160);
    
    textFont(f, (asize[24]));
    text("y", 640, 160);
    
    textFont(f, (asize[25]));
    text("z", 690, 160);
    
    textFont(f, (asize[26]));
    text(",", 390, 240);
    
    textFont(f, (asize[27]));
    text("!", 440, 240);
    
    textFont(f, (asize[28]));
    text(".", 490, 240);
     
    noLoop();
  }
}



