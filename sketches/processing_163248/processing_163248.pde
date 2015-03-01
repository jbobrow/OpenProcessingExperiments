
Bird b1;
Obstruction o1, o2, o3, o4;

int done = -3;
float initialbs;
float bs;

boolean jump;

int textVal;
int initialTextVal;
int textState;

float highscore, lastscore;

void setup() {
  size(1380, 700);
  frameRate(45);
  setup2();
}

void setup2() {
  initialTextVal = 340;
  textVal = initialTextVal;
  textState = 1;
  jump = false;
  initialbs = 0;
  bs = initialbs;
  b1 = new Bird();
  o1 = new Obstruction(0);
  o2 = new Obstruction(max(600, width*0.4));
  o3 = new Obstruction(max(1200, width*0.4*2));
  o4 = new Obstruction(max(1800, width*0.4*3));
  b1.skyline.resize(width, height);
  b1.skyline.loadPixels();
}

void keyPressed() {
  if (done == 0 && key == ' ') {
    jump = true;
  }
}
void keyReleased() {
  if (done == 0 && key == ' ') {
    jump = false;
  }
}
void draw() {
  image(b1.skyline, width/2, height/2);
  fill(0);
  if (done == -3) {
    difficulty();
  }
  if (done == -2) {
    startpage();
  }
  if (done == -1) {
    threeTwoOne();
  }
  if (done == 0) {
    gameplay();
  }

  if (done == 1) {
    fallingdown();
  }

  if (done == 2) {
    gameoverpage();
  }
}

void gameoverpage() {
  o1.obstruction();
  o2.obstruction();
  o3.obstruction();
  o4.obstruction();
  b1.bird();
  rectMode(CENTER);
  fill(255, 255, 0);
  rect(width/2, height/2-50, 400, 350);
  textAlign(CENTER, TOP);
  fill(0);
  textSize(55);
  text("GAME OVER", width/2, height/2-210);
  textSize(30);
  text("Highscore: " +round(lastscore), width/2, height/2-135);
  text("Score: " + round(b1.score), width/2, height/2-95);
  fill(0, 180, 0);
  rect(width/2, height/2-10, 250, 60); // try again
  fill(255, 0, 0);
  rect(width/2, height/2+70, 250, 60); //quit
  fill(255, 255, 0);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("TRY AGAIN", width/2, height/2-10);
  text("QUIT", width/2, height/2+70);
  if (mouseX > width/2-250/2 && mouseX < width/2+250/2 && mouseY > height/2-40 && mouseY < height/2+20 && mousePressed) {
    setup2();
    done = -3;
  }

  if (mouseX > width/2-250/2 && mouseX < width/2+250/2 && mouseY > height/2-30+70 && mouseY < height/2+70+30 && mousePressed) {
    super.exit();
  }
}

void threeTwoOne() {
  rectMode(CENTER);
  o1.obstruction();
  o2.obstruction();
  o3.obstruction();
  o4.obstruction();
  b1.bird();
  fill(0);
  textAlign(CENTER, CENTER);
  if (textState == 1) {
    textSize(textVal);
    text("3", width/2, height/2);
    textVal -= 10;
    if (textVal < 10) {
      textState = 2;
      textVal = initialTextVal;
    }
  }
  if (textState == 2) {
    textSize(textVal);
    text("2", width/2, height/2);
    textVal -= 10;
    if (textVal < 10) {
      textState = 3;
      textVal = initialTextVal;
    }
  }
  if (textState == 3) {
    textSize(textVal);
    text("1", width/2, height/2);
    textVal -= 10;
    if (textVal < 10) {
      textState = 4;
      textVal = initialTextVal;
    }
  }
  if (textState == 4) {
    fill(0, 0, 255);
    textSize(initialTextVal);
    text("GO!", width/2, height/2);
    textVal -= 16;
    if (textVal < 10) {
      textState = 5;
      textAlign(LEFT);
    }
  }
  if (textState == 5) {
    textState = 1;
    textVal = initialTextVal;
    done = 0;
  }
}

void difficulty() {
  rectMode(CENTER);
  b1.bird();
  fill(255);
  rect(width/2, height/2, 400, 400);

  fill(0, 255, 0);
  rect(width/2, height/2 - 120, 280, 100);
  fill(255, 255, 0);
  rect(width/2, height/2, 280, 100);
  fill(255, 0, 0);
  rect(width/2, height/2 + 120, 280, 100);

  textAlign(CENTER, CENTER);
  fill(0);
  textSize(50);
  text("Easy", width/2, height/2-120);
  text("Normal", width/2, height/2);
  text("Hard", width/2, height/2 + 120);
}

void startpage() {
  rectMode(CENTER);
  b1.bird();
  fill(0, 255, 0);
  rect(width/2, height/2, 350, 150);
  fill(255, 255, 0);
  rect(width/2, height/2, 300, 80);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(40);
  text("START", width/2, height/2);
}

void gameplay() {
  rectMode(CENTER);
  o1.obstruction();
  o1.moveObstruction();
  o2.obstruction();
  o2.moveObstruction();
  o3.obstruction();
  o3.moveObstruction();
  o4.obstruction();
  o4.moveObstruction();
  b1.bird();
  b1.movebird();
}

