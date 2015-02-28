
int X = 500;
 
void setup(){
  size(1000,800);
}
 
void draw(){
  background(255);
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  for (int i = -1; i< 4; i++){
  monster((i*250),X);}
}
 
void monster(int monsterX, int monsterY){
  //Oren
  strokeWeight(2);
  stroke(0);
  noFill();
  fill(0, 125, 40);
  ellipseMode(CENTER);
  ellipse(monsterX-80, monsterY-80, 100, 100);

  stroke(0);
  noFill();
  fill(0, 125, 40);
  ellipseMode(CENTER);
  ellipse(monsterX+80, monsterY-80, 100, 100);

  //Lichaam
  stroke(0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY, 200, 200);

  //Oog
  strokeWeight(1);
  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY-45, 150, 50);

  //Kleur oog
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY-45, 45, 45);

  //Pupil oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY-45, 15, 15);

  //Neusgaten
  noStroke();
  fill(0, 100, 40);
  ellipseMode(CENTER);
  ellipse(monsterX-10, monsterY+10, 10, 10);
  ellipseMode(CENTER);
  ellipse(monsterX+10, monsterY+10, 10, 10);

  //Mond
  stroke(0);
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY+60, 80, 45);

  //Tanden
  noStroke();
  fill(255, 255, 255);
  rect(monsterX-9, monsterY+37, 8, 15);
  rect(monsterX+1, monsterY+37, 8, 15);
  
}

