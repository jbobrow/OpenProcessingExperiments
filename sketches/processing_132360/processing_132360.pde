
int monsterX;
int monsterY;

int richting;
int teller;
int spatie;
int stop;
int y;

boolean test;

void setup() {

  size(500, 500);
  monsterX = 300;
  monsterY = 190;
  richting = 5;
  teller = 0;
  spatie = 20;
  stop = 500;
  y = 0;


  test = true;
}

void draw() {
  background(255, 255, 255);
  tekenAchtergrond();
  tekenMonster();
  monsterTest();
  monsterUpdate();
  
}

void tekenAchtergrond(){
    while(y < stop){
   println("test");
   noStroke();
   fill(0,255);
   rect(0,y,500,10);
   y = y + spatie;}
   y=0;
}


void tekenMonster(){ 
  //legs
    if(test == true){
  fill(79, 216, 132);
  }
  else if(test == false){
  fill(189,229,206);
  }
  stroke(0);
  rect(monsterX-50, monsterY+35, 20, 50);

  stroke(0);
  rect(monsterX+25, monsterY+35, 20, 50);
  
  //body
  stroke(0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY, 180, 100);

  //head
  
  stroke(0);
  ellipseMode(CENTER);
  ellipse(monsterX-100, monsterY-40, 100, 100);

  stroke(0);
  ellipseMode(CENTER);
  ellipse(monsterX-100, monsterY-40, 90, 90);

  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(monsterX-125, monsterY-60, 20, 20);

  fill(0);
  ellipseMode(CENTER);
  ellipse(monsterX-127, monsterY-55, 9, 9);

  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(monsterX-127, monsterY-55, 10, 10);
}

void monsterTest(){
  
  if(monsterX > 500){
   richting = -richting;
   teller = teller +1;
   }
   
   if (monsterX < 0){
   richting = -richting;
   teller = teller +1;
   }
   
   if (teller == 10){
   teller = 0;
   test = !test;
   }
}

void monsterUpdate(){
  monsterX = monsterX + richting;

}
   



