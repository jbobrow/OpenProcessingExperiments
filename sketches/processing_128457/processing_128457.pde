
int monsterX;
int monsterY;

int richting;
int teller;
boolean test;

int y;
int x;
int spatie;
int stop;

void setup() {
  size(500, 500);
  monsterX = 150;
  monsterY = 250;

  test = true;
  richting = 10;
  teller = 0;

  y = 0;
  x = 0;
  spatie = 150;
  stop = 500;
}

void draw() {
  background(255, 255, 255);
  monsterX = mouseX;

  loopRondjes();
  updateX();
  testRand();
  tekenMonster();
}

void loopRondjes() {
  {
    while (x<stop) {
      fill(0, 250, 100);
      ellipse(x, 75, 150, 150);
      x=x+spatie;
    }
    x=0;


    while ( x < stop ) {
      fill(250, 93, 171);
      ellipse(x, 225, 150, 150 ); 
      x = x + spatie;
    }
    x=0;
    while (x<stop) {
      fill(255, 0, 0);
      ellipse(x, 375, 150, 150);
      x=x+spatie;
    }
    x=0;

    while (x<stop) {
      fill(0, 0, 255);
      ellipse(x, 525, 150, 150);
      x=x+spatie;
    }
    x=0;
  }
}
void updateX() {
  monsterY = monsterY + richting;
}
void testRand() {
  if (monsterY > width || monsterY < 0) {
    richting= richting * -1;
    teller = teller +1;
  }
}

void tekenMonster() {
  stroke(0);
  fill(0, 0, 0);
  rectMode(CENTER);
  rect( monsterX, monsterY+25, 50, 100);
  line(monsterX-50, monsterY, monsterX, monsterY+50 ); 
  line(monsterX, monsterY+50, monsterX+50, monsterY );
  fill(255);                
  ellipse(monsterX, monsterY-30, 60, 60);  
  fill(0);                   
  ellipse(monsterX-19, monsterY-30, 16, 32);   
  ellipse(monsterX+19, monsterY-30, 16, 32);
  fill(255, 255, 255);
  ellipse(monsterX-17, monsterY-30, 14, 30);
  ellipse(monsterX+18, monsterY-30, 14, 30);
  line(monsterX-10, monsterY-30, monsterX+10, monsterY-30);
  line(monsterX+20, monsterY+90, monsterX+20, monsterY+75);
  line( monsterX-20, monsterY+90, monsterX-20, monsterY+75);
  line( monsterX+20, monsterY+90, monsterX+30, monsterY+90);
  line( monsterX-20, monsterY+90, monsterX-30, monsterY+90);
}



