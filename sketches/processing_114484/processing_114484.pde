
//Student name: Siu Ho Wun
//SID: 52623053
import ddf.minim.*;
Minim minim;
AudioSample music2;
AudioPlayer music;
PImage img1, img2, img3, img4;

void setup()
{
  background(255, 230, 3);
  size(600, 600);
  imageMode(CENTER); // image put into the centre og the window
  img1 = loadImage("bear1.png");// load the image
  img2 = loadImage("bear2.png");
  img3 = loadImage("flower.png");
  img4 = loadImage("tie.png");
  minim = new Minim(this);
  music2 = minim.loadSample("tinkle.mp3");// sound effect when pressing on the button
  music = minim.loadFile("backgroundmusic.mp3"); // background music
  music.play();
  music.loop(); // loop the background music
}

void draw()
{
  noStroke();
  fill(255, 10, 129);
  ellipse (300, 300, 500, 500); // the background 
  music.play();
  image(img1, 300, 280); 

  if (keyPressed) { // if 'a' on the keyboard is pressed, the screen will create the image flower
    if (key=='a')music2.trigger();
    {
      image(img2, 300, 280);
      image(img3, 300, 250);
    }
      if (key=='b') { // if 'b' is pressed, the bowtie will
    image(img2, 300, 280);
    image(img4, 300, 230);
    }
}
}







