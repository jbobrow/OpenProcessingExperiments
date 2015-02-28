

//Pedro Veneziano, March 1st, Creative Computing B, Benjamin Bacon
 
/* @pjs preload= "pose1.png"; */
/* @pjs preload= "pose2.png"; */
/* @pjs preload= "pose3.png"; */
/* @pjs preload= "pose4.png"; */
/* @pjs preload= "interface.png"; */
/* @pjs preload= "recalque.png"; */
 
  color fundo = color(230);
  PImage pose;
  PImage recalque;
  PImage interf;
  int x1 = 60;
  int y1 = 35;
  int x1ind = 10;
  int x2 = 640;
  int y2 = 35;
  int x2ind = 640;
  int x3 = 60;
  int y3 = 665;
  int x3ind = 60;
  int x4 = 640;
  int y4 = 665;
  int x4ind = 640;

void setup() {
  size(700,700);
  smooth();
  imageMode(CENTER);
  pose = loadImage("pose1.png");
  recalque = loadImage("recalque.png");
  interf = loadImage("interface.png");
}

void draw() {
  background(fundo);
//  rect(30,40,50,50);
  fill(255,0,0);
  noStroke();
  image(recalque, x1, y1);
  if(mousePressed && mouseX <= 350 && mouseY <=350) {
    if(x1ind <= 270) {
      x1 = x1 + 10; y1 = y1 + 10; x1ind = x1ind + 10;
    }
    else {
      if(x1ind > 270) {
        x1 = x1 - 10; y1 = y1 + 10;
      }
    }
  }
  image(recalque, x2, y2);
  if(mousePressed && mouseX > 350 && mouseY <=350) {
    if(x2ind > 400) {
      x2 = x2 - 10; y2 = y2 + 10; x2ind = x2ind - 10;
    }
    else {
      if(x2ind <=400) {
        x2 = x2 + 10; y2 = y2 + 10;
      }
    }
  }
  image(recalque, x3, y3);
  if(mousePressed && mouseX <= 350 && mouseY > 350) {
    if(x3ind <= 300) {
      x3 = x3 + 10; y3 = y3 - 10; x3ind = x3ind + 10;
    }
    else {
      if(x3ind > 300) {
        x3 = x3 - 10; y3 = y3 - 10;
      }
    }
  }
  image(recalque, x4, y4);
  if(mousePressed && mouseX > 350 && mouseY > 350) {
    if(x4ind > 400) {
      x4 = x4 - 10; y4 = y4 - 10; x4ind = x4ind - 10;
    }
    else {
      if(x4ind <= 400) {
        x4 = x4 + 10; y4 = y4 - 10;
      }
    }
  }
  
  image(pose, 350, 350);
  image(interf, 350, 350);
}

void keyPressed() {
  if(key == 'q'){ pose = loadImage("pose1.png"); }
  if(key == 'w'){ pose = loadImage("pose2.png"); }
  if(key == 'e'){ pose = loadImage("pose3.png"); }
  if(key == 'r'){ pose = loadImage("pose4.png"); }
  if(key == 't'){ fundo = color(random(0,255),random(0,255),random(0,255)); }
}


