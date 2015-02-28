
int monsterX;
int monsterY;
int teller;
boolean einde;

void setup() {
  size(500, 500);
  monsterX = 80;
  monsterY = 150;
  teller = 0;
  einde = false;
  
}
void draw() {
  background(255);
  
  
  ellipse(monsterX, monsterY-50, 80, 60);
  fill(50);
  ellipse(monsterX-29, monsterY-50, 16, 32);   
  ellipse(monsterX+29, monsterY-50, 16, 32);
  ellipse(monsterX, monsterY-30, 10, 10);
  fill(150,0,50); //Kleur lichaam RGB
  ellipse(monsterX, monsterY, 40, 40); //lichaam //X=100 Y=130
  line(monsterX-30, monsterY+10, monsterX-20, monsterY);   //armen links
  line(monsterX+20, monsterY, monsterX+30, monsterY+10); //armen rechts
  line(monsterX-10, monsterY+15, monsterX-20, monsterY+40);   //benen links
  line(monsterX+10, monsterY+15, monsterX+20, monsterY+40); //benen rechts
  line(monsterX-30, monsterY-70, monsterX-70, monsterY-110); //spriet links
  line(monsterX+30, monsterY-70, monsterX+70, monsterY-110);  //spriet rechts

//bewegen monster naar rechts
if(monsterX >=80 && monsterY ==150){
  monsterX = monsterX +10;
  teller=teller+1;
}
//bewegen monster naar links
if(monsterX <= 420 && monsterY == 350){
  monsterX = monsterX -10;
}
//bewegen monster omlaag
if (monsterX == 350 && monsterY >=80){
  monsterY = monsterY +10;
}

//bewegen monster omhoog
if (monsterX == 80 && monsterY <=350){
  monsterY = monsterY -10;
}
if (teller == 100){
 einde=true;
}

if(einde==false){
  fill(0,0,255);
}
if(einde==true){
  fill(0,255,0);
}



}
