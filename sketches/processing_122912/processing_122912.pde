
int monsterX;
int monsterY;

void setup() {
  size(200, 200);
  background(255);
  monsterY = 100;
}

void draw() {
  background(255);
  monsterX = mouseX;
  monsterY = monsterY-1;
  rectMode(CENTER);
  stroke(0);
  fill(0, 180, 0);
  rect( monsterX, monsterY, 40, 100); // body
  fill(0, 180, 0);
  ellipse(monsterX, monsterY-30, 60, 60); //head
  fill(0);
  noStroke();
  ellipse(monsterX-19, monsterY-30, 16, 32); //left eye
  ellipse(monsterX+19, monsterY-30, 16, 32); //right eye
  fill(255);
  ellipse(monsterX-20, monsterY-30, 10, 10); //left pupil
  ellipse(monsterX+20, monsterY-30, 10, 10); //right pupil
  stroke(0);
  line(monsterX-20, monsterY+50, monsterX-25, monsterY+70); //left leg
  line(monsterX-25, monsterY+70, monsterX-35, monsterY+70); //left foot
  line(monsterX+20, monsterY+50, monsterX+25, monsterY+70); //right leg
  line(monsterX+25, monsterY+70, monsterX+35, monsterY+70); //right foot
  line(monsterX-20, monsterY, monsterX-50, monsterY+10); //left arm
  line(monsterX+20, monsterY, monsterX-50, monsterY+10); //right arm
  fill(85, 70, 0);
  noStroke();
  triangle(monsterX-50, monsterY+10, monsterX-35, monsterY-90, monsterX-70, monsterY-81); //knuppel
  // herhalen
  if(monsterY==-80) {
    monsterY=300;
  }

}
