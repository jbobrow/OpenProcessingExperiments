
int monsterX;
int monsterY;
int richting;
int teller;
 
boolean test;
 
void setup() {
  size(300, 300);
  monsterX=100;
  monsterY=100;
  richting=10;
  teller=1;
  test=true;
}
 
void draw() {
  //lijf
  background(255);
   
  if (test == true ){ fill(0, 255, 0);}
  if (test == false){ fill(250,100,150); }
 
  rect(monsterX-40,monsterY+65,30,25);
  rect(monsterX+10,monsterY+65,30,25);
   
  //gezicht
    if (test == true ){ fill(250,100,150);}
  if (test == false){ fill(0,0,255); }
  rect(monsterX-50,monsterY-35,100,100);
 
 
  //oog
  fill(255);
  ellipse(monsterX, monsterY-15,35,40);
   
   //pupil
  fill(0,255,0);
  ellipse(monsterX, monsterY-15,15,15);

   
  //iris
  fill(0);
  ellipse(monsterX, monsterY-15,5,5);
 
  //mond
  fill(255,0,0);
  ellipse(monsterX+5, monsterY+40,50,20);
   
  //tand
  fill(255);
  rect(monsterX, monsterY+30,10,10);
  
  //handen
  fill(0,255,0);
  rect(monsterX-70, monsterY+15,20,20);
  rect(monsterX+50, monsterY+15,20,20);
  
  //vingers
  fill(0,255,0);
  rect(monsterX-65, monsterY+5,10,10);
  rect(monsterX+55, monsterY+5,10,10);
  
  //antenne
  fill(0,255,0);
  rect(monsterX, monsterY-65,2,30);
  ellipse(monsterX, monsterY-70,15,15);
    
   monsterX = monsterX + richting;
    
   if (monsterX > 250 || monsterX < 50){
     richting = -richting;
     teller = teller +1;
   }
    
   if (teller == 10){
     teller = 0;
     test = !test;
   }
    
   println(test);
  }

