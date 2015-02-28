
PImage bgImage;
PImage bgImageBlink;
PImage eye;
void setup() {
  size(600, 600);
  bgImage =loadImage("face.png");
  bgImageBlink =loadImage("face2.png");
  eye =loadImage("eye.png");
}

void draw() {
  background(153,153,153);
  

  noStroke();


  //left eye
  float leftXpos = constrain(map( mouseX, 0, 600, 210, 250), 210, 250);
  float leftYpos = constrain(map( mouseY, 0, 600, 255, 275), 255, 275);
  image(eye, leftXpos, leftYpos);

  //right eye 
  float rightXpos = constrain(map( mouseX, 0, 600, 340, 380), 340, 380);
  float rightYpos = constrain(map( mouseY, 0, 600, 255, 275), 255, 275);
  image(eye, rightXpos, rightYpos);

image(bgImage, 0, 0);


  //makes eyes blink
  if (mousePressed) {
    image(bgImageBlink, 0, 0);
  }
}



