
int monsterY;
int monsterX;
int richting;
int teller;
int kleur;
boolean test;
int x;
int spatie;
int stop;



void setup(){
  background(255);
  size(500,500);
  monsterY=height/2;
  monsterX=width/2;
  richting = 10;
  teller = 0;
  test = false;
  kleur = 1;
  x = 0;
  spatie = 30;
  stop = 500;
  
  


}

void draw(){
noStroke();
ellipseMode(CENTER);
rectMode(CENTER);

while(x < stop){
   println("test");
   noStroke();
   fill(125);
   rect(x,0,15,1000);
   x = x + spatie;
} 

//body
if(kleur == 1) {
  fill(242,115,17);
  }
if(kleur == 2) {
  fill(0);
  }

ellipse(monsterX,monsterY,80,60);

//face
fill(255,237,183);
ellipse(monsterX,monsterY-40,70,58);

//mouth
fill(0);
rect(monsterX,monsterY-20,10,1);

//hatleft
fill(65,193,60);
rect(monsterX-34,monsterY-40,17,28);

//hatright
fill(65,193,60);
rect(monsterX+34,monsterY-40,17,28);

//hat
fill(65,193,60);
rect(monsterX,monsterY-66,70,26);

//hatinside
fill(43,117,48);
rect(monsterX,monsterY-60,60,14);

//lefteye
fill(255,255,255);
ellipse(monsterX-9,monsterY-42,18,22);

//righteye
fill(255,255,255);
ellipse(monsterX+9,monsterY-42,18,22);

//lefteyepupil
fill(0);
ellipse(monsterX-4,monsterY-42,2,2);

//righteyepupil
fill(0);
ellipse(monsterX+4,monsterY-42,2,2);

//pants
fill(21,114,92);
rect(monsterX,monsterY+25,60,22);

//righthand
fill(65,193,60);
ellipse(monsterX+30,monsterY+10,20,20);

//lefthand
fill(65,193,60);
ellipse(monsterX-30,monsterY+10,20,20);

//shoes
fill(40,40,40);
rect(monsterX,monsterY+36,70,4);

//monsterX = monsterX - richting;
//while( monsterX == 250){

//  try {
//    Thread.sleep(1000);
//} catch(InterruptedException ex) {
//    Thread.currentThread().interrupt();
//}

//  break;
//};

//if(monsterX > 500 || monsterX < 0){
  //richting = -richting;
  //teller = teller+1;
  //println(teller);
 // println(test);
//}
 
//if(teller==10) {
//  test = true;
//  kleur=2;

//}
//if(teller==20) {
  //test = true;
  //kleur=1;
  //teller=0;
//}
}

