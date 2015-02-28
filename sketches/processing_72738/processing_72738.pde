
import arb.soundcipher.*;

SoundCipher sc = new SoundCipher(this);

int width = 400;
int height = 300;
int nBike = 2;
float[] bikeX = new float[nBike];
float[] bikeY = {
  height/4, height*3/4
};
float[] bikeVelX = new float[nBike];
int bgColor;
int bikeColor;
int colorB = color(0);
int colorW = color(255);
int colorR = color(255, 0, 0);
PFont scoreFont;
int score;

void setup() {
  size(400, 300);
  smooth();
  noStroke();
  frameRate(24);
  rectMode(CENTER);

  bikeColor = colorW;
  bgColor = colorB;

  for (int i=0;i<nBike;i++) {
    bikeX[i] = 30*(i+1);
    bikeVelX[i] = random(4, 6);
  }
}

void draw() {
  background(bgColor);

  scoreFont = loadFont("scoreFont.vlw");
  textFont(scoreFont);
  fill(255);
  text("WHACK-A-BERN!", 15, 147);
  text("BERN WHACKED: "+score, width-250, height/2+22);
  
  for (int i=0; i<nBike; i++) {
    fill(bikeColor);
    rect(bikeX[i], bikeY[i], 30, 10);
    update();
  }
}

void update() {
  for (int i=0;i<nBike;i++) {
    bikeX[i] = bikeX[i]+bikeVelX[i];

    if (bikeX[i]+16>=width) {
      bgColor = colorR;
    }

    if (bikeX[i]-15>=width) {
      bgColor = colorB;
      bikeX[i] =       0;
    }
  }
  if (score == 5) {
    endGame();
  }
}

void keyPressed() {
  if (keyCode == 32 && bgColor == colorR) {
    score++;
    sc.playNote(80, 100, 2.0);
    println("BERN WHACKED: "+score);
  }
  else {
    score--;
    sc.playNote(40, 100, 2.0);
  }
} 

void endGame() {
  background(255);
  fill(0);
  textFont(scoreFont);
  text("THANK YOU FOR WHACKING!", width/2-170, height/2+8);
}


