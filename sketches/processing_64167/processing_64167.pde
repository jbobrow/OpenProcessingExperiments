
// Variable mit dem Namen f vom Typ PFont für Text
PFont f;

void setup() {
  size(500,500);
  background(255);
  smooth();
  
  // farbe für text
  fill(0);
  
  // fontsize
  textSize(48);
  
  // font laden 
  // (muss im data folder liegen, wird erzeugt mit Tools->create Font
  f = loadFont("Arial-Black-48.vlw");
  
  // font wird gesetzt
  textFont(f, 48); 
  
  // zeilenanstand
  textLeading(48);
  
  // variable vom Typ String für den Text
  String myText = "Hellooo....\nChristoph";
  
  // text wird angezeigt an der stelle 
  // x=100, y=100, breite=400, höhe=400
  text(myText, 100, 100, 400, 400);  
}

