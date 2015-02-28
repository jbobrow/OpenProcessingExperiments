
PImage tree;
PImage [] pictures;
Leafs [] leaf = new Leafs[400];
boolean leavesfall = false;



void setup() {
  size(600, 600);
  frameRate(20);
  tree = loadImage("tree.png");
  pictures = new PImage [4];
  pictures[0] = loadImage("redleaf.png");
  pictures[1] = loadImage("brownleaf.png");
  pictures[2] = loadImage("orangeleaf.png");
  pictures[3] = loadImage("greenleaf.png");
  for (int i = 0; i < 400; i++ ) { 
    float x = 0;
    float y = 0;
    while (dist (width/2, height/3, x, y) > 250) {
      x= random(20, 580);
      y= random(20, 375);
    }
    leaf [i] = new Leafs (x, y, pictures[int(random(0, 4))]);
  }
}

void draw() {
  background(255);
  image(tree, 0, 0, 600, 600);  

  //  ellipse(400, 300, 700, 550);

  for (int i = 0; i < 300; i++) {    
    leaf[i].display();
    if (mousePressed) {
      leavesfall = true;
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
    xspeed = 2*cos(xIn);
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
    }
    if (ypos < height-20) {
      rot = random(0, PI);
    }
  }
}