void fallingdown() {
  if (jump) {
    b1.ys = (b1.initialys+b1.score*o1.ups);
    b1.by -= bs;
  }
  else {
    if (b1.by <= height) { 
      b1.by += b1.ys;
      b1.ys += 0.5;
    }
  }
  fill(180, 0, 0, 180);
  rect(width/2, height/2, width, height);
  o1.obstruction();
  o2.obstruction();
  o3.obstruction();
  o4.obstruction();
  b1.bird();
  if (b1.by >= height) { 
    lastscore = b1.score;
    if(lastscore > highscore) highscore = lastscore;
    setup2();
    done = 2;
  }
}

void mousePressed() {
  if (mouseX > width/2-140 && mouseX < width/2+140 && mouseY > height/2-160 && mouseY < height/2-80 && mousePressed && done == -3) {
    o1.ph = height-380;
    o2.ph = height-380;
    o3.ph = height-380;
    o4.ph = height-380;
    done = -2;
  }
  if (mouseX > width/2-140 && mouseX < width/2+140 && mouseY > height/2-40 && mouseY < height/2+40 && mousePressed && done == -3) {
    o1.ph = height-260;
    o2.ph = height-260;
    o3.ph = height-260;
    o4.ph = height-260;
    done = -2;
  }
  if (mouseX > width/2-140 && mouseX < width/2+140 && mouseY > height/2+80 && mouseY < height/2+160 && mousePressed && done == -3) {
    o1.ph = height-190;
    o2.ph = height-190;
    o3.ph = height-190;
    o4.ph = height-190;
    done = -2;
  }
  
  if (mouseX > width/2-150 && mouseX < width/2+150 && mouseY > height/2-40 && mouseY < height/2+40 && mousePressed && done == -2) {
    done = -1;
  }
}

void exit() {
  super.exit();
}

class Bird {
  float bx, by;
  float bw, bh;
  float initialys;
  float ys; 
  float score;

  float angle;

  PImage ET = loadImage("https://lh4.googleusercontent.com/-IhZ_1qcR6Gc/VCcTEyyxSlI/AAAAAAAAA4o/TNy4vAs6hHM/w218-h110-no/turtlejet.png");
  PImage skyline = loadImage("https://lh5.googleusercontent.com/-8pZu4QafCpI/VCcT36sAvMI/AAAAAAAAA5I/CkYJIO7JhIs/w1380-h700-no/skyline.png");

  Bird() {
    bx = min(width/3, 300);
    by = height/2;
    bw = 174;
    bh = 88;
    angle = 0;
    initialys = 0;
    ys = initialys;
    score = 1;
  }

  void bird() {
    pushMatrix();
    imageMode(CENTER);
    translate(bx, by);
    rotate(radians(angle));
    image(ET, 0, 0);   
    fill(255, 158, 0);
    noStroke();
    if (done == 0) triangle(-105, 30, -105-(bs*15), -bs*3+30, -105-(bs*15), bs*3+30);
    stroke(0);
    popMatrix();

    fill(255);
    rect(85, 60, 170, 200);
    fill(0);
    textSize(20);
    textAlign(CENTER, BASELINE);
    text("Lag: " +round(abs(100-(frameRate*100/45))) + "%", 85, 30);
    text("Speed: " + round(o1.ps), 85, 60);
    text("Score: " + round(score), 85, 90);
    text("Last Score: " +round(lastscore), 85, 120);
    text("High Score: " +round(highscore), 85, 150);
  }

  void movebird() {
    if (done == 0) {
      if (jump) {
        ys = (initialys+score*o1.ups);
        if (bs <= 19) {
          bs += 1;
        }
        by -= bs;
        if (angle >= -40) {
          angle -= 1;
        }
      }
      else {
        if (by <= height) { 
          bs = (initialbs+score*o1.ups);
          by += ys;
          if (angle <= 0) {
            angle += 1;
          }
          ys += 1;
        }
      }
      if (by >= height) {
        setup2();
        done = 2;
      }
    }
  }
}

class Obstruction {
  float px, py, ph, ps, pw; 
  color pillar;
  int state = 0;
  float ups;

  Obstruction(float add) {
    ups = 0.15;
    px = 300 + 800 + add;
    ph = height-350;
    py = random(-height*0.50/2, height*0.50/2);
    ps = (10*width/1440);
    pw = max(0.08*height, 0.08*width);
    pillar = color(random(255), random(255), random(255));
  }

  void obstruction() {
    fill(pillar);
    rect(px, py, pw, ph);
    rect(px, py+height, pw, ph);
    if (px <= -pw/2) {
      px = max(2400, width*0.4*4) - pw/2;
      py = random(-height*0.5/2, height*0.5/2);
      b1.score += 1;
      o1.ps += ups;
      o2.ps += ups;
      o3.ps += ups;
      o4.ps += ups;
      pillar = color(random(255), random(255), random(255));
    }
    if (b1.bx + b1.bw/3 > px - pw/2 && b1.bx - b1.bw/3 < px + pw/2 && b1.by + b1.bh/2 > py + height - ph/2 && b1.by - b1.bh/2 < py + height + ph/2) {
      jump = false;
      if (b1.angle <= 50) {
        b1.angle += 10;
      }
      done = 1;
    }
    if (b1.bx + b1.bw/3 > px - pw/2 && b1.bx - b1.bw/3 < px + pw/2 && b1.by + b1.bh/2 > py - ph/2 && b1.by - b1.bh/2 < py + ph/2) {
      jump = false;
      if (b1.angle <= 50) {
        b1.angle += 10;
      }
      b1.ys = 7;
      b1.ys += 1;
      done = 1;
    }
  }
  void moveObstruction() {
    if (mousePressed) {
      px -= ps + 2;
    }
    else {
      px -= ps;
    }
  }
}



