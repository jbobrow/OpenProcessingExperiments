
int monsterX;
int monsterY;
int richting; 
int teller;
boolean test;

float i=50;

int y;
int spatie;
int stop;
int breedte;
int hoogte;
 

void setup(){
size(500,500);
monsterX = 100;
monsterY = 100;
richting = 10;
teller = 0;
test = true;
spatie = 300;
stop = 1000;
breedte = 10;
}

void draw(){
background(255,255,255);
strokeWeight(2);
stroke(200,50,50);
ellipseMode(CENTER);
background(255);

/*
loopRegen(); 
updateX();
moveRand();
*/


 for(int i=0; i<stop; i=i+spatie){
    drawMonster(i,100);

}
}

/*
void loopRegen() {

 
  fill(100, 30, 20);
 
  if (test == true) {
    fill(0);
  }
  else if (test == false) {
    fill(55, 0, 0);
  }
  strokeWeight(1);
      for(int i=0; i < 100; i ++){
    stroke(100,60,60);
  ellipse(random(0,500),random(0,500),1,75);
    
   }
  while (i > 500) { i = 0; }
   
  strokeWeight(3);
 
 stroke(96, 0, 0);
}


void updateX() {

monsterY = monsterY + richting;
}



void moveRand () {
 
  if(monsterY > 450 || monsterY <-60){
    richting= -richting;
    teller = teller+1;
  }
   
  if(teller == 10){
teller=0;
test =!test;

  }
}
*/

void drawMonster(int monsterX, int monsterY){

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









