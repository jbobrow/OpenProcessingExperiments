
//Declare image variable
PImage bg;

void setup() {
  size(820, 820);
  smooth();
  noLoop();
  //Load image 'bg'
  bg = loadImage("paper.png");
}

void draw() {
  //Draw image
  image(bg, 0, 0);

  translate(width/2, height/2);
  for (int i=0; i < 360; i++) {
    rotate (radians (2));
    noFill();
    stroke(225);
    ellipse(200, 200, 100 , 100);
  }
  
   for (int i=0; i < 360; i++) {
    rotate (radians (2));
    noFill();
    stroke(225);
    ellipse(125, 125, random(20, 80), 50);
  }
  
  for (int i=0; i < 360; i++) {
    rotate (radians (10));
    noFill();
    stroke(160);
    ellipse(50, 50, 20, 100);
  }
  
  for (int i=0; i < 360; i++) {
    rotate (radians (2));
    noFill();
    stroke(190);
    ellipse(800, 800, 100, 100);
  }
}

