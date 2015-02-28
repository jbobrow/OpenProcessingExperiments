
int monsterX;
int monsterY;

void setup() {
  size(500,500);
  background(255);
  monsterX = 250;
  monsterY = 250;
}

void draw() {
  background(255);
  ellipseMode(CENTER);
  stroke(0);
  fill(0);
  ellipse(monsterX, monsterY,100,300);
  fill(128);
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
  fill(128);
  triangle (monsterX -200,monsterY -150,monsterX -30,monsterY -210,monsterX -130,monsterY -220);

  monsterY= monsterY -1;
}
