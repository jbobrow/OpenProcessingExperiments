
import ddf.minim.*;

Minim myMinim;
AudioPlayer player;
PImage img;
PFont font;

void setup(){
  size(1600, 1063);
//myMinim = new Minim(this); 
//player = myMinim.loadFile("conquest.mp3");
  font = loadFont("ACaslonPro-Regular-48.vlw");
  img = loadImage("band.jpg");
  image(img,0,0);
//player.loop();
}

void draw(){
}

void mousePressed(){
  color argb = color(get(mouseX,mouseY));
  int x1 = (argb >> 16) & 0xFF;
  if ( x1 > 154 )
    fill(255,204,0,random(150,255));
  else
    fill(153,0,0,random(150,255));
  textFont(font);
  text("USC",mouseX,mouseY);
}


