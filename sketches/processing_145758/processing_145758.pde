
int monsterY;
int monsterX;
int oog;
int herhaal;

//basic
void setup() {
  size(500, 500);
  oog = 170;
}


void draw() {
  background(255);
  
  for (int i = 0; i < 10; i = i + 1){
  monster (50+(i*149),150);
  }

  kleuroog();
}





void monster(int monsterX, int monsterY) {
  //arms

  noStroke();
  fill(57, 199, 204);
  rectMode(CENTER);
  rect(monsterX-30, monsterY, 25, 5);
  rect(monsterX+30, monsterY, 25, 5);


  //legs

  noStroke();
  fill(57, 199, 204);
  rectMode(CENTER);
  rect(monsterX-10, monsterY+50, 5, 25);
  rect(monsterX+10, monsterY+50, 5, 25);


  //body
  noStroke();
  fill(57, 199, 204);
  rectMode(CENTER);
  rect(monsterX, monsterY, 60, 100);

  //eye

 

  stroke(180);
  fill(oog);
  rectMode(CENTER);
  rect(monsterX, monsterY-20, 30, 30);

  stroke(0);
  fill(0);
  rect(monsterX, monsterY-20, 10, 10);

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
