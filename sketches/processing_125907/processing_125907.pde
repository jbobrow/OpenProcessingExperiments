
int monsterX;
int monsterY;

int richting;
int teller;

boolean test;

void setup() {
  size(500, 500);
  monsterX=100;
  monsterY=100;
  richting=10;
  teller=1;
  test=true;
}

void draw() {
  //lichaam
  background(255);
  
  if (test == true ){ fill(22,84,186);}
  if (test == false){ fill(255,0,0); }

  ellipse(monsterX-25,monsterY+35,30,15);
  ellipse(monsterX+25,monsterY+35,30,15);
  
  //gezicht
    if (test == true ){ fill(22,84,186);}
  if (test == false){ fill(255,0,0); }
  ellipse(monsterX,monsterY,100,75);

  //ogen
  fill(255);
  ellipse(monsterX-25, monsterY-25,25,40);
  
  fill(255);
  ellipse(monsterX+25, monsterY-25,25,40);
  
   //binnenogen
  fill(0,255,0);
  ellipse(monsterX-25, monsterY-25,15,15);
  
  fill(0,255,0);
  ellipse(monsterX+25, monsterY-25,15,15);
  
  //pupillenogen
  fill(0);
  ellipse(monsterX-25, monsterY-25,5,5);
  
  fill(0);
  ellipse(monsterX+25, monsterY-25,5,5);

  //mond
  fill(255);
  rect(monsterX-25, monsterY+15,50,1);
  
  //tand
  fill(255);
  triangle(monsterX+5, monsterY+15, monsterX+15, monsterY+15, monsterX+10, monsterY+25);
  
  fill(255);
  triangle(monsterX-15,monsterY+15,monsterX-5,monsterY+15,monsterX-10,monsterY+25);
   
   monsterX = monsterX + richting;
   
   if (monsterX > 450 || monsterX < 50){
     richting = -richting;
     teller = teller +1;
   }
   
   if (teller == 10){
     teller = 0;
     test = !test;
   }
   
   println(test);
  }
  
