
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;
  
void setup() {
  size(500, 500);          // x,y,snelheid
  mijnMonster = new Monster(100,50,3); 
  mijnMonster2 = new Monster(300,90,10);
  mijnMonster3 = new Monster(50,200,5);
  }
  
void draw() {
  background(255);
  mijnMonster.update();
  mijnMonster.testRand();
  mijnMonster.drawMonster(); 
    
  mijnMonster2.update();
  mijnMonster2.testRand();
  mijnMonster2.drawMonster();
    
  mijnMonster3.update();
  mijnMonster3.testRand();
  mijnMonster3.drawMonster();
}
  
class Monster{
int monsterX; //pos x-as
int monsterY; //posy-as
int richting; // de snelheid en richting van het monster
int teller; //teller om van kleur te veranderen
boolean test; //kleur
  
  Monster(int tempX, int tempY, int tempRichting){ //ingestelde ''tijdelijke''waarde in set up
  monsterX = tempX;
  monsterY = tempY; 
  richting = tempRichting;
  test = true;
  }
 
void update(){
 monsterY = monsterY + richting;
}
  
void testRand(){
    if(monsterY <0 || monsterY > height){  
    richting = -richting; //omdraaien richting
    teller = teller + 1; 
  }
}
 
 void drawMonster(){ // het monster tekenen

 if(teller == 10){ teller = 0; test = !test;}
//hoofd
fill(28,24,255);
ellipse (monsterX+105, monsterY+20, 80, 80);

 
 
//buik
 if( test == true){
   fill(255,0,0);
 }
 else {
   fill (0,255,0);
 }
//fill (67,192,247);
rect(monsterX+40,monsterY+60,130,130);
 
//voeten
fill (0,145,252);
rect(monsterX+40,monsterY+190,30,30);
rect(monsterX+140,monsterY+190,30,30);
 
//armen, mond en navel
 
 if( test == true){
   fill(255,0.0);
 }
 else {
   fill (0,255,0);
 }
    
line (monsterX-50,monsterY+60,monsterX+280,monsterY+60);
line (monsterX-50,monsterY+60,monsterX-50,monsterY+10);
line (monsterX+280,monsterY+60,monsterX+280,monsterY+100);
fill(22,0,175);
ellipse (monsterX+105,monsterY+145,10,10);
strokeWeight(3);
line(monsterX+71, monsterY+40, monsterX+139, monsterY+40);
 
// ogen
fill (3,255,21);
strokeWeight(2);
ellipse (monsterX+123,monsterY+10,16,32);
ellipse (monsterX+88,monsterY+10,16,32);
println(teller); 
}
  }

