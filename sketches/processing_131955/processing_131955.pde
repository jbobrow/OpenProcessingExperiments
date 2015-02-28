
// Ik heb hem niet bewegend gekregen.

Monster scaryMonster;
Monster scaryMonstertwee;
Monster scaryMonsterdrie;

void setup (){
  size(500,300);
  scaryMonster = new Monster (205,25,5); // plaats van het monster bepalen
  scaryMonstertwee = new Monster (75,85,10);
  scaryMonsterdrie = new Monster (200,250,2);
}

void draw () {
  background(255);
  scaryMonster.update();
  scaryMonster.testRand();
  scaryMonsterdrie.drawMonster();
 
  scaryMonstertwee.update();
  scaryMonstertwee.testRand();
  scaryMonstertwee.drawMonster();
  
  scaryMonsterdrie.update();
  scaryMonsterdrie.testRand();
  scaryMonsterdrie.drawMonster();
}

class Monster{
int monsterX;
int monsterY;
int richting;
int teller; // telt het aantal keer dat het monster de rand raakt. 
boolean test; // verandering kleur

  Monster(int tempX, int tempY, int tempRichting){
    monsterX = tempX;
    monsterY = tempY;
    richting = tempRichting;
    test = true;
  }
  
  void update() {
    monsterX = monsterX + richting;
  }
  
  void testRand() {
    if(monsterX < 0 || monsterX > width);
    richting = - richting;
    
    if (teller == 10) {
      teller = 0;
      test = !test;
    }
    teller = teller +1;
  }
  
  

void drawMonster (){
   
// hand links
 
fill(288,189,4);
ellipse(monsterX-35,monsterY,40,20);
 
// hand rehts
 
fill(288,189,4);
ellipse(monsterX+35,monsterY,40,20);
 
// lijfje
fill(0,0,0);
ellipse(monsterX,monsterY +1,60,80);
 
// hoofd
 
fill(71,203,236);
ellipse(monsterX,monsterY-50,70,90);
 
// hoedje
 
fill(0,0,0);
triangle(monsterX-25,monsterY-82,monsterX,monsterY-112,monsterX+25,monsterY-82);
 
// oog rehts:
 
fill(0,0,0);
ellipse(monsterX+15,monsterY-60,15,25);
 
// oog links:
 
fill(0,0,0);
ellipse(monsterX-10,monsterY-60,15,25);
 
// mond
 
fill(0,0,0);
rectMode(CORNER);
rect(monsterX-20,monsterY-40,40,5);
 
fill(255,0,0);
rect(monsterX-5,monsterY-40,12,5);
 
// tand links
 
fill(225);
triangle(monsterX-20,monsterY-35,monsterX-15,monsterY-25,monsterX-10,monsterY-35);
 
// tand rechts
 
fill(225);
triangle(monsterX+10,monsterY-35,monsterX+15,monsterY-25,monsterX+20,monsterY-35);
 
// voet rechts
 
fill(228,189,4);
ellipse(monsterX+30,monsterY+40,50,30);
 
// voet links
 
fill(228,189,4);
ellipse(monsterX-30,monsterY+40,50,30);
}
}
