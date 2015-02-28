
Monster Monster1;
Monster Monster2;
Monster Monster3;

void setup () {
  size(500, 500);
  Monster1 = new Monster(50,200);
  Monster2 = new Monster(200,200);
  Monster3 = new Monster(400,200);
}

void draw () { 
  background(164);
  Monster1.teken();
  Monster2.teken();
  Monster3.teken();}
    
class Monster {
  int monsterX;
  int monsterY;
  
 Monster(int tempX, int tempY){
   monsterX=tempX;
   monsterY=tempY; }
    
void teken(){
  for(int i = 0; i < 1131; i = i + 36){
    stroke(#979797,150);
    strokeWeight(37);
    line(427-i,0,1225-i,550); }
  stroke(#393939);
  strokeWeight(7);
  fill(#FF1C1C);
  rect(monsterX-75, monsterY-145, 200, 250);
  fill(#76A2C6);
  rect(monsterX-50, monsterY-120, 50, 80);
  rect(monsterX+50, monsterY-120, 50, 80);
  fill(0);
  rect(monsterX-15, monsterY-90, 15, 50);
  rect(monsterX+50, monsterY-90, 15, 50);
  fill(#E84F1C);
  rect(monsterX+12, monsterY-30, 25, 50);
  rect(monsterX, monsterY, 12, 20);      // 100, 170
  rect(monsterX+37, monsterY, 12, 20);
  fill(#9D918D);
  rect(monsterX-50, monsterY+40, 150, 40);
  fill(#FF1C1C); 
  triangle(monsterX-45,monsterY-145,monsterX-75,monsterY-183,monsterX-75,monsterY-145); 
  triangle(monsterX+95,monsterY-145,monsterX+125,monsterY-183,monsterX+125,monsterY-145); 
  rect(monsterX+15, monsterY+105, 30, 80);
  rect(monsterX-5, monsterY+200, 20, 60);
  rect(monsterX+45, monsterY+200, 20, 60);
  rect(monsterX-5, monsterY+180, 70, 20);
  rect(monsterX-45, monsterY+130, 150, 20); 
 }
}

