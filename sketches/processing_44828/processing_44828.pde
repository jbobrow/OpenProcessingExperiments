
//loading up variables + images with the sound
PImage img;
PFont font1; 
import ddf.minim.*;
AudioPlayer player;
Minim minim;
float y = 50;
float speed = 6;
float radius = 3;
float radius2 = 2;


 // setting up sound, size, font and images
void setup () {
  img = loadImage("waves.jpg");
  size(700, 525, P2D);
  image(img, 0, 0);
 font1= loadFont("RageItalic-100.vlw");
  textFont(font1);
  minim = new Minim(this);
  player = minim.loadFile("waves.mp3");
  player.play();
  ellipseMode(RADIUS);
  smooth ();
  frameRate(3600);
}
 //putting in text to show that it is kinda part of the tree
void draw () {
  fill(#C9F6FF);
  noStroke();
  rect(0, 450, 700, 50);
  textFont(font1);
  textSize(40);
  fill(0);
  text("lebanon 2010, enjoy it", 340, 482);
  //text moves along with mouse
  strokeWeight(random(3));
  stroke(255, 30);
  frameRate(100);
  fill(255,1);
  rect(0, 0, width, height);
  fill(#037C93);
  ellipse(mouseX, mouseY, radius, radius);
  noFill();
  stroke(0);
  ellipse(mouseX, mouseY, radius2, radius2);

}
//if you click mouse, image will appear
void mouseClicked(){
  image(img, 0, 0);
}
  
  //music stops
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}




 




