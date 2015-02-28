
PImage MauerNeu;
PImage RoterTropfen;
PImage GruenerTropfen;
PImage BlauerTropfen;


void setup() {
  size(632, 467);
  frameRate(60);
  smooth();
  RoterTropfen = loadImage ("RoterTropfen.png");
  GruenerTropfen = loadImage ("GruenerTropfen.png");
  BlauerTropfen = loadImage ("BlauerTropfen.png");

}


void draw() {
      background(loadImage("MauerNeu.jpg"));
      strokeWeight(10);
      stroke(200, 20, 20, 130);
      line(130, -10, 130, 90);
      line(70, -10, 70, 30);
      strokeWeight(14);
      stroke(50, 200, 0, 130);
      line(360, -10, 360, 130);


//sekunden
stroke(200, 20, 20, 130);
strokeWeight(18);
line(100, -50, 100, second()*7.5+10);
image (RoterTropfen, 82,second()*7.5);



//minuten
stroke(0, 180, 0, 110);
strokeWeight(22);
line(300, -50, 300, minute()*8+22);
image (GruenerTropfen, 280,minute()*8);


//stunden
stroke(0,50, 200, 100);
strokeWeight(30);
line(500, -50, 500, hour()*8+30);
image (BlauerTropfen, 470, hour()*8);
  
}

