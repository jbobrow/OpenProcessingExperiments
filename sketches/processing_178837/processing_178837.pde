
import ddf.minim.*;
import gifAnimation.*;

Minim minim;
AudioPlayer tune;
PImage[] test;
Gif snowman, santasack, treestar, santaflying, santaempty, treecuckoo, santasong, snowcarrot;

void setup(){
  size(420,230);
  frameRate(50);
  minim = new Minim(this);
  tune = minim.loadFile("jinglebells.mp3");
  snowman = new Gif(this, "snowman.GIF");
  santasack = new Gif(this, "santasack.GIF");
  treestar = new Gif(this, "treestar.GIF");
  santaflying = new Gif(this, "santaflying.GIF");
  santaempty = new Gif(this, "santaempty.GIF");
  treecuckoo = new Gif(this, "treecuckoo.GIF");
  santasong = new Gif(this, "santasong.GIF");
  snowcarrot = new Gif(this, "snowcarrot.GIF");
  snowman.loop();
  santasack.loop();
  treestar.loop();
  santaflying.loop();
  santaempty.loop();
  treecuckoo.loop();
  santasong.loop();
  snowcarrot.loop();
  test = Gif.getPImages(this, "snowman.GIF");
  tune.loop();
}

void draw(){
  background(255,255,255);
  image(snowman,10,10,100,100);
  image(santasack,110,10,100,100);
  image(treestar,210,10,100,100);
  image(santaflying,310,10,100,100);
  image(santaempty,10,120,100,100);
  image(treecuckoo,110,120,100,100);
  image(santasong,210,120,100,100);
  image(snowcarrot,310,120,100,100);

}
void keyPressed() {                        // test for keypad input
  if (key == 'q' || key == 'Q') {          // q for quiet
    tune.pause();
  }
  if (key == 'm' || key == 'M') {          // m for music
    tune.loop();
  }
}

