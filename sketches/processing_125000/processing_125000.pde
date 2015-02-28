
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioInput input;

boolean dripPlaying = false;

PImage my_sea;  
PImage my_little_fish;
PImage my_big_fish;  

float bf_posx = 150.0;
float bf_posy = 520.0;
float lf_posx = (random(-200, -70));
float lf_posy = (random(100, 400));
Eye e1, e2;
color[] greens = {#A2FF07, #41E803, #05FF16, #03E854, #00FFA3, #20815D, #3D9200};

ArrayList<Frond> weed = new ArrayList<Frond>();
ArrayList <Fish> shoal = new ArrayList<Fish>();    // An arraylist for all the fishes


void setup() {
  size(960, 720);
  // this defines what image is called later on in the code
  my_sea = loadImage("background3.jpg");
  my_little_fish = loadImage("orange-fish2-right.png");
  my_big_fish = loadImage("little-big-fish.png");
  
  //set up music/sounds
  minim = new Minim(this);
  player = minim.loadFile("underwater3.mp3");
  player2 = minim.loadFile("dripping.mp3");
  player.loop();

  // this loads an image for the background
  background(my_sea);
  // puts the fish in
  image(my_big_fish, bf_posx, bf_posy);
  // puts the eyes in
  noStroke();
  e1 = new Eye( 230, 652, 15);
  e2 = new Eye( 307, 640,  15); 

  smooth();
 // put in weeds   
  for(int i = 0; i < 45; i++) {
    weed.add(new Frond(new PVector(random(0, width), 720)));
  }
}

void draw() {
    // this loads an image for the background
  background(my_sea);
  // puts the big fish in
  image(my_big_fish, bf_posx, bf_posy);
    // put in fishes
    shoal.add(new Fish(new PVector(lf_posx, random(100, 450))));
    
    for(int i = 0; i < 9; i++) {
    Fish fi = shoal.get(i);
    shoal.add(fi);
    // run fishes if not off screen
    if  (!fi.isGone()) {
    fi.run();
  }
  // or it will be taken out of the shoal array
   if (fi.isGone()) {
  shoal.remove(fi);
  }
  }
  
  //update  and display eyes
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);

  e1.display();
  e2.display();
  

//move weed
  for(Frond f : weed) {
    f.run();
  }
}


class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }
  // make the eye pupils move
  void display() {
    pushMatrix();
    translate(x, y);
    fill(255,153,51);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
} 
 
// parts of the weed 
class Frond {
  PVector pos; 
  PVector origpos;
  PVector dir; 
  int apex;
  int green = int(random(7));

  Frond(PVector l) {
    dir = new PVector(random(-0.2,0.2), 0);
    pos = l.get();
    origpos = l.get();
    apex = int(random(80, 200));
  }

  void run() {
    update();
    display();
  }
  // Method to update location, sway apex back and forth
  void update() {
  if (abs(pos.x- origpos.x)> 10) {
    dir.x = -dir.x;
  }
    pos.add(dir);
  }  
  
  // Method to display weed fronds
  void display() {
   noStroke();
    fill(greens[green], 80);
    beginShape();
    vertex(origpos.x-2.0,pos.y);
    vertex(pos.x, pos.y-apex);
    vertex(origpos.x+2.0,pos.y);
    endShape();
  }  
}

class Fish {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Fish (PVector l) {
    acceleration = new PVector(0.0008,0.0);
    velocity = new PVector(random(0.5,2.5),random(-0.2,0.2));
    location = l.get();
  }

  void run() {
    update();
    display();
  }
  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }  
  
  // Method to display
  void display() {
    image(my_little_fish, location.x, location.y);
  }
  
    // Is the fish gone? 
  boolean isGone() {
    if (location.x > 990) {
      return true;
    } else {
      return false;
    }
  }
}

void mouseClicked()
{
// if mouse clicked on big fish
    if (dist(mouseX, mouseY, (bf_posx + 72),( bf_posy + 99)) < 100) {

      // toggle other water sound off and on      
        dripPlaying = !dripPlaying;
  }
  if (dripPlaying) {
    player2.loop();
  } 
  else {

    player2.pause();
  }
}
      


