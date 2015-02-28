
int monsterY = 300;
int monsterX;

//basic
void setup() {
  size(300, 300);
}


void draw() {
  background(255, 255, 255);

  //arms

  stroke(255);
  fill(238, 221, 24);
  rectMode(CENTER);
  rect(monsterX-30, monsterY, 25, 5);

  stroke(255);
  fill(238, 221, 24);
  rectMode(CENTER);
  rect(monsterX+30, monsterY, 25, 5);


  //legs

  stroke(255);
  fill(238, 221, 24);
  rectMode(CENTER);
  rect(monsterX-10, monsterY+50, 5, 25);

  stroke(255);
  fill(238, 221, 24);
  rectMode(CENTER);
  rect(monsterX+10, monsterY+50, 5, 25);


  //body
  noStroke();
  fill(238, 221, 24);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY, 60, 100);

  //eye

  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(monsterX, monsterY-20, 58, 5);

  stroke(180);
  fill(255);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY-20, 30, 30);

  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY-20, 10, 10);

  //mouth

  stroke(0);
  fill(50);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY+20, 30, 5);
  
  monsterY = monsterY -1;
  monsterX = mouseX;

}
