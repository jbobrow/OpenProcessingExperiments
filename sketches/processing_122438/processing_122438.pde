
int monsterX;
int monsterY;

void setup() {
  size(200, 200);
  monsterX=75;
  monsterY=70;
}

void draw() {
  background(255);
  
  fill(159, 138, 125);
   rect(mouseX +45, monsterY +50, 25, 8, 2);//rechteram 120, 120
  rect(mouseX, monsterY, 50, 80, 10); //body//x75 y70

  line(mouseX +12, monsterY+65, mouseX+40, monsterY+65); //mond//85,135 //115, 135
 
  line(mouseX +19, monsterY +65, mouseX +22, monsterY +70); //links tand, 94, 135, 97, 140
   ellipseMode(CENTER);
  line(mouseX +22, monsterY +70, mouseX +25, monsterY +65); //rechts tand 97, 140, 100, 135
 ellipseMode(CENTER);
 
  fill(227, 156, 18);
  line(mouseX +35, monsterY, mouseX+35, monsterY -25);//antenne 110, 70, 110, 50
   
  ellipse(mouseX +35, monsterY -25, 8, 8);//antennebol 110, 50


  fill(159, 138, 125);
  rect(mouseX +4, monsterY +79, 20, 12, 2);//linkerbeen 79 149
  rect(mouseX +26, monsterY +79, 20, 12, 2);//rechterbeen 101 149

  fill(159, 138, 125);
  rect(mouseX -20, monsterY +50, 25, 8, 2);//linkerarm 55, 120

  fill(0);

  ellipse(mouseX +25, monsterY+40, 15, 15);//oog links
  ellipse(mouseX +47, monsterY+40, 15, 15);//oog rechts
  
  monsterY--;

}

