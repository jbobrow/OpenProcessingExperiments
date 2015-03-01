
//Fnal project
//Import 'Minim' liblary files
import ddf.minim.*;

//Global Variables
Minim minim;
AudioPlayer fps;

PImage fp;
PImage nasa2;
int x = 0;

//setup
void setup(){
  size (1000,600);
  minim = new Minim(this);
  fps = minim.loadFile("fps.mp3");
  fps.play();
  nasa2 = loadImage("nasa2.jpg");
  background(255);
}

//Draw
void draw(){
  nasa2 = loadImage("nasa2.jpg");
  image(nasa2, 0, 0 );
  int x1 = (int) random(100,900);
  int y1 = (int) random(50,550);

  int x2 = round(x1 + random(-10, 10));
  int y2 = round(y1 + random(-10, 10));

  int w = 30;
  int h = 30;

  copy(x1,y1, w,h, x2,y2, w,h);
  
  String t = "Click to see timeline";
  textAlign(LEFT);
  textSize(48);
  text(t, x, 500);
  x = x + 10 ;
    if (x > width) {
    x = 0;
  }
  if (mousePressed){
    fp = loadImage("fp.png");
    image(fp, 0, 0 );
  
  }
}


