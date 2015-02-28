
//werkt in processing wel

int monsterY;
int monsterX;
int richtingX;
int richtingY;
int score;
int oog;
boolean test;

//basic
void setup() {
  size(500, 500);
  monsterY = 450;
  monsterX = 70;
  score = 0;
  test = false;
  richtingX = 3;
  richtingY = 5;
  oog = 170;
}


void draw() {
  background(255);
  
  monster();
  kleuroog();
  richting();
  test();
  counter();

  println(test);
  println(score);
}












void monster() {
  //arms

  noStroke();
  rectMode(CENTER);
  rect(monsterX-30, monsterY, 25, 5);
  rect(monsterX+30, monsterY, 25, 5);


  //legs

  noStroke();
  rectMode(CENTER);
  rect(monsterX-10, monsterY+50, 5, 25);
  rect(monsterX+10, monsterY+50, 5, 25);


  //body
  noStroke();
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY, 60, 100);

  //eye

  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(monsterX, monsterY-20, 58, 5);

  stroke(180);
  fill(oog);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY-20, 30, 30);

  stroke(0);
  fill(0);
  ellipse(monsterX, monsterY-20, 10, 10);

  //mouth

  fill(50);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY+20, 30, 5);
}


void kleuroog(){
    for (int i = 0; i < 5; i++) {
    oog = oog + i;
  }
  if (oog >= 255) {
    oog = 170;
  }
}



void richting(){
    if (monsterX > 500 || monsterX < 0) {
    richtingX = -richtingX;
    score = score+1;
  }

  if (monsterY > 500 || monsterY < 0) {
    richtingY = -richtingY;
    score = score+1;
  }
  
  monsterX = monsterX + richtingX;
  monsterY = monsterY + richtingY;
}

void test(){
    if (test == false) {
    fill(236, 231, 24);
  }

  if (test == true) {
    fill(72, 137, 29);
  }
  
    if (score == 10) {
    score = 0;
    test = !test;
  }
}

void counter(){
  text(score, 250, 250);
  textSize(50);
}
