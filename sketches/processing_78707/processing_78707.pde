
void setup(){
  size (800,800);
  background(229,49,163);
  frameRate(5);
}

void draw(){

  //background(240,106,178);
   
PFont letra;

letra=loadFont("DialogInput-48.vlw");

textFont (letra);

fill(229,49,163,24);

textSize(100);

rect(0,0,width,height);

fill(0);

text("S",5,400);
text("A",5,400);
text("M",5,400);
text("A",5,400);
text("N",5,400);
text("T",5,400);
text("H",5,400);
text("A",5,400);
}
