
//Li Cheuk Hin 53077582 assignment 4
PImage img;
int d=285;
import ddf.minim.*;

Minim minim;
AudioSample coin;
AudioPlayer bgsound;

void setup() {

  size(800, 300);
  minim = new Minim(this);
  coin = minim.loadSample("coin.mp3");
  bgsound = minim.loadFile("mario.mp3");
  bgsound.loop();
  img = loadImage("23.gif");
  //http://www.haoxinshu.com/files/article/attachment/2/2228/1414444/23.gif
}

void draw() {
  background(60, 100, 200);

  fill(230, 200, 0);
  noStroke();
  quad(200, 130, 600, 130, 1500, 450, -700, 450);
  fill(0);

  ellipse(width/2, 200, 200, 70);
  ellipse(160, 200, 200, 70);
  ellipse(640, 200, 200, 70);

  image(img, d, 0, 200, 200);
}

void keyPressed() {

  d=floor(random(0, 3));
  if (d==0)                     
    d=45;
  else if (d==1)
    d=285;
  else
    d=525;
  coin.trigger();
}


