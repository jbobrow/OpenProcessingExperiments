
PGraphics falling;
PGraphics piling;
PGraphics piling2;

import ddf.minim.*;
PImage [] pictures;
PImage foot;
PImage foot2;
Leafs [] leaf =new Leafs[10000];
boolean leavesfall = false;
PFont myFont;

Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioInput input;

String letter = "Kasa Kasa Zawa Zawa";

void setup() {
  size(1920, 1060);
  frameRate(20);
  background(0);

  piling = createGraphics(1920, 80);
  falling = createGraphics(1920, 980);


  

  pictures = new PImage[4];
  pictures[0] = loadImage("leave0.png");
  pictures[1] = loadImage("leave1.png");
  pictures[2] = loadImage("leave2.png");
  pictures[3] = loadImage("leave3.png");
  for (int i = 0; i < 1000; i++ ) {
    float x = 0;
    float y = 0;
    while (dist (width/2, height/3, x, y) > 750) {
      x = random(0, 10000);
      y = random(0, 0);
    }
    leaf [i] = new Leafs (x, y, pictures[int(random(0, 4))]);
  }

  minim = new Minim(this);
  player = minim.loadFile("sound.mp3");
  input = minim.getLineIn();

  myFont = createFont("AppleBraille", 22);
  foot = loadImage("foot.png");
  foot2 = loadImage("foot2.png");
}

  

void keyPressed() {
  image(foot,random(1920),random(80,960));
  image(foot2,random(1920),random(80,960));
  minim = new Minim(this);
  player2 = minim.loadFile("step.mp3");
  input = minim.getLineIn();
  player2.play();
  
}

void draw() {
  falling.beginDraw();
  falling.background(0);
  falling.endDraw();
  
  piling.beginDraw();
  piling.background(0);
  piling.endDraw();

  image(piling, 0, 0);
  image(falling, 1920, 480);


  for (int i = 0; i < 300; i++) {
    leaf[i].display();
    if (mousePressed) {
      leavesfall = true;
      player.loop();
    }
    if (leavesfall) {
      leaf[i].fall();
    }
  }
}


class Leafs {
  float xpos;
  float ypos;
  float yspeed;
  float xspeed;
  float rot;
  PImage turnedLeaf;

  Leafs (float xIn, float yIn, PImage choose) {
    xpos = xIn;
    ypos = yIn;
    turnedLeaf = choose;
    yspeed = random(1, 4);
    xspeed = 4*cos(xIn);
    rot = 0;
  }

  void display () {
    pushMatrix();
    translate(xpos, ypos);
    rotate(rot);
    image(turnedLeaf, 0, 0, 20, 20);
    popMatrix();
  }

  void fall () {
    ypos = ypos + yspeed;
    xpos = xpos + xspeed;
    if (ypos > height-20) {
      yspeed = 0;
      xspeed = 0;
      for (int i = 0; i < 1000; i++ ) {
        float x = 0;
        float y = 0;
        while (dist (width/2, height/3, x, y) > 750) {
          x = random(0, 10000);
          y = random(0, 0);
        }
        leaf [i] = new Leafs (x, y, pictures[int(random(0, 4))]);
      }
    }
    if (ypos < height-20) {
      rot = random(0, PI);
    }
  }
}












