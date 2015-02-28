
int monsterX;
int monsterY;

int richting;
int teller;

boolean test;

void setup() {

  size(500, 500);
  monsterX = 300;
  monsterY = 190;
  richting = 5;
  teller = 0;
  test = true;
}

void draw() {
  background(255, 255, 255);
    
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

  monsterX = monsterX + richting;

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
   
   println(test);
   
}  


