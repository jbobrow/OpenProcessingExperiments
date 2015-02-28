
boolean randomStuff = false;
float sizeThreshold = 150;

void setup() {
  size(640, 480);

  // Create the font
  textFont(createFont("Georgia", 36));
  textAlign(CENTER, CENTER);
}


void draw() {

  background(0);

  if (randomStuff == false) {
    text("random", width/2, height/2);
  }
  else if (randomStuff == true) {
    background(random(255), random(255), random(255));

    randomness('r');
    randomness('a');
    randomness('n');
    randomness('d');
    randomness('o');
    randomness('m');

    frameRate(random(29) + 1);
  }
}

void mouseClicked() {
  randomStuff = true;
}

void randomness (char letter) {
  fill(random(255), random(255), random(255));
  textSize(random(sizeThreshold) + 4);
  text(letter, random(width), random(height));
}



