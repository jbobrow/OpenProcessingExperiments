
import rita.*;

RiGrammar rg;
RiText rt;

int i = 1;
int u = 1;

void setup() {

  size(800,600);

  rg = new RiGrammar();
  rg.loadFile("grammar.json", this);
  //rg.openEditor(400,200);
  String s = rg.expand();
  
  rt = new RiText(this, s, width/30*u, height/60*i);
  rt.textSize(13);
  rt.align(LEFT);
  rt.text(s);
}

void draw() {

  background(255);
  RiText.drawAll();
}

void mouseClicked() {
  i = i+1;
  if (i>=60) {
    i = 1;
    u = u+14;
  }
  setup();
}
 


