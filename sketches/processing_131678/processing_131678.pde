
monster mijnMonster;
monster mijnMonster2;
monster mijnMonster3;

float positieX = 100;
float richting = 1.5;
int score = 0;
boolean test = false;
int stop = 500;

void setup () {
  size(500,500);
  
  mijnMonster = new monster (100, 100, 1);
  mijnMonster2 = new monster (250, 250, 5);
  mijnMonster3 = new monster (400, 400, 3);
}

void draw () {
  background(255);
       
  mijnMonster.update();
  mijnMonster.lichaamSwitch();
  mijnMonster.hoorntjes();
  mijnMonster.monsterOog();
  mijnMonster2.update();
  mijnMonster2.lichaamSwitch();
  mijnMonster2.hoorntjes();
  mijnMonster2.monsterOog();
  mijnMonster3.update();
  mijnMonster3.lichaamSwitch();
  mijnMonster3.hoorntjes();
  mijnMonster3.monsterOog();
}

 class monster {
  float positieX;
  float positieY;
  float richting;
 
  monster(float tempPositieX, float tempPositieY, float tempRichting) {
  positieX = tempPositieX;
  positieY = tempPositieY;
  richting = tempRichting;
}
  
  
  
void update() {
  positieX = positieX + richting;
  
if(positieX > stop || positieX < 0){
  richting = -richting;
  score = score +1;
  println(score);
}

if(score == 10){
  score = 0;
  test = !test;
}


}
void hoorntjes(){
  fill(0);
  stroke(0);
  triangle(positieX+10, 120, positieX+20, 110, positieX+30, 130); // rechte driehoek
  triangle(positieX-30, 130, positieX-20, 110, positieX-10, 120); // linkse driehoek
  triangle(positieX+20, 120, positieX+20, 110, positieX+40, 130); // rechte driehoek
  triangle(positieX-40, 130, positieX-20, 110, positieX-20, 120); // linkse driehoek
  triangle(positieX+10, 245, positieX+20, 110, positieX+30, 130); // rechte driehoek
  triangle(positieX-30, 130, positieX-20, 110, positieX-10, 245); // linkse driehoek
}
  
void lichaamSwitch(){
  noStroke();
  if(test == true){
  fill(550,255,0);
  ellipse(positieX,190,115,140);                    // Geel lichaam
}
  if(test == false){
  fill(255,2,2);
  ellipse(positieX,190,115,140);                    // Rode lichaam
}
  }

void monsterOog(){  
  fill(255);
  ellipse(positieX,160,55,60);                      // Witte oog
  
  fill(0);
  noStroke();
  ellipse(positieX,165,30,30);                      // Zwarte pupil
  
  fill(255);
  noStroke();
  ellipse(positieX,165,10,10);                      // Wit oog in pupil  
}
}

