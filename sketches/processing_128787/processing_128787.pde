
//DECLARE VARS

int counter;
boolean tenCounts;

color bodyColor;

int strokeX;

int strokeRectHeight;
int strokeRectWidth;

int strokeSpace;

Monster  monster1;
Monster  monster2;
Monster  monster3;
Monster  monster4;
Monster  monster5;





//SETUP

void setup() {
  size(800, 800);
  background(255);

  //SET VARS

  //MOVEMENT

  //kleurtjes
  counter = 0;
  tenCounts = true;

  bodyColor = color(200, 200, 100);

  //strokeloop

  strokeX = 0;

  strokeRectHeight = 10;
  strokeRectWidth = width;

  strokeSpace = strokeRectHeight + 10;

  monster1 = new Monster(20, 20, 2);
  monster2 = new Monster(50, 20, 5);
  monster3 = new Monster(200, 20, 1);
  monster4 = new Monster(400, 20, 3);
  monster5 = new Monster(600, 20, 10);
}



//DRAW
void draw() {
  background(0, 150, 0);


  //streepjes
  for (int i = 10; i < height; i = i +20) {
    fill(0, 200, 0);
    noStroke();
    rect(strokeX, i, strokeRectWidth, strokeRectHeight);
  }

  //monster

  kleurverandering();

  monster1.tekenMonster();
  monster1.movement();

  monster2.tekenMonster();
  monster2.movement();

  monster3.tekenMonster();
  monster3.movement();

  monster4.tekenMonster();
  monster4.movement();

  monster5.tekenMonster();
  monster5.movement();



  //UPDATE VARS


  //beweging


  //kleurtjes veranderen


  println(counter);
  println(tenCounts);
}






void kleurverandering() { 
  if (counter == 10) {
    counter = 0;
    tenCounts = !tenCounts;
  }

  if (tenCounts) { 
    bodyColor = color(200, 200, 100);
  }

  else if (!tenCounts) {
    bodyColor = color(200, 0, 0);
  }
}

class Monster {
  int monsterposX;
  int monsterposY;
  int monsterDirectionY;

  Monster(int tempmonsterposX, int tempmonsterposY, int tempmonsterDirectionY) {
    monsterposX = tempmonsterposX;
    monsterposY = tempmonsterposY;
    monsterDirectionY = tempmonsterDirectionY;
  }

  void tekenMonster() {
    //LICHAAM


    stroke(0);
    fill(bodyColor);
    ellipse(monsterposX+110, monsterposY+30, 35, 35);

    stroke(0);
    fill(bodyColor);
    ellipse(monsterposX+90, monsterposY+40, 45, 45);

    stroke(0);
    fill(bodyColor);
    ellipse(monsterposX+70, monsterposY+50, 50, 50);

    stroke(0);
    fill(bodyColor);
    ellipse(monsterposX+50, monsterposY+50, 50, 50);

    stroke(0);
    fill(bodyColor);
    ellipse(monsterposX+30, monsterposY+30, 50, 50);


    //HOOFDJE

    stroke(0);
    fill(bodyColor);
    ellipse(monsterposX, monsterposY, 80, 80);

    stroke(0);  //oog li
    fill(240);
    ellipse(monsterposX-20, monsterposY-10, 20, 25);

    stroke(0); //pupil li
    fill(0);
    ellipse(monsterposX-20, monsterposY-15, 3, 3);

    stroke(0);  //oog re
    fill(240);
    ellipse(monsterposX+20, monsterposY-10, 20, 25);

    stroke(0); //pupil re
    fill(0);
    ellipse(monsterposX+20, monsterposY-15, 3, 3);

    stroke(0);
    fill(200, 100, 100);
    ellipse(monsterposX, monsterposY, 20, 20);

    stroke(0);
    fill(200);
    triangle(monsterposX-25, monsterposY-30, monsterposX+25, monsterposY-30, monsterposX, monsterposY-70);
  }

  void movement() {


    monsterposY = monsterposY - monsterDirectionY;

    if (monsterposY < 0 || monsterposY > height) {
      monsterDirectionY = -monsterDirectionY;
      counter = counter +1;
    }
  }
}

