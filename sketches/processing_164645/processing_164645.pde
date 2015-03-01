
//declare
ArrayList<Heart> hearts;

//pics 
PImage brain;
PImage bg;

//sounds
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import processing.video.*;

AudioPlayer player;
AudioPlayer bump;
Minim minim;

// octopus
int numSegments = 20;
float[] x = new float[numSegments];
float[] y = new float[numSegments];
float[] angle = new float[numSegments];
float segLength = 26;
float targetX, targetY;
int posMouse;

void setup() {
  size(800, 600);
  brain = loadImage ("brain.png");
  bg = loadImage ("bg.png");

  minim = new Minim(this);
  player = minim.loadFile("Backlight.mp3", 2048);
//  bump = minim.loadFile("Bubble.mp3", 2048);
  player.play();

  //octopus
  strokeWeight(20.0);
  stroke(255, 100);
  x[x.length-1] = width/2;     // Set base x-coordinate
  y[x.length-1] = height;      // Set base y-coordinate

  //Initialize arraylist
  hearts = new ArrayList();

  //draw heart
  for (int i = 0; i < 21; i ++) {
    for (int j = 0; j < 5; j++) {
      hearts.add(new Heart(i, j));
    }
  }
}

void draw() {

  //draw background
  image(bg, 0, 0);
  //sounds
//  if (keyPressed) {
//    player.play();
//  }  

  //draw octopus
  //posMouse = int(map(mouseY, 0, 600, 30, 0));
  //octopus start//////////////////////////////////////////////
  reachSegment(0, mouseX, mouseY);
  for (int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for (int i=numSegments - 1; i>=1; i--) {
    positionSegment(i, i-1);
  } 
  for (int i=0; i<numSegments - 1; i++) {
    segment(x[i], y[i], angle[i], (i+1)*1.2);
  }
  //octopus end//////////////////////////////////////////////

  //draw brain
  image(brain, width/2 - brain.width/6, height - brain.height/3, brain.width/3, brain.height/3);

  for(int i = 0; i < hearts.size(); i++){
    Heart h = hearts.get(i);
    h.update();
    h.displayHeart();
  }
  
  //check collision
  for(int i = 0; i < hearts.size(); i++){
    Heart h = hearts.get(i);
    strokeWeight(10);
    //point(h.posX + h.heart.width/10, h.posY + h.heart.height/10);
    if(dist(mouseX, mouseY, h.posX + h.heart.width/10, h.posY + h.heart.height/10) < h.heart.width/10){
//      bump.play();
      hearts.remove(i);
      i--;
    }
  }
}

//octopus start//////////////////////////////////////////////
void positionSegment(int a, int b) {
  x[b] = x[a] + cos(angle[a]) * segLength;
  y[b] = y[a] + sin(angle[a]) * segLength;
}

void reachSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
//octopus end//////////////////////////////////////////////





class Heart {
  float posX;
  float posY;
  float originX;
  float originY;
  PImage heart;

  Heart(int i, int j) {
    heart = loadImage("heart.png");
    posX = i * heart.width/5 + 30;
    posY = j * heart.height/5 + 20;
    originX = posX;
    originY = posY;
  }
  
  void update() {
    posX = originX + random(-2, 2);
    posY = originY + random(-1, 1);
  }

  void displayHeart() {
    image(heart, posX, posY, heart.width/5, heart.height/5);
  }
}



