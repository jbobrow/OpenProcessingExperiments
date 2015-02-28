
Monster bewegen;
Monster bewegen2;

void setup() {
  size(500,500);
  bewegen = new Monster(0,200,3);
  bewegen2 = new Monster(0,10,1);
}

void draw() {
  background(255);
  bewegen.updateMonster();
  bewegen.testMonster();
  bewegen.tekenMonster();
  
  bewegen2.updateMonster();
  bewegen2.testMonster();
  bewegen2.tekenMonster();
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
  rectMode(CENTER);
  /* Antenne */
  fill(255,10,0);
  ellipse(x,y,10,10); //220 194
  fill(0);
  rect(x,y+16,1,20); //220 210
  /* Lijf */
  fill(255,245,5);
  rect(x+30,y+56,100,60); //250 250
  fill(180,180,180);
  rect(x+30,y+116,40,60); //250 310
  /* Armen */
  line(x+10,y+106,x+30,y+126); //230 300 250 320
  line(x+50,y+106,x+70,y+126); //270 300 290 320
  /* Benen */
  line(x+10,y+146,x+10,y+176); //230 340 230 370
  line(x+50,y+146,x+50,y+176); //270 340 270 370
  /* Ogen */
  fill(0,100,255);
  ellipse(x+10,y+46,12,12); //230 240
  fill(0,100,255);
  ellipse(x+40,y+46,10,10); //260 240
}
}
