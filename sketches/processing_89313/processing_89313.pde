
PImage pug;
PImage wolf;
PImage err;
PFont Verdana;


void setup () {
  size (800, 800);
  background (75);
  pug = loadImage("steampugtrans.png");
  wolf = loadImage("tracks.png");
  err = loadImage("error.png");


  fill (255);//Instructions
  Verdana = loadFont("Verdana-20.vlw");
  textFont(Verdana, 20);
  text ("Draw by clicking or clicking and dragging", 50, 50);
  text ("Press 1, 2, 3, 4, or 5 to pick a brush type", 50, 70);
  text ("Hit SPACE to erase", 50, 90);

  frameRate (10);
}

void draw () {
}

void keyPressed () {
  if (key == ' ') {
    background (75);
    
  fill (255);//Instructions
  Verdana = loadFont("Verdana-20.vlw");
  textFont(Verdana, 20);
  text ("Draw by clicking or clicking and dragging", 50, 50);
  text ("Press 1, 2, 3, 4, or 5 to pick a brush type", 50, 70);
  text ("Hit SPACE to erase", 50, 90);

  frameRate (10);
  }
}

void mousePressed () {
    if (key == '1') {
    stroke (255);
    strokeWeight(15);
    line (mouseX, mouseY, pmouseX, pmouseY);
  }
    if (key == '2') {
    stroke(random(255), random(255), random(255));
    strokeWeight(15);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (key == '3') {
    image (pug, mouseX-35, mouseY-35);
  }
  if (key == '4') {
    image (wolf, mouseX-30, mouseY-30);
  }
  if (key == '5') {
    image (err, mouseX-150, mouseY);
  }
}

void mouseDragged () {
    if (key == '1') {
    stroke (255);
    strokeWeight(15);
    line (mouseX, mouseY, pmouseX, pmouseY);
  }
    if (key == '2') {
    stroke(random(255), random(255), random(255));
    strokeWeight(15);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  if (key == '5') {
   image (err, mouseX-150, mouseY);
 }
}



