

PImage pistes;
PImage esquiii;
PImage snow;

var audioElement=document.createElement("audio");

void setup() {
  noCursor();

  // Minim minim;
  //AudioPlayer daSound;



  size(300, 300 );
  pistes = loadImage("pistes.jpg");
  esquiii = loadImage("esquiii.jpg");
  snow = loadImage("snow.jpg");
}


void draw () {

  image(pistes, 0, 0, width, height);
  if (mousePressed==true) {

    image(esquiii, mouseX, mouseY);
  }
  else {
    image(snow, mouseX, mouseY);
  }
}


void mousePressed() {
  if (mousePressed==true) {
    audioElement.setAttribute("src", "nature021.mp3");
    audioElement.play();
  }
}



