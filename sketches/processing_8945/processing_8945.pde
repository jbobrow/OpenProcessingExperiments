
boolean yIncrease, yDecrease, xIncrease, xDecrease, easy, slowed, sloppy;
int page = 0;
int score;
int perkTime = 7000;
int perkTime2 = 7000;
int perkTime3 = 4000;
String scoreNumber;
int rotateCounter;

PFont font;

ArrayList enemiesX, enemiesY;

You you = new You();
Food food = new Food();
Perk1 perk1 = new Perk1();
Perk2 perk2 = new Perk2();
BadNews bad = new BadNews();

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  rectMode(CENTER);
  textAlign(RIGHT);
  shapeMode(CENTER);

  easy = false;
  slowed = false;
  sloppy = false;

  perk1.setValues(random(10, 490), random(10, 490));
  perk2.setValues(random(10, 490), random(10, 490));
  bad.setValues(random(10, 490), random(10, 490));

  score = 0;

  enemiesX = new ArrayList();
  enemiesY = new ArrayList();

  font = loadFont("00-Starmap-Truetype-50.vlw");
  textFont(font, 50);

}

void draw() {
  if(page == 0) {
    textAlign(CENTER);
    background(26, 31, 38);
    textSize(20);
    fill(121, 139, 148);
    text("move with the arrow keys.", width/2, height/2 - 100);
    text("eat the orange squares.", width/2, height/2 - 50);
    text("avoid the white circles.", width/2, height/2);
    text("eat the pink circles if you want?.", width/2, height/2 + 50);
    text("press the spacebar to begin.", width/2, height/2 + 100);
  }

  else if(page == 1) {
    fill(105, 120, 127, 200);
    rect(width/2, height/2, width, height);
    scoreNumber = "SCORE: " + score;
    fill(121, 139, 148);
    text(scoreNumber, width, 40);
    you.update();
    you.display();
    food.eat();
    food.display();
    perk1.smaller();
    perk1.display();
    perk2.slower();
    perk2.display();
    bad.fucked();
    bad.display();

    for(int i = enemiesX.size() - 1; i >= 0; i--) {
      EnemyX enemyX = (EnemyX) enemiesX.get(i);
      enemyX.update();
      enemyX.display();
    }

    for(int i = enemiesY.size() - 1; i >= 0; i--) {
      EnemyY enemyY = (EnemyY) enemiesY.get(i);
      enemyY.update();
      enemyY.display();
    }

    println(yDecrease + " " + xIncrease);
  }

  else if(page == 2) {
    background(26, 31, 38);
    textAlign(CENTER);
    fill(121, 139, 148);
    textSize(80);
    if(score <= 70) {
      text("YOU SUCK", width/2, height/2 - 100);
    }
    else if(score > 70 && score < 120) {
      text("TRY HARDER", width/2, height/2 - 100);
    }
    else if(score >= 120 && score < 170) {
      text("COOL", width/2, height/2 - 100);
    }
    else if(score >= 170 && score < 230) {
      text("GOOD JOB", width/2, height/2 - 100);
    }
    else if(score >= 230 && score < 370) {
      text("GREAT JOB", width/2, height/2 - 100);
    }
    else if(score >= 370) {
      text("YOU WIN", width/2, height/2 - 100);
    }
    textSize(50);
    text(scoreNumber, width/2, height/2);
    textSize(20);
    text("(space bar to restart)", width/2, height/2 + 100);
  }

}

void keyPressed() {
  if(keyCode == UP) {
    yDecrease = true;
  }
  else if(keyCode == DOWN) {
    yIncrease = true;
  }
  else if(keyCode == RIGHT) {
    xIncrease = true;
  }
  else if(keyCode == LEFT) {
    xDecrease = true;
  }
  if(key == ' ') {
    page = 1;
    setup();
    perk1.scoreReached = 100;
    perk2.scoreReached = 130;
    bad.scoreReached = 120;
  }
}

void newEnemyX() {
  enemiesX.add(new EnemyX());
  EnemyX enemyX = (EnemyX) enemiesX.get(enemiesX.size() - 1);
  enemyX.setValues(10, random(10, height - 10));
}

void newEnemyY() {
  enemiesY.add(new EnemyY());
  EnemyY enemyY = (EnemyY) enemiesY.get(enemiesY.size() - 1);
  enemyY.setValues(random(10, height - 10), 10);
}

void keyReleased() {
  if(keyCode == UP) {
    yDecrease = false;
  }
  else if(keyCode == DOWN) {
    yIncrease = false;
  }
  else if(keyCode == RIGHT) {
    xIncrease = false;
  }
  else if(keyCode == LEFT) {
    xDecrease = false;
  }
}





