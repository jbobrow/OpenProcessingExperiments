
int monsterX;
int monsterY;
int teller;
int richting;
boolean test;

void setup() {
  size(300, 300);
  monsterX=75;
  monsterY=70;
  richting=10;
  teller = 0;
  test = false;
}

void draw() {
  background(255);
  
  
    if(test == true) {
  fill(0);
  } else {
  fill(159, 138, 125);
  }
   rect(monsterX +45, monsterY +50, 25, 8, 2);//rechteram 120, 120
  rect(monsterX, monsterY, 50, 80, 10); //body//x75 y70

  line(monsterX +12, monsterY+65, monsterX+40, monsterY+65); //mond//85,135 //115, 135
 
  line(monsterX +19, monsterY +65, monsterX +22, monsterY +70); //links tand, 94, 135, 97, 140
   ellipseMode(CENTER);
  line(monsterX +22, monsterY +70, monsterX +25, monsterY +65); //rechts tand 97, 140, 100, 135
 ellipseMode(CENTER);
 
     if(test == true) {
  fill(0);
  } else {
  fill(227, 156, 18);
  }
  line(monsterX +35, monsterY, monsterX+35, monsterY -25);//antenne 110, 70, 110, 50
   
  ellipse(monsterX +35, monsterY -25, 8, 8);//antennebol 110, 50


    if(test == true) {
  fill(0);
  } else {
  fill(159, 138, 125);
  }
  rect(monsterX +4, monsterY +79, 20, 12, 2);//linkerbeen 79 149
  rect(monsterX +26, monsterY +79, 20, 12, 2);//rechterbeen 101 149

    if(test == true) {
  fill(0);
  } else {
  fill(159, 138, 125);
  }
  rect(monsterX -20, monsterY +50, 25, 8, 2);//linkerarm 55, 120

  fill(0);

  ellipse(monsterX +25, monsterY+40, 15, 15);//oog links
  ellipse(monsterX +47, monsterY+40, 15, 15);//oog rechts
  
   
  monsterX = monsterX + richting;
  if(monsterX > 270 || monsterX < 0){
    richting = -richting;
    teller++;
  }
   
  if(teller == 10) {
    teller = 0;
    test = !test;


}
}

