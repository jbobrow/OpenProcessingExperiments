
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;

void setup() {
  size(500, 500);
  mijnMonster = new Monster(200,30,5); //monster aanmaken met de positie 200,30 en de snelheid 5
  mijnMonster2 = new Monster(70,80,10);
  mijnMonster3 = new Monster(400,200,20);
  }

void draw() {
  background(255);
  mijnMonster.update();
  mijnMonster.testRand();
  mijnMonster.drawMonster(); //een laag dieper (in de class) het monster tekenen
  
  mijnMonster2.update();
  mijnMonster2.testRand();
  mijnMonster2.drawMonster();
  
  mijnMonster3.update();
  mijnMonster3.testRand();
  mijnMonster3.drawMonster();
}

class Monster{// class van het monster
int monsterX; //positie op de x-as
int monsterY; //positie op de y-as
int richting; // de snelheid en richting van het monster
int teller; //teller om van kleur te veranderen
boolean test; //kleur

  Monster(int tempX, int tempY, int tempRichting){
  monsterX = tempX;
  monsterY = tempY; //de positie van het monster bepalen door wat ingevuld wordt bij de setup
  richting = tempRichting;
  test = true;
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

void drawMonster(){ // het monster tekenen
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
}
