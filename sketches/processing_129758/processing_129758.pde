
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;

void setup() {
  size(500, 500);
  mijnMonster = new Monster(203, 23, 5);
  mijnMonster2 = new Monster(75, 82, 8);
  mijnMonster3 = new Monster(410, 245, 2);
}

void draw() {
  background(255);
  mijnMonster.update();
  mijnMonster.testRand();
  mijnMonster.drawMonster();

  mijnMonster2.update();
  mijnMonster2.testRand();
  mijnMonster2.drawMonster();

  mijnMonster3.update();
  mijnMonster3.testRand();
  mijnMonster3.drawMonster();
}

class Monster { //class monster
  int monsterX;
  int monsterY;
  int richting;
  int teller; //teller die het botsen bijhoudt
  boolean test; //kleur

  Monster (int tempX, int tempY, int tempRichting) {
    monsterX = tempX; //plaats wordt bepaald door getal bij setup
    monsterY = tempY; //plaats wordt bepaald door getal bij setup
    richting = tempRichting; //de snelheid wordt bepaald door getal bij setup
    test = true;
  }

  void update() {
    monsterY = monsterY + richting;
  }

  void testRand() {
    if (monsterY < 0 || monsterY > height) {
      richting=-richting;

      if (teller == 10) {
        teller = 0;
        test = !test;
      }
      teller = teller + 1;
    }
  }

  void drawMonster() {//monster tekenen
    //cape
    stroke(0);
    if (test == true) {
      fill(255, 0, 0);
    }
    if (test == false) {
      fill(0, 198, 240);
    }
    triangle(monsterX-70, monsterY+60, monsterX, monsterY-70, monsterX+70, monsterY+60);

    //body
    stroke(0);
    fill(58, 204, 0);
    rectMode(CENTER);
    rect(monsterX, monsterY, 56, 90);

    //head
    ellipse(monsterX, monsterY-40, 70, 70);

    //hair
    stroke(0);
    noFill();
    line(monsterX, monsterY-75, monsterX-10, monsterY-90);
    line(monsterX, monsterY-75, monsterX-17, monsterY-85);
    line(monsterX, monsterY-75, monsterX+10, monsterY-93);

    //eye
    stroke(0);
    fill(255);
    ellipse(monsterX, monsterY-45, 25, 25);
    noStroke();
    fill(0);
    ellipse(monsterX, monsterY-45, 10, 10);

    //mouth
    stroke(0);
    noFill();
    line(monsterX-17, monsterY-27, monsterX+17, monsterY-27);

    //teeth
    fill(255);
    triangle(monsterX-6, monsterY-27, monsterX, monsterY-18, monsterX+6, monsterY-27);
    triangle(monsterX-14, monsterY-27, monsterX-10, monsterY-21, monsterX-6, monsterY-27); //left tooth
    triangle(monsterX+6, monsterY-27, monsterX+10, monsterY-21, monsterX+14, monsterY-27); //right tooth


    //arm left
    stroke(0);
    noFill();
    line(monsterX-28, monsterY-5, monsterX-42, monsterY+8);
    line(monsterX-42, monsterY+8, monsterX-30, monsterY+20);

    //arm right
    line(monsterX+28, monsterY-5, monsterX+42, monsterY+8);
    line(monsterX+42, monsterY+8, monsterX+30, monsterY+20);

    //legs
    line(monsterX-10, monsterY+45, monsterX-10, monsterY+80);
    line(monsterX+10, monsterY+45, monsterX+10, monsterY+80);

    //hands
    noStroke();
    fill(0);
    ellipse(monsterX-30, monsterY+20, 10, 10);//left hand
    ellipse(monsterX+30, monsterY+20, 10, 10);//right hand

    //feet
    ellipse(monsterX-10, monsterY+80, 10, 10);//left foot
    ellipse(monsterX+10, monsterY+80, 10, 10);//right foot
  }
}

