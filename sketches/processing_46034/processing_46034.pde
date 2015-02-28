
float speed= 2.5;
int diameter= 20;
float x;
float y;
PImage nirvana;
int value = 0;
PImage nir;
PImage uno;
PImage dos;


import ddf.minim.*;

AudioPlayer player;
Minim minim;


void setup() {
  size(599,526, P2D);
  smooth();
  fill(136, 227, 101);
  x= width/2;
  y= height/2;
  minim = new Minim(this);
player = minim.loadFile("come.mp3", 1024);
player.play();
}
 
void draw() {
  nirvana = loadImage ("nirvana.jpg");
  nir = loadImage ("nir.jpg");
  uno = loadImage ("uno.jpg");
  dos = loadImage ("dos.jpg");
  image (nirvana, 0, 0);
  x+= random (-speed, speed);
  y+= random (-speed, speed);
  image (nir, x, y, 100, 80);
  fill(value);
  rect(x, y, 100, 80);
  
}

void stop()
{
player.close();
minim.stop();

super.stop();
}

void keyPressed() {
  if (value == 0) {
    value = 295;
    image (uno, x, y, 100, 80);
  fill(value);
  rect(x, y, 100, 80);
  
  } else { 
      value = 0;
      
    }
  }
  
void keyReleased() {
  if (value == 0) {
    value = 295;
    image (dos, x, y, 100, 80);
    fill(value);
    rect(x, y, 100, 80);
    
  } else {
    value = 0;
    
  }
}

