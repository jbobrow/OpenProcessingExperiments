
PImage foto;

var audioElement = document.createElement("audio");

void setup() {
  size(800, 800);
  imageMode(CENTER);
  foto=loadImage("nyan.png");
}

void draw() {
  background(#000099);
  image(foto, mouseX, mouseY);
}

//So amb el ratoli
void mousePressed() {
audioElement.setAttribute("src", "nyanso.mp3");
audioElement.play();
}

//CANÇO SENCERA 1!11!!111!!!
/*
void mousePressed() {
audioElement.setAttribute("src", "nyancat.mp3");
audioElement.play();
}
*/



