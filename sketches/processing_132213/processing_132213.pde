
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;

void setup() {
  size(500,500);
  mijnMonster = new Monster(400, 80, 1);
  mijnMonster2 = new Monster(100, 50, 2);
  mijnMonster3 = new Monster(250, 20, 3);
}

void draw() {
  background(255);
  mijnMonster.update();
  mijnMonster.drawMonster();
  mijnMonster.test();
  
  mijnMonster2.update();
  mijnMonster2.drawMonster();
  mijnMonster2.test();
  
  mijnMonster3.update();
  mijnMonster3.drawMonster();
  mijnMonster3.test();
}



class Monster{
int X;
int richting;
int teller = 0;
int spatie;
int y;
int stop;
int monsterX;
int monsterY;
boolean test = true;

  Monster(int tempX, int tempY, int tempRichting){
    monsterX = tempX;
    monsterY = tempY;
    richting = tempRichting;
    test = true;
  }
  
void update(){
  monsterY = monsterY + richting;
  if(monsterY > width){
    richting = - richting;}
}

void test(){
  if(monsterY <=0 || monsterY >= height){
    richting = - richting;
    teller = teller + 1;
  }
}

void drawMonster(){
  /*body*/
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY, 100, 90);
  
  /*inside*/
  fill(240, 174, 174);
  ellipseMode(CENTER);
  ellipse(monsterX,monsterY, 60, 69);
  stroke(0);
  
if(test ==true){
    fill(191, 52, 52);
  }
  
  if(test == false){
    fill(234, 121, 0);
  }
  
  /*head*/
  ellipseMode(CENTER);
  ellipse(monsterX,monsterY -60, 80, 60);
  
    /*mouth*/
  fill(0);
  ellipseMode(CENTER);
  ellipse(monsterX,monsterY -48, 18, 19);
  
  /*teeth left*/
  fill(255);
  rect(monsterX -5,monsterY -57, 5,8);
 
  /*teeth right*/
  fill(255);
  rect(monsterX,monsterY -57, 5, 8);
  
  /*eye*/
  fill(247, 245, 245);
  ellipseMode(CENTER);
  ellipse(monsterX,monsterY -76, 35, 26);
  
  /*pupil*/
  fill(0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY -75, 18, 18);
  
  /*iris*/
  fill(247, 245, 245);
  ellipseMode(CENTER);
  ellipse(monsterX +3, monsterY -71, 5, 5);
  
if(test ==true){
    fill(191, 52, 52);
  }
  
  if(test == false){
    fill(234, 121, 0);
  }
  
  /*foot left*/
  ellipseMode(CENTER);
  ellipse(monsterX -25, monsterY +40, 30, 38);
  
  /*foot right*/
  ellipseMode(CENTER);
  ellipse(monsterX +25, monsterY +40, 30, 38);
  
  /*hand left*/
  ellipseMode(CENTER);
  ellipse(monsterX -45, monsterY -13, 28, 33);
  
  /*hand right*/
  ellipseMode(CENTER);
  ellipse(monsterX +45, monsterY -13, 28, 33);
   
  /*repeat*/
  if(monsterY==-30) {
    monsterY=200;
  }
}
}

