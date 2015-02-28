

PFont font;

void setup(){
  size(800, 800);

font = loadFont ("CharlemagneStd-Bold-48.vlw");
textFont (font);
}

void draw(){
  background(252, 105, 105);
fill(15, 131, 111);
text("Hola, esto es texto en Processing. Hola, esto es texto en Processing.Hola, esto es texto en Processing.Hola, esto es texto en Processing.Hola, esto es texto en Processing. Hola, esto es texto en Processing. Hola, esto es texto en Processing. Hola, esto es texto en Processing.", 0, 150, mouseX, 500);
}


