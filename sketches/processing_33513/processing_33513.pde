
PImage b;
int posX;
int posY;




void setup() {
  size(500, 500);
  b = loadImage("eye.png");
  background(0, 153, 204);
  // Tint blue
  tint(0, 153, 204); 
  image(b, 125, 125);
  smooth();
}

/* Draw to Stage*/
void draw() {
  frameRate(30);
  filter(BLUR, .58);
  noStroke();

  posX = mouseX-(mouseX);
  posY = mouseY-(mouseY);


  if (mousePressed == true) {
    noFill();
    stroke(RGB);


    stroke(RGB);
    line(235, 245, pmouseX, pmouseY);
  } 
  else {
  }

  print("Dilation: Click and draw a circle around the illuminati eye as quickly as possible. A pupil will appear as well as an iris. The pupil will eventually expand filling the entire screen");
}


