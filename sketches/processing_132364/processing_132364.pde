
int monsterX;
int monsterY;

void setup() {

  size(500, 500);
  monsterX = 300;
  monsterY = 190;



}

void draw() {
  background(255, 255, 255);
  for (int i = 0; i < 10; i = i + 1){
    tekenMonster (-61+(i*210),255);
}


  
}

void tekenMonster(int monsterX, int monsterY){ 
  //legs

  stroke(0);
  rect(monsterX-50, monsterY+35, 20, 50);

  stroke(0);
  rect(monsterX+25, monsterY+35, 20, 50);
  
  //body
  stroke(0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY, 180, 100);

  //head
  
  stroke(0);
  ellipseMode(CENTER);
  ellipse(monsterX-100, monsterY-40, 100, 100);

  stroke(0);
  ellipseMode(CENTER);
  ellipse(monsterX-100, monsterY-40, 90, 90);

  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(monsterX-125, monsterY-60, 20, 20);

  fill(0);
  ellipseMode(CENTER);
  ellipse(monsterX-127, monsterY-55, 9, 9);

  fill(98, 126, 101);
  ellipseMode(CENTER);
  ellipse(monsterX-127, monsterY-55, 10, 10);
}


   



