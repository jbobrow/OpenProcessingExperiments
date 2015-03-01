
float[] posX = {
  1000/2, 300, 400, 500, 550, random(1000), random(1000), random(1000), random(1000), random(1000), random(1000), random(1000), random(1000), random(1000), random(1000)
  };
float[] posY = {
  800/2, 500, 300, 700, 200, random(800), random(800), random(800), random(800), random(800), random(800), random(800), random(800), random(800), random(800)
  };
float[] velX = {
  random(10), random(5), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10),
};
float[] velY = {
  random(10), random(15), random(10), random(20), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10),
};
float sz = 90;
float c1 = random(255);
float c2 = random(255);
float c3 = random(255);
int i = 0;


void setup() {
  size (750, 750);
  background(0);
  noStroke();
}


void draw () {
  for (int i = 0; i< posX.length; i++) {
    posX[i] = posX[i] + velX[i];
    posY[i] = posY[i] + velY[i];
    fill(c1, c2, c3, 20);
    ellipse(posX[i], posY[i], sz, sz);

//Rebot
    if (posX[i] >= (width/1.1) || posX[i] <= 70) {
      velX[i] = -velX[i];
    }
    if (posY[i] >= (height/1.1) || posY[i] <= 70) {
      velY[i] = -velY[i];
    }

//Mod color
    if (keyPressed) {
      if (key == '1') {
        c1 = c1 + (random(10,100));
      }
      if (key == '2') {
        c1 = c1 - (random(10,100));
      }
      if (key == '3') {
        c2 = c2 + (random(10,100));
      }
      if (key == '4') {
        c2 = c2 - (random(10,100));
      }
      if (key == '5') {
        c3 = c3 + (random(10,100));
      }
      if (key == '6') {
        c3 = c3 - (random(10,100));
      }
    }

//Refresh
    if (mousePressed) {
      background(0);
      posX[i] = mouseX;
      posY[i] = mouseY;
      velX[i] = random(-20, 20);
      velY[i] = random (-20, 20);
      c1 = random(255);
      c2 = random(255);
      c3 = random(255);
    }
  }
}



