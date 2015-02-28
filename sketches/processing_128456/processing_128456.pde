
int monsterY;
int monsterX;

int richting;
int teller;
boolean test;

int x;
int y;
int spatie;
int stop;


void setup() {
  size(200, 200);
  monsterY = 100;
  monsterX= 50;
  richting=3;
  teller=0;
  test= true;
  y=0;
  x=0;
  spatie=50;
  stop=500;
}

void draw() {
  background(255);
  monsterX= mouseX;

  kleurtje();

  updateX();
  testRand();
  tekenMonster();
  loopAchtergrond();
}

void updateX() {
  monsterY=monsterY+richting;
}

void testRand() {

  if (monsterY>200||monsterY<0) {

    richting=-richting;
    teller=teller+1;
  }
  if (teller==10) {
    teller=0;
    test=!test;
  }
}

void tekenMonster () {
  ellipse(monsterX, monsterY-30, 100, 70);
  fill(255);
  ellipse(monsterX-20, monsterY-65, 40, 40);
  ellipse(monsterX+20, monsterY-65, 40, 40);
  fill(0);
  ellipse (monsterX-10, monsterY-60, 10, 10);
  ellipse (monsterX+10, monsterY-60, 10, 10);
  fill (240, 189, 235);
  stroke(240, 189, 235);
  ellipse (monsterX-35, monsterY-30, 12, 12);
  ellipse (monsterX+35, monsterY-30, 12, 12);
  fill (0);
  stroke(0);
  ellipse( monsterX, monsterY-15, 40, 20);
}




void kleurtje () {
  stroke(0);
  ellipseMode(CENTER); 
  if (test==true) {
    fill(96, 245, 64);
  }
  if (test==false) {
    fill(204, 32, 101);
  }
}

void loopAchtergrond () {
  while (x<stop) {
    fill(11, 203, 244);
    ellipse(x, 20, -50, 50 );
    x=x+spatie;
  }
  x=0;

  while (x<stop) {
    fill(11, 203, 244);
    ellipse(x, 70, -50, 50 );
    x=x+spatie;
  }
  x=0;

  while (x<stop) {
    fill(11, 203, 244);
    ellipse(x, 120, -50, 50 );
    x=x+spatie;
  }
  x=0;
  while (x<stop) {
    fill(11, 203, 244);
    ellipse(x, 170, -50, 50 );
    x=x+spatie;
  }
  x=0;
}

