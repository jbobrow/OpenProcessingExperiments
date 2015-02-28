
PImage[] img = new PImage[13]; 
PImage d;
float jelly1X, jelly1Y, jelly2X, jelly2Y, jelly3X, jelly3Y, jelly4X, jelly4Y, jelly5X, jelly5Y, jelly6X, jelly6Y, jelly7X, jelly7Y, jelly8X, jelly8Y, jelly12X, jelly12Y, jelly13X, jelly13Y;
float speed = 3;

void setup() {
  size(400, 320); 
  background(255);
  for (int i = 0; i < 13; i ++) {
    img[i] = loadImage( i+".png");
    d = loadImage("dish1.png");
  }
}
void draw() {
  imageMode(CORNER);
  image(d, 20, 20);

  image(img[1], 188, 122);
  image(img[2], 108, 150);
  image(img[3], 143, 103);
  image(img[4], 248, 151);
  image(img[5], 140, 180);
  image(img[6], 194, 165);
  image(img[7], 241, 115);
  image(img[12], 211, 112);

  pushMatrix();
  jelly4X +=random(-speed, speed);
  jelly4Y +=random(-speed, speed);
  jelly4X = constrain(jelly4X, 138, 243);
  jelly4Y = constrain(jelly4Y, 110, 180);
  image(img[4], jelly4X, jelly4Y);
  popMatrix();

  pushMatrix();
  jelly13X +=random(-speed, speed);
  jelly13Y +=random(-speed, speed);
  jelly13X = constrain(jelly13X, 138, 243);
  jelly13Y = constrain(jelly13Y, 91, 190);
  image(img[0], jelly13X, jelly13Y);
  popMatrix();

  pushMatrix();
  jelly1X +=random(-speed, speed);
  jelly1Y +=random(-speed, speed);
  jelly1X = constrain(jelly1X, 138, 220);
  jelly1Y = constrain(jelly1Y, 160, 180);
  image(img[1], jelly1X, jelly1Y);
  popMatrix();

  pushMatrix();
  jelly2X +=random(-speed, speed);
  jelly2Y +=random(-speed, speed);
  jelly2X = constrain(jelly2X, 130, 150);
  jelly2Y = constrain(jelly2Y, 144, 154);
  image(img[2], jelly2X, jelly2Y);
  popMatrix();

  pushMatrix();
  jelly3X +=random(-speed, speed);
  jelly3Y +=random(-speed, speed);
  jelly3X = constrain(jelly3X, 133, 246);
  jelly3Y = constrain(jelly3Y, 102, 180);
  image(img[3], jelly3X, jelly3Y);
  popMatrix();

  pushMatrix();
  jelly5X +=random(-speed, speed);
  jelly5Y +=random(-speed, speed);
  jelly5X = constrain(jelly5X, 133, 246);
  jelly5Y = constrain(jelly5Y, 102, 180);
  image(img[5], jelly5X, jelly5Y);
  popMatrix();

  pushMatrix();
  jelly6X +=random(-speed, speed);
  jelly6Y +=random(-speed, speed);
  jelly6X = constrain(jelly6X, 133, 246);
  jelly6Y = constrain(jelly6Y, 102, 180);
  image(img[6], jelly6X, jelly6Y);
  popMatrix();

  pushMatrix();
  jelly7X +=random(-speed, speed);
  jelly7Y +=random(-speed, speed);
  jelly7X = constrain(jelly7X, 84, 288);
  jelly7Y = constrain(jelly7Y, 102, 180);
  image(img[7], jelly7X, jelly7Y);
  popMatrix();

  pushMatrix();
  jelly8X +=random(-speed, speed);
  jelly8Y +=random(-speed, speed);
  jelly8X = constrain(jelly8X, 180, 210);
  jelly8Y = constrain(jelly8Y, 91, 190);
  image(img[8], jelly8X, jelly8Y);
  popMatrix();

  pushMatrix();
  jelly12X +=random(-speed, speed);
  jelly12Y +=random(-speed, speed);
  jelly12X = constrain(jelly12X, 180, 210);
  jelly12Y = constrain(jelly12Y, 91, 190);
  image(img[12], jelly12X, jelly12Y);
  popMatrix();
}

void keyPressed() {
  saveFrame("##.png");
}



