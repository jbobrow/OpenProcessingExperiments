
int cloudY1 = 500;
int cloudY2 = 200;
int cloudY3 = 600;
int cloudY4 = 300;

int buttonL = 255;
int buttonR = 255;

PImage ironman;
float ironmanX = width/2;
float ironmanY = 0;

void setup () {
  size (600, 800);
  background (154, 225, 255);

  ironman = loadImage("ironman.png");
}

void draw () {
  background (154, 225, 255);


  //cloudY1
  fill(255);
  noStroke();
  ellipse(450, cloudY1, 100, 100);
  ellipse(400, cloudY1+20, 80, 80);
  ellipse(470, cloudY1+20, 100, 90);
  ellipse(500, cloudY1+30, 60, 60);
  ellipse(520, cloudY1+35, 60, 40);
  ellipse(360, cloudY1+40, 60, 40);
  ellipse(430, cloudY1+40, 60, 40);
  ellipse(330, cloudY1+50, 30, 10);
  ellipse(540, cloudY1+50, 30, 10);

  cloudY1 = cloudY1 + 1;
  if (cloudY1 > height+50) {
    cloudY1 = -50;
  }

  //cloudY2
  fill(255);
  noStroke();
  ellipse(170, cloudY2, 100, 100);
  ellipse(120, cloudY2+20, 80, 80);
  ellipse(180, cloudY2+10, 100, 90);
  ellipse(230, cloudY2+25, 60, 50);
  ellipse(90, cloudY2+35, 60, 40);
  ellipse(260, cloudY2+40, 50, 30);
  ellipse(60, cloudY2+40, 30, 10);

  cloudY2 = cloudY2 + 1;
  if (cloudY2 > height + 50) {
    cloudY2 = -50;
  }

  //cloudY3
  fill(255);
  noStroke();
  ellipse(170, cloudY3, 60, 60);
  ellipse(150, cloudY3+10, 40, 40);
  ellipse(180, cloudY3+10, 60, 50);
  ellipse(210, cloudY3+15, 40, 30);
  ellipse(130, cloudY3+15, 20, 15);
  ellipse(230, cloudY3+20, 30, 10);
  ellipse(120, cloudY3+20, 10, 5);

  cloudY3 = cloudY3 + 1;
  if (cloudY3 > height + 50) {
    cloudY3 = -50;
  }

  //cloudY4
  fill(255);
  noStroke();
  ellipse(400, cloudY4+20, 60, 60);
  ellipse(430, cloudY4+25, 40, 40);
  ellipse(380, cloudY4+30, 60, 50);
  ellipse(355, cloudY4+30, 40, 30);
  ellipse(450, cloudY4+25, 20, 15);
  ellipse(335, cloudY4+25, 30, 10);
  ellipse(470, cloudY4+30, 10, 5);

  cloudY4 = cloudY4 + 1;
  if (cloudY4 > height + 50) {
    cloudY4 = -50;
  }

  //cloud
  fill(255);
  noStroke();
  ellipse(500, 120, 60, 60);
  ellipse(530, 125, 40, 40);
  ellipse(480, 130, 60, 50);
  ellipse(455, 130, 40, 30);
  ellipse(550, 125, 20, 15);
  ellipse(435, 125, 30, 10);
  ellipse(570, 130, 10, 5);

  //cloud
  fill(255);
  noStroke();
  ellipse(480, 650, 60, 60);
  ellipse(510, 655, 40, 40);
  ellipse(460, 660, 60, 50);
  ellipse(435, 660, 40, 30);
  ellipse(530, 655, 20, 15);
  ellipse(415, 655, 30, 10);
  ellipse(550, 660, 10, 5);

  //cloud
  fill(255);
  noStroke();
  ellipse(80, 420, 40, 40);
  ellipse(100, 425, 20, 20);
  ellipse(60, 430, 40, 30);
  ellipse(105, 430, 20, 10);
  ellipse(40, 435, 15, 10);
  ellipse(110, 430, 10, 10);
  ellipse(115, 430, 10, 5);

  //cloud
  fill(255);
  noStroke();
  ellipse(60, 50, 40, 40);
  ellipse(70, 55, 20, 20);
  ellipse(80, 55, 40, 30);
  ellipse(95, 60, 20, 10);
  ellipse(40, 55, 25, 20);
  ellipse(105, 60, 10, 5);
  ellipse(115, 60, 5, 2);

  //cloud
  fill(255);
  noStroke();
  ellipse(85, 750, 40, 40);
  ellipse(95, 755, 20, 20);
  ellipse(105, 755, 40, 30);
  ellipse(120, 760, 20, 10);
  ellipse(65, 755, 25, 20);
  ellipse(130, 760, 10, 5);
  ellipse(140, 760, 5, 2);

  //ironman
  image(ironman, ironmanX, ironmanY, 200, 200);
  ironmanY = ironmanY + 1;
  if (ironmanY > height + 60) {
    ironmanY = -60;
  }

  //border
  strokeWeight(20);
  stroke(87);
  line(0, 0, width, 0);
  line(width, 0, width, height);
  line(width, height, 0, height);
  line(0, height, 0, 0);

  //leftbutton
  strokeWeight(10);
  fill(buttonL, 233, 89);
  ellipse(480, 730, 50, 50);

  //rightbutton
  fill(buttonR, 233, 89);
  ellipse(550, 730, 50, 50);
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (ironmanX < width) {
        ironmanX = ironmanX - 2;
        buttonL = 180;
      } else {
        ironmanX = 0;
        buttonL = 255;
      }
    }
  }

  if (key == CODED) {                //not moving to the right, why?
    if (keyCode == RIGHT) {
      if (ironmanX > 0) {
        ironmanX = ironmanX + 2;
        buttonR = 180;
      } else {
        ironmanX = 0;
        buttonR = 255;
      }
    }  
}
}



