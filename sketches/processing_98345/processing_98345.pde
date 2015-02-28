
var audioElement = document.createElement("audio");
PImage foto;
PImage picture;


void setup() {
  size(615,413);
  foto = loadImage ("astronauta.png");
  picture = loadImage ("space_feature.jpg");


}

void draw() {
  fill(0,6);
  rect(0,0,width,height);
  image(picture,0,0,615,413);
  noCursor();
  image(foto,mouseX,mouseY,200,224);
}

void mousePressed(){
  audioElement.setAttribute("src","AUD0001.mp3");
  audioElement.play();
}


