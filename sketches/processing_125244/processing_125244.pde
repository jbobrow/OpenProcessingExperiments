
PFont Junge;
boolean pause;

void setup() {
  size(500, 500); 
  pause = false;
  Junge = loadFont("Junge-Regular-30.vlw");
}

String texte="mouse = ";

void draw() {
  background(100);
  fill(200);
  textLeading(30);
  textFont(Junge);
  String chaine = nf(hour(),2)+" : "+nf(minute(),2)+" : "+nf(second(),2);
  text(chaine, mouseX, mouseY);
}

void mouseClicked() {
  if (pause==false) {
    loop();
    pause = true;
  }
  else {
    noLoop();
    pause = false;
  }
}

