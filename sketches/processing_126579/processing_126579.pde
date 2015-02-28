
int monsterX;
int monsterY;
int richting;
int score;

boolean test;

void setup () {
  monsterY = 150;
  monsterX = 100;
  richting = 1;
  score = 0;

  test = false;

  size (500, 500);
}

void draw() {
  background(255);

  stroke(0);
  fill(255);
  line(monsterX, monsterY+25, monsterX, monsterY+150);
  //benen lr
  line(monsterX, monsterY+150, monsterX-50, monsterY+250);
  line(monsterX, monsterY+150, monsterX+50, monsterY+250);
  //armen lr
  line(monsterX, monsterY+75, monsterX+60, monsterY+150);
  line(monsterX, monsterY+75, monsterX-60, monsterY-25);
  //hoofd
  ellipse(monsterX, monsterY, 50, 50);
  //oogleden lr
  fill(0);
  //ogen lr
  fill(255);
  ellipse(monsterX-10, monsterY+8, 10, 5);
  ellipse(monsterX+10, monsterY+8, 10, 5);
  fill(255, 0, 0);
  triangle(monsterX-25, monsterY, monsterX+25, monsterY, monsterX, monsterY-75);

  //stippen
  fill(0,0,255);
  for (int i=0; i < 100; i ++) {
    rect(random(0, 500), random(400, 500), 5,5);
  }

  monsterX=monsterX-richting;
  if (monsterX > 500 || monsterX < 0) {
    richting = -richting;
    score = score+1;
    println(score);
    println(test);

    if (score==10) {
      test = true;
      score = 0;
     
    }
  }
}

