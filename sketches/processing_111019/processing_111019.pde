
PImage img;
PImage showImage;
int imgIndex = 1;
float bg = 255;
color c;

void setup() {
  size(640, 415,P2D);  //=grösse der Bilder in Pixel
  newImage(); //bild laden
  showImage = createImage(640, 415, RGB);  //hier werden die veränderten Pixel hingeschrieben
  frameRate(10);
}

void draw() {
  bg = map(mouseY,0,height,0,255);  //hintergrundfarbe abhängig von mouseY
  //loop über alle pixel im bild
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      c = img.get(i, j);  //farbe des aktuellen pixels
      //wenn helligkeit von c grösser als grenze, die von mouseX bestimmt wird     
      if (255-brightness(c) > map(mouseX,0,width,0,256)) {   
        showImage.set(i, j, color(bg)); //ggf. ersetzen durch Hintergrundfarbe
      } 
      else {
        showImage.set(i, j, c); //sonst normale Farbe des Pixels aus dem Bild übernehmen
      }
    }
  }
  image(showImage, 0, 0); //Bild anzeigen
}

void mousePressed() {
  newImage(); //neues Bild laden
}

void newImage() {
  imgIndex = (imgIndex+1)%5;
  img = loadImage("img"+(imgIndex+1)+".jpg");
}



