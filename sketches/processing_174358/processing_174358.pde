
void setup() {
  size(480, 800);
}

int s = 0;
float a = 25;
float y = 400;
float vy = 3;
float b = 1;
int score = 00;
float spikeSwitch = 1000;
float spikeSwitch2 = 1000;
float[] spikeYValues = new float[] {
  50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750
};

int gameState; //0 = pre-grame, 1 = in-game, 2 = game over

void draw() {
  background(240);
  LeftSpikes leftspikes = new LeftSpikes();
  RightSpikes rightspikes = new RightSpikes();
  Bird bird = new Bird();
  topSpikes tSpikes = new topSpikes();

  fill(200);
  ellipse(240, 400, 200, 200);

  if (gameState==0) {
    noStroke();
    tSpikes.draw();
    translate(-440, -50);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(240);
    text("Click to start", 240, 440);
    if (mousePressed) {
      gameState = 1;
    }
  }

  if (gameState==1) {
    bird.draw();
    tSpikes.draw();
    translate(-440, -50);
    pushMatrix();
    for (float spikeY : spikeYValues) {
      pushMatrix();
      translate(0, spikeY);
      if (s==1) {
        leftspikes.draw();
      } else {
        rightspikes.draw();
      }
      float leftD = dist(a, y, 25, spikeY-12.5);
      float rightD = dist(a, y, 455, spikeY-12.5);
      if (leftD < 12.5 && leftD > -12.5 && s==1) {
        gameState=2;
      }
      if (rightD < 25 && rightD > -12.5 && s==0) {
        gameState=2;
      }
      popMatrix();
    }
    popMatrix();
    if (y > 775 || y < 25) {
      gameState=2;
    }
  }

  if (gameState==2) {
    fill(50);
    ellipse(a, y, 50, 50);
    tSpikes.draw();
    translate(-440, -50);
    pushMatrix();
    leftspikes.draw();
    popMatrix();
    rightspikes.draw();
    score = score;
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(150);
    text("Game Over", 240, 320);
    fill(240);
    text("Score", 240, 505);
    textSize(100);
    text(score, 240, 440);
  }
}

float va=4;

class Bird {
  Bird() {
  }
  void draw() {
    //    vy = vy *1.03;
    if (a>=455) {
      s=1;
      score++;
      randomizeSpikeYValues();
    }
    if (a==25) {
      s=0;
      score++;
      randomizeSpikeYValues();
    }
    if (s==0) {
      a=a+va;
    } else {
      a=a-va;
    }
    if (mousePressed) {
      vy=5;
    } else {
      vy -= 0.3;
    }
    y=y-vy;
    if (y >795) {
      y = 795;
    }
    if (y < 5) {
      y = 5;
    }
    noStroke();
    //score;
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(240);
    text(score, 240, 390);
    //bird
    fill(0, 100, 200);
    ellipse(a, y, 50, 50);
  }
}

void randomizeSpikeYValues() {
  int spike = 0;
  for (int i = 0; i < spikeYValues.length; i++) {
    spike+= 50*((int) random(4)+1);
    spikeYValues[i] = spike;
  }
}


class LeftSpikes {
  LeftSpikes() {
  }
  void draw() {
    fill(100);
    triangle(0, 0, 25, 25, 0, 50);
  }
}

class RightSpikes {
  RightSpikes() {
  }
  void draw() {
    fill(100);
    triangle(480, 0, 455, 25, 480, 50);
  }
}

class topSpikes {
  topSpikes() {
  }
  void draw() {
    translate(-40, 0);
    fill(100);
    for (int x=0; x<480; x=x+40) {
      translate(40, 0);
      triangle(0, 0, 40, 0, 20, 20);
      triangle(0, 800, 20, 780, 40, 800);
    }
  }
}



