
PImage duck;
float scaler = 1;

void setup() {
  size(640, 480);
  smooth();
  duck = loadImage("duck.gif");
  imageMode(CENTER);
}

void draw() {
  background(255);

  //Let's check the direction of the mouse, this frame.
  if (mouseX - pmouseX > 0) {
    scaler = -1.0;
  } 
  else if (mouseX - pmouseX < 0) {
    scaler = 1.0;
  }
  
  pushMatrix();
  translate(mouseX, mouseY); //Translate the duck to mouseX,mouseY
  scale(scaler, 1.0);
  image(duck, 0, 0); //Render the duck at 0,0
  popMatrix();
}



