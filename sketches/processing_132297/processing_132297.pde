
int monsterX;
int monsterY;
int richting;
int teller;
int y;
boolean test;

int spatie;
int stop;
int breedte;

void setup() {
  size(500,500);
  monsterX = 250;
  monsterY = 250;
  richting = -10;
  teller = 0;
  test = true;
  spatie = 10;
  stop = height;
  breedte = 10;
}

void draw() {
  background(255,0,0);
  
  while (y < stop) {
    line(500, y, 0, y);
    y = y + spatie;
  }
  y = 0;
  
  ellipseMode(CENTER);
  stroke(0);
  
  //buik
      if (test == true) {
  fill(0);
  }
  if (test == false) {
  fill(0,0,255);
  }
  ellipse(monsterX, monsterY,100,300);

  
  //hoofd
      if (test == true) {
  fill(128);
  }
  if (test == false) {
  fill(0,0,255);
  }
  ellipse(monsterX, monsterY -150,100,100);
   fill(255);
  rect(monsterX -25, monsterY -180,20,40);
  rect(monsterX +5, monsterY -180,20,40);
  fill(0);
  rect(monsterX -25, monsterY -130,50,10);
  stroke(0);
  line(monsterX -40, monsterY -185,monsterX -10, monsterY -195);
  line(monsterX +40, monsterY -185,monsterX +10, monsterY -195);
  fill(0);
  rect(monsterX -15, monsterY -150,10,10);
  rect(monsterX +5, monsterY -150,10,10);
  fill(255);
  rect(monsterX -20, monsterY -124,4,4);
  rect(monsterX -15, monsterY -124,4,4);
  rect(monsterX -10, monsterY -124,4,4);
  rect(monsterX -5, monsterY -124,4,4);
  rect(monsterX, monsterY -124,4,4);
  rect(monsterX +5, monsterY -124,4,4);
  rect(monsterX +10, monsterY -124,4,4);
  rect(monsterX +15, monsterY -124,4,4);
  stroke(0);
  line(monsterX -30,monsterY +10, monsterX -50, monsterY +200);
  line(monsterX +30, monsterY +10, monsterX +50, monsterY +200);
  line(monsterX -30, monsterY -90, monsterX -70, monsterY -100);
  line(monsterX +30, monsterY -90, monsterX +70, monsterY -100);
  line(monsterX, monsterY -200, monsterX -10, monsterY -210);
  line(monsterX, monsterY -200, monsterX +10, monsterY -208);
  line(monsterX, monsterY -200, monsterX +3, monsterY -208);
  line(monsterX -120, monsterY -190, monsterX -50, monsterY -70);
  //paraplu
        if (test == true) {
  fill(128);
  }
  if (test == false) {
  fill(0,0,255);
  }
  triangle (monsterX -200,monsterY -150,monsterX -30,monsterY -210,monsterX -130,monsterY -220);

  
  monsterX = monsterX +richting;
  
  if(monsterX >500 || monsterX <0) {
    richting = -richting;
    teller = teller +1;
  }
  
  if (teller == 10) {
    teller = 0;
    test = !test;
  }

println(teller);
}


