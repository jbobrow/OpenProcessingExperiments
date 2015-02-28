
import ddf.minim.*;

AudioPlayer ap;
Minim minim;


//image
PImage cover;
PImage album;

void setup() {
  
  size(900, 600);
  background(0);

  smooth();
  minim = new Minim(this);
  ap = minim.loadFile("pink2.mp3");
  ap.loop();
  
  //load cover
  cover = loadImage("cover.jpg");
  album = loadImage("album.jpg");
  
}

void draw() {
  
  float bgc1 = random(192, 255);
  float bgc2 = random(0, 128);
  float bgc3 = random(0, 128);

  float level = ap.mix.level();

  float rectW = (level * width)/2;
  float rectW2 = (level * width)/4;
  float colour = (level * width);

  
  for (int i = 0; i < 700; i = i+200) {
  for (int j = 0; j < 700; j = j+200) {
    fill(255,255,bgc1,64);
    rect(i-rectW/2, j-rectW/2, rectW, rectW);
  }
}

  for (int i = 100; i < 700; i = i+200) {
  for (int j = 100; j < 700; j = j+200) {
    fill(255,255,bgc2,64);
    rect(i-rectW/2, j-rectW/2, rectW, rectW);
  } 
}
  for (int i = 100; i < 700; i = i+200) {
  for (int j = 0; j < 700; j = j+200) {
    fill(0,195,255,64);
    ellipse(i, j , rectW2, rectW2);
  }
}

  for (int i = 0; i < 700; i = i+200) {
  for (int j = 100; j < 700; j = j+200) {
    fill(255,119,bgc3,64);
    ellipse(i, j , rectW2, rectW2);
  } 
}

image(album, 600, 0);
image(cover, 600,300);
}

