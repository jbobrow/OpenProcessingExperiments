
import ddf.minim.*;
Minim minim;
AudioPlayer player;


chicken[] chickenlist = new chicken[3];
PImage ima2;

void setup() {
  size(900, 500);
  for (int i=0; i < chickenlist.length; i++) {
    chickenlist[i] = new chicken(random(width), random(height), random(5,10), random(5,10));
  }
  minim = new Minim(this);
  ima2 = loadImage("hand03.png");
 }

void draw() {
  background(255);
  for (int i=0; i < chickenlist.length; i++) {
    chickenlist[i].move();
    chickenlist[i].bounce();
    chickenlist[i].display();
  };
  imageMode(CORNER);
  image(ima2, mouseX, mouseY);
 
}

void keyPressed() {
  if (key == ' ') {
    loop();
  }
}

class chicken {
  float x;
  float xs;
  float y ;
  float ys;
  PImage ima;
  
  chicken(float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) {
    x=tempXpos;
    y=tempYpos;  
    xs=tempXspeed;
    ys=tempYspeed;
  }

  void move() {
    x += xs;
    y += ys;
  }

  void bounce() {
    if ((x > (width)) || (x < 0) ) {
      xs = xs * -1;
     }
    if ((y > (height)) || (y < 0)) {
      ys = ys * -1;
    }
  }

  void display() {
    imageMode(CENTER);
    if ( (mousePressed == true) && ((mouseX) < (x+72.5)) && ((mouseX) > (x-72.5)) 
      && ((mouseY) < (y+114.5)) && ((mouseY) > (y-114.5))) {
      player = minim.loadFile("cluck3.wav", 2048);
      player.play();
      ima=loadImage("FG.png");
      noLoop();
    } 
    else {
      ima=loadImage("G.png");
    }
    image(ima, x, y);
  }
}


