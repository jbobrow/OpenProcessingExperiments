
import ddf.minim.*;
PImage bkg, imgPig, imgCow, imgBird, imgPig1, imgCow1, imgBird1;
float pigX, pigY, cowX, cowY, birdX, birdY;

Minim minim;
AudioSample bird;
AudioSample pig;
AudioSample cow;
AudioPlayer bkgsound;

void setup() {
  size(400, 400);
  minim = new Minim(this);
  imageMode(CENTER);
  bkg = loadImage("bkg.png");
  pigX = 100;
  pigY = 300;
  cowX = 300;
  cowY = 300;
  birdX = 280;
  birdY = 150;
  imgPig = loadImage("pig1.png");
  imgPig1 = loadImage("pig2.png");
  imgCow = loadImage("cow1.png");
  imgCow1 = loadImage("cow2.png");
  imgBird = loadImage("bird1.png");
  imgBird1 = loadImage("bird2.png");
  bird = minim.loadSample("bird.mp3");
  pig = minim.loadSample("pig.mp3");
  cow = minim.loadSample("cow.mp3");
  bkgsound = minim.loadFile("bkgsound.mp3");
  bkgsound.loop();
}

void draw() {
  frameRate(10);
  image(bkg, 200, 200);
  pigX+=random(-3, 3);
  pigY+=random(-3, 3);
  pigX = constrain(pigX, 10, 100);
  pigY = constrain(pigY, height/2-200, height-100);
  cowX+=random(-3, 3);
  cowY+=random(-3, 3);
  cowX = constrain(cowX, 300, width-10);
  cowY = constrain(cowY, height/2-200, height-100);
  birdX+=random(-3, 3);
  birdY+=random(-3, 3);
  birdX = constrain(birdX, 200, width-10);
  birdY = constrain(birdY, 100, 150);
  image(imgPig, pigX, pigY);
  image(imgCow, cowX, cowY);
  image(imgBird, birdX, birdY);

  if (mousePressed) {

    if (mouseX<200 && mouseY>200) {
      pig.trigger();
      image(imgPig1, pigX, pigY);
    }
    else if (mouseX>200 && mouseY>200) {
      cow.trigger();
      image(imgCow1, cowX, cowY);
    }
    else if (mouseX>200 && mouseY<200) {
      bird.trigger();
      image(imgBird1, birdX, birdY);
    }
  }
}

void keyPressed() {
  if (key == 'b' || key == 'B') {
    bird.trigger();
  }
  else if (key == 'p' || key =='P') {
    pig.trigger();
  }
  else if (key == 'c' || key =='C') {
    cow.trigger();
  }
}

// Audio resources are from http://www.freesfx.co.uk

