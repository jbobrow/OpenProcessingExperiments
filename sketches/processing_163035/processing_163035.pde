
// 3 layers of parallax floating leaves
// by Birgit Bachler

// Leaf class adapted from
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 10-2: Bouncing Leaf class


//number of leaves in 3 layers
int bground = 22;
int mdground =33;
int frground = 11;

//array length = all layers together
int total = bground+mdground+frground;

//size of leaves in 3 layers
int bgsize = 25;
int mdsize = 50;
int frsize = 80;

//color array
//Initialize Color Array, colors by https://kuler.adobe.com/Retro-Rain-color-theme-2861967/
color[] colors= { 
  color(254, 67, 101, 240), 
  color(252, 157, 154, 240), 
  color(249, 205, 173, 240), 
  color(200, 200, 169, 240), 
  color(131, 175, 155, 240),
};

PVector loc;
PVector offset;

PImage leaf;


//leaf array
Leaf[] leaves;

void setup() {
  size(1280, 720);
  smooth();
  frameRate(25);
  //we fill the Leaf array backrgound, midground, foreground
  leaves = new Leaf[total];
  for (int i = 0; i < leaves.length; i++) {
    if (i < bground) {
      leaves[i] = new Leaf(bgsize);
    } else if (i < mdground+bground) {
      leaves[i] = new Leaf(mdsize);
    } else if (i >= mdground) {
      leaves[i] = new Leaf(frsize);
    }
  }

  //  
  leaf = loadImage("leaf.png"); // Public Domain leaf from http://en.wikipedia.org/wiki/Leaf#mediaviewer/File:Eenbruinigherfstblad.jpg
}

void draw() {
  background(255, 255, 236);

  // Move and display leaves
  for (int i = 0; i < leaves.length; i++) {
    leaves[i].move();
    leaves[i].display();
  }
  //saveFrame(“output-####.png”);
}


class Leaf {
  int size;
  float r;   // radius
  float x, y; // location
  float xspeed; // speed
  color bcolor; // color
  float rotation; //rotation


    // Constructor
  Leaf(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed =  map(r, bgsize, frsize, 2, 8);     //map the speed in x-direction based on the size/layer of the leaves
    bcolor = colors[(int) random(0, colors.length)];
    rotation = radians(random(360));
  }

  void move() {
    x += xspeed*mouseX/width; // Increment x
    y += map(mouseY, 0, height, -5, 5);

    // Check edges
    if (x > width+r || x < -r) {
      x= -r-random(width/2);
      y = random(height);
    }
    if (y > height+r || y < -r) {
      x= -random(width/2);
      y = random(height);
    }
    rotation+=radians(1);
  }
  // Draw the leaf
  void display() {
    noStroke();
    fill(bcolor);
    pushMatrix();
    translate(x, y);
    rotate(rotation);
    //Display the point
    tint(bcolor);
    image(leaf, 0, 0, r, r);
    popMatrix();
  }
}



