
PImage eyeless;
PImage eyeedited1;
PImage eyeedited2;
PImage mouth;
PImage floateye1;
PImage hands;


void setup() {
  frameRate(15);
  eyeless = loadImage("eyeless.png");
  eyeedited1 = loadImage("eyeedited1.jpg");
  eyeedited2 = loadImage("eyeedited2.jpg");
  mouth = loadImage("mouth.png");
  floateye1 = loadImage("mouth.png");
  hands = loadImage("hands.png");
  int horizon= 800;
  int vert= 800;
  size(800, 800);
}




void draw() {


  float mx = constrain(mouseX, 337, 355);
  float my = constrain(mouseY, 310, 355);
  float mx1 = constrain(mouseX, 442, 455);
  float my2 = constrain(mouseY, 322, 355);
  float ss= constrain (height, 0, 800);




  image(eyeless, 0, -0);


  image (eyeedited1, mx, my, 40, 40);
  image(eyeedited2, mx1, my2, 40, 40);
  smooth();


  if (mousePressed == true) {
    image (mouth, 365, 470, 100, 150) ;
    image (hands, 650, 400, 150, 150);
    text("TRICK", (200), random(800));
    fill(255, 0, 0);
    text("OR", (400), random(200));
    fill(255, 0, 0);
    text("TREAT?", (600), random(800));
    fill(255, 0, 0);
  }
  else {


    image (mouth, 365, 500, 100, 50);


    text("HAPPY", (200), random(800));
    fill(255, 0, 0);
    text("HALLOWEEN", (600), random(800));
    fill(255, 0, 0);
  }
}

