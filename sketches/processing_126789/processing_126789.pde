
int monsterY;
int monsterX;

int richting;
int teller = 0;

boolean test = true;

void setup() {
  
  size(500, 500);
  
  monsterX = 250;
  monsterY = 250;
  richting = 10;
}

void draw() {
   monsterY--;
   background(255,255,255);
   
   if(test == true){
    background(255,255,255);
  } 
 
   if (test == false){
    background(0,0,0);
  }
  
  //Het hoofd
  noStroke();
  fill(255, 218, 0);
  ellipseMode(CENTER);
  ellipse(monsterX-0, monsterY, 200, 200);
  
  if(test == true){
    fill(0,255,0);
  } 
 
   if (test == false){
    fill(0,255,0);
  }

  //mond
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(monsterX-0, monsterY+25, 140, 90);
  
  //monde
  fill(255, 218, 0);
  ellipseMode(CENTER);
  ellipse(monsterX-0, monsterY+5, 150, 55);

  //rechter oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(monsterX+30, monsterY-20, 40, 60);

  fill(255, 218, 0);
  noStroke();
  //                1ste punt           2e punt            3e punt
  triangle(monsterX+25,monsterY-10, monsterX+55,monsterY-5, monsterX+55,monsterY-20);
    

  //linker oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(monsterX-30, monsterY-20, 40, 60);
  
  fill(255, 218, 0);
  noStroke();
  //                1ste punt           2e punt            3e punt
  triangle(monsterX-25,monsterY-10, monsterX-50,monsterY-5, monsterX-50,monsterY-20);
  
  monsterY = monsterY + richting;
  
  if(monsterY > 500 || monsterY < 0) {
    richting = -richting;
    teller = teller + 1;
  }

  if(monsterY == -30) {
    monsterY=530;
  }
  
  if(teller == 10) {
    teller = 0;
    test = !test;
  }

  println("Dit is mijn poppetje");
}

