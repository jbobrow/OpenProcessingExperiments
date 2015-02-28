
PImage img;
PImage img2;


void setup () {
  size (320, 320);
  background (255);
  smooth();
  img = loadImage ("http://gamesnet.vo.llnwd.net/o1/gamestar/objects/124006_main.jpg");
  img2 = loadImage ("http://theidfc.files.wordpress.com/2009/01/big_lebowski_007.jpg");
  frameRate(25);
}

int frame = 0;
int v = 160;
int y = 160;
int z = 0;

void draw () {
  if (frame < 301) { 

    frame++;
    if (frame > 0) {
      if (frame < 100) {
        fill(255, 0, 0);
        ellipse (width/2, height/2, 100, 100);
      }
    }

    if (frame > 100) {
      if (frame < 150) {
        background (255);
        fill(0, 0, 255);
        ellipse (width/2, height/2, 100, 100);
      }
    }

    if (frame > 150) {
      if (frame < 155) {
        background (255);
        imageMode (CENTER);
        image (img, width/2, height/2);

        if (frame == 154) {
          background (255);
        }
      }
    }

    if (frame > 155) {
      if (frame < 205) {
        fill (255, 0, 255);
        rectMode (CENTER);
        rect (v, height/2, 50, 50);
        rect (y, height/2, 50, 50);
        v= v - 5;
        y= y + 5;
      }
    }

    if (frame > 205) {
      if (frame < 299) {
        z++;
        line(0, z, width, z);
      }
    }

    println("frame = " + frame);
    println("v = " + v);


    if (frame == 300) {
      imageMode (CENTER);
      image (img2, width/2, height/2);
    }

    if (mousePressed) {
      colorMode(RGB, 255);
      background (255);
      v = 160;
      y = 160;
      frame = 1;
    }
  }
}


                
                
