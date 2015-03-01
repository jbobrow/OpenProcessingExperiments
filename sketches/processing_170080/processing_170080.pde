
String[] bushLines;
String[] johnsonLines;
String[] fdrLines;

String[] poemLines;

float[] randBush;
float[] randJohnson;
float[] randFDR;

int j;
int k;
int a;

boolean canDraw = true;

void setup() {
  size(800, 600);
  background(250);
  frameRate(12);
  k = 1;
  a = 255;

  bushLines = loadStrings("data/bushLines");
  johnsonLines = loadStrings("data/johnsonLines");
  fdrLines = loadStrings("data/rooseveltLines");

  poemLines = new String[bushLines.length];

  print(bushLines.length);

  for (int i = 0; i < bushLines.length; i++) {

    if (i == 0) j = 0;
    if (i > 0) {
      j++;
    }
    int r = (int)(random(3));
    if (r == 0) {
      poemLines[i] = bushLines[j];
    } else if (r == 1) {
      poemLines[i] = johnsonLines[j];
    } else {
      poemLines[i] = fdrLines[j];
    }
    if (k < bushLines.length-1) k++;
  }
}

void draw() {
  background(250);


  if (canDraw) { 
    write();
  }

  noStroke();
  fill(255, 255, 255, a);
  rect(0, 0, width, height/2);
  a -= 5;
}

void write() {
  fill(0);
  textSize(16);
  text("Good Morning America", 10, 20);

  for (int i = 0; i < poemLines.length; i++) { //display
    fill(0);
    textSize(12);
    if (i == 0) {
      text(poemLines[i], 10, 60 + (30*i));
    } else if (i > 0 && i < 4) {
      text(poemLines[i], 10, 80+(30*i));
    } else {
      text(poemLines[i], 10, 90+(30*i));
    }
    fill(0, 150);
    
    if (i == poemLines.length) canDraw = false;
  }
  if(a < 0) text("(Applause.)", 500+random(-45, 45), 150+(30*poemLines.length)+random(-45, 45));

  text("co-written by Theodore Roosevelt, Lyndon B. Johnson & George W. Bush\nedited & developed by Pierre Depaz", 10, height-30);
  text("click to wake up anew", width-140, height-30);

  //canDraw = false;
}


void mousePressed() {
  setup();
  draw();
}



