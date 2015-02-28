
Monster eersteMonster;
Monster tweedeMonster;
Monster derdeMonster;


void setup() {
  size(600, 600);
  
  eersteMonster = new Monster(100,100,5);
  tweedeMonster = new Monster(200,250,7);
  derdeMonster = new Monster(400,350,2);
}


void draw() {
  background(255);
  
  eersteMonster.updateMonster();
  eersteMonster.testMonster();
  eersteMonster.tekenMonster();
  
  tweedeMonster.updateMonster();
  tweedeMonster.testMonster();
  tweedeMonster.tekenMonster();
  
  derdeMonster.updateMonster();
  derdeMonster.testMonster();
  derdeMonster.tekenMonster();
  
}


class Monster{
  int monsterX;
  int monsterY;
  int snelheid;
  
  Monster(int tempX, int tempY, int tempSnelheid){
    monsterX = tempX;
    monsterY = tempY;
    snelheid = tempSnelheid;
  }
  
  
  void updateMonster(){
    monsterX = monsterX + snelheid;
  }
  
  void testMonster(){
    if(monsterX > width || monsterX < 0){
    snelheid = snelheid * -1;
    }
  }
  
  
  
  
  
  
  void tekenMonster(){
    //lichaam
  fill(255, 255, 0);
  noStroke();
  ellipse(monsterX+75, monsterY, 150, 100);
  rect(monsterX, monsterY, 150, 200);

  //armen
  rect(monsterX-40,monsterY+130,50,20);
  rect(monsterX+140,monsterY+130,50,20);


  //streep
  fill(0);
  rect(monsterX, monsterY+30, 150, 20);


  //linkeroog
  stroke(0);
  fill(0);
  ellipse(monsterX+40, monsterY+40, 60, 60);
  fill(255);
  ellipse(monsterX+40, monsterY+40, 50, 50);
  fill(0);
  ellipse(monsterX+45, monsterY+45, 15, 15);


  //rechteroog

  fill(0);
  ellipse(monsterX+110, monsterY+40, 60, 60);
  fill(255);
  ellipse(monsterX+110, monsterY+40, 50, 50);
  fill(0);
  ellipse(monsterX+105, monsterY+45, 15, 15);

  //mond
  fill(255);
  ellipse(monsterX+75, monsterY+110, 100, 20);


  //broek
  noStroke();
  fill(0, 0, 225);
  rect(monsterX+25, monsterY+140, 100, 60);
  rect(monsterX, monsterY+130, 150, 30);

  //benen
  fill(255, 255, 0);
  rect(monsterX+35, monsterY+190, 20, 30);
  rect(monsterX+95, monsterY+190, 20, 30);

  //voeten
  fill(0);
  rect(monsterX+25, monsterY+210, 30, 20);
  rect(monsterX+95, monsterY+210, 30, 20);
  }
}
