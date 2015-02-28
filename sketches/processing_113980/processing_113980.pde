
String[] lines = loadStrings("http://deus.irceline.be/~celinair/rbc/trafic/ixelles.txt");

PFont f;

void setup(){
 
  size(400,200);
  f = createFont ("Arial",16,true);
  f = loadFont("ArialMT-48.vlw");
}

void draw() {
  background(0);
  textFont (f,36);
  fill(255);
 for (int i=0; i < lines.length; i++) {text(lines[2],40,80);}
 for (int i=0; i < lines.length; i++) {text(lines[3],40,140);}
}



