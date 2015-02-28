
Monster eersteMonster;
Monster tweedeMonster;
Monster derdeMonster;

void setup(){
size(500,500);

eersteMonster = new Monster(100,100,1);
tweedeMonster = new Monster(200,200,3);
derdeMonster = new Monster(300, 300, 5);

}

void draw(){

background(200);

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
  snelheid = -snelheid;
  
}
}

void tekenMonster(){
fill(255,0,150);
stroke(0);
ellipseMode(CENTER); 
ellipse(monsterX,monsterY,100,100);  //hoofd

stroke(0);
fill(255);
ellipse(monsterX+30,monsterY-10,35,35);                  //oog
ellipse(monsterX-31,monsterY-10,35,35);                  //oog

fill(0);
rect(monsterX-20,monsterY+30,38,76);   //mond

fill(250,0,0);
ellipse(monsterX-1,monsterY+96,30,20); //tong

line(monsterX-4,monsterY+96,monsterX+14,monsterY+83);        //tongspleet

fill(255);
rect(monsterX-20,monsterY+30,38,10);    //tanden

stroke(0);
line(monsterX-41,monsterY+4,monsterX-41,monsterY+19);       //wallen
line(monsterX-37,monsterY+7,monsterX-37,monsterY+22);
line(monsterX-33,monsterY+8,monsterX-33,monsterY+16);

                         
}
}

