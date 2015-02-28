
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;
int spatie;
int loopY;
int loopX;

void setup() {
  size(200, 200);
  background(255);
  monsterY = 100;
  richting = 5;
  teller = 0;
  test = true;
  spatie = 20;
}

void draw() {
  background(255);
  achtergrond();
  update();
  testRand();
  drawMonster();
  monsterX = mouseX; 
}

void achtergrond(){
  while(loopY<200){
    fill(random(255), random(255), random(255));
    rect(0, loopY, 500, 2);
    loopY = loopY + spatie;
  }
  loopY=0; //verticale strepen (loop)
  while(loopX<200){
    fill(random(255), random(255), random(255));
    rect(loopX, 0, 2, 500);
    loopX = loopX + spatie;
  }
  loopX=0;
}

void update(){
 monsterY = monsterY + richting; 
}

void testRand(){
    if(monsterY <= 0 || monsterY >= height){  //voorwaarde heen en weer bewegen
    richting = -richting; //omdraaien van richting
    teller = teller + 1; //de teller
  } 
}

void drawMonster(){
 rectMode(CENTER);
  stroke(0);
  if(test){fill(0, 180, 0);}
  if(!test){fill(0,100, 0);}
  if(teller == 10){ teller = 0; test = !test;}
  //fill(0, 180, 0);
  rect( monsterX, monsterY, 40, 100); // body
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
}
