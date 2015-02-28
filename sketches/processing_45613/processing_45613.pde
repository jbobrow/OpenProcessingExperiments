



  PImage kathy;
PImage kata;
float speed=2.5;
int diameter=20;
float x;
float y;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup () {
  size (334,450);
  kathy = loadImage("kathy.jpg");
 kata = loadImage("kata.jpg");
  smooth();
  x = width/2;
  y = height/2;
  minim = new Minim (this);
  player = minim.loadFile("the beatles - abbey road - oh! darling.mp3",2048);
  player.play();
}

void draw (){
  image(kathy,0,0);
  
  
  x +=random(-speed,speed);
  y +=random(-speed,speed);
  image(kata,70,0,x,y);
  
}

void stop()
{
  player.close();
  minim.stop();
  
  super.stop();
}
  
