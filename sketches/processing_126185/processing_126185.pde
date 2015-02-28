
int MonsterY=550;

void setup() {
  size(1200, 700);

}

void draw() {
teken();
update();
test();
}
















void teken(){
  background(100, 100, 100);

 
  //Oren
  strokeWeight(2);
  stroke(0);
  noFill();
  fill(0, 125, 40);
  ellipseMode(CENTER);
  ellipse(mouseX-80, MonsterY-80, 100, 100);

  stroke(0);
  noFill();
  fill(0, 125, 40);
  ellipseMode(CENTER);
  ellipse(mouseX+80, MonsterY-80, 100, 100);

  //Lichaam
  stroke(0);
  ellipseMode(CENTER);
  ellipse(mouseX, MonsterY, 200, 200);

  //Oog
  strokeWeight(1);
  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(mouseX, MonsterY-45, 150, 50);

  //Kleur oog
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX, MonsterY-45, 45, 45);

  //Pupil oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX, MonsterY-45, 15, 15);

  //Neusgaten
  noStroke();
  fill(0, 100, 40);
  ellipseMode(CENTER);
  ellipse(mouseX-10, MonsterY+10, 10, 10);
  ellipseMode(CENTER);
  ellipse(mouseX+10, MonsterY+10, 10, 10);

  //Mond
  stroke(0);
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX, MonsterY+60, 80, 45);

  //Tanden
  noStroke();
  fill(255, 255, 255);
  rect(mouseX-9, MonsterY+37, 8, 15);
  rect(mouseX+1, MonsterY+37, 8, 15);
}


 void update(){
  MonsterY=MonsterY-1;
 }
 
 void test(){
    if (mouseX > width) {
mouseX=width;
  }
 }
