
//Left click to random face.
//Right click to roll the dice, then left to stop.

int diceSize = 200;

void setup() {
  frameRate(10);
  size(diceSize*1.5, diceSize*1.4
  );
  noLoop();
}

void draw() {
  background(#3D5D45);

  //dice
  noStroke();
  fill(#FFF3D6);
  rectMode(CENTER);
  rect(width/2, height/2, diceSize, diceSize, diceSize/5);

  //dots
  fill(50);
  int side = int(random(1, 7));
  if (side == 1 || side == 3 || side == 5)
    ellipse(width/2, height/2, diceSize/5, diceSize/5); 
  if (side == 2 || side == 3 || side == 4 || side == 5 || side == 6) { 
    ellipse(width/2 - diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }
  if (side == 4 || side == 5 || side == 6) {
    ellipse(width/2 - diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
  }
  if (side == 6) {
    ellipse(width/2, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }

  //roll
  if (mousePressed && mouseButton == LEFT)
    noLoop();
}

void mousePressed() {
  loop();
}
