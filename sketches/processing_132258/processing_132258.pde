
Monster move;
Monster move2;
Monster move3;
 
void setup() {
  size(500,500);
  move = new Monster(0,350,2);
  move2 = new Monster(0,150,3);
  move3 = new Monster(0,80,1);
}
 
void draw() {
  background(255);
  move.updateMonster();
  move.testMonster();
  move.tekenMonster();
   
  move2.updateMonster();
  move2.testMonster();
  move2.tekenMonster();
  
  move3.updateMonster();
  move3.testMonster();
  move3.tekenMonster();
}
 
class Monster {
  int x;
  int y;
  int snelheid;
   
  Monster(int tempX, int tempY, int tempSnelheid) {
    x = tempX;
    y = tempY;
    snelheid = tempSnelheid;
  }
   
  void updateMonster(){
    x = x+snelheid;
  }
 
  void testMonster(){
   if(x > width || x < 0){
     snelheid = snelheid * -1;
   }
  }
   
  void tekenMonster() {
    noStroke();
  fill(236, 231, 24);
  rectMode(CENTER);
  rect(x-30, y, 25, 5);
  rect(x+30, y, 25, 5);
 
 
  //legs
 
  noStroke();
  fill(236, 231, 24);
  rectMode(CENTER);
  rect(x-10, y+50, 5, 25);
  rect(x+10, y+50, 5, 25);
 
 
  //body
  noStroke();
  fill(236, 231, 24);
  ellipseMode(CENTER);
  ellipse(x, y, 60, 100);
 
  //eye
 
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(x, y-20, 58, 5);
 
  stroke(180);
  fill(255);
  ellipseMode(CENTER);
  ellipse(x, y-20, 30, 30);
 
  stroke(0);
  fill(0);
  ellipse(x, y-20, 10, 10);
 
  //mouth
 
  fill(50);
  ellipseMode(CENTER);
  ellipse(x, y+20, 30, 5);
  }
}

