
int monsterY;
int monsterX;
int richting;
int teller;
int kleur;
boolean test;
 
 
void setup(){
  size(500,500);
  monsterY=height/2;
  monsterX=width/2;
  richting = 10;
  teller = 0;
  test = false;
  kleur = 1;
 
 
}
 
void draw(){
  teken();
  test();
  update();
}

void teken(){
  background(255);
 
//body
noStroke();
if(kleur == 1) {
  fill(242,115,17);
  }
if(kleur == 2) {
  fill(0);
  }
 
ellipseMode(CENTER);
ellipse(monsterX,monsterY,80,60);
 
//face
noStroke();
fill(255,237,183);
ellipseMode(CENTER);
ellipse(monsterX,monsterY-40,70,58);
 
//mouth
noStroke();
fill(0);
rectMode(CENTER);
rect(monsterX,monsterY-20,10,1);
 
//hatleft
noStroke();
fill(65,193,60);
rectMode(CENTER);
rect(monsterX-34,monsterY-40,17,28);
 
//hatright
noStroke();
fill(65,193,60);
rectMode(CENTER);
rect(monsterX+34,monsterY-40,17,28);
 
//hat
noStroke();
fill(65,193,60);
rectMode(CENTER);
rect(monsterX,monsterY-66,70,26);
 
//hatinside
noStroke();
fill(43,117,48);
rectMode(CENTER);
rect(monsterX,monsterY-60,60,14);
 
//lefteye
noStroke();
fill(255,255,255);
ellipseMode(CENTER);
ellipse(monsterX-9,monsterY-42,18,22);
 
//righteye
noStroke();
fill(255,255,255);
ellipseMode(CENTER);
ellipse(monsterX+9,monsterY-42,18,22);
 
//lefteyepupil
noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(monsterX-4,monsterY-42,2,2);
 
//righteyepupil
noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(monsterX+4,monsterY-42,2,2);
 
//pants
noStroke();
fill(21,114,92);
rectMode(CENTER);
rect(monsterX,monsterY+25,60,22);
 
//righthand
noStroke();
fill(65,193,60);
ellipseMode(CENTER);
ellipse(monsterX+30,monsterY+10,20,20);
 
//lefthand
noStroke();
fill(65,193,60);
ellipseMode(CENTER);
ellipse(monsterX-30,monsterY+10,20,20);
 
//shoes
noStroke();
fill(40,40,40);
rectMode(CENTER);
rect(monsterX,monsterY+36,70,4);
 
}

void test(){
  if(monsterX > 600 || monsterX < 0){
  richting = -richting;
  teller = teller+1;
  println(teller);
  println(test);
}
  
if(teller==10) {
  test = true;
  kleur=2;
 
}
if(teller==20) {
  test = true;
  kleur=1;
  teller=0;
}
}

void update(){
  monsterX = monsterX - richting;
}

