
int monsterY;
int monsterX;
boolean kleurtje;

int richting;
int teller;

int x;
int y;
int spatie;
int stop;
 


void setup() {
  size(500, 500);
  monsterX = 250;
  monsterY = 100;
  richting = -5;
  kleurtje = false;
  teller = 0;
  y = 0;
  x = 0;
  spatie = 200;
  stop = 500;
  
}

 
void draw() {
  background(255); 
  
  monsterY = monsterY + richting;
  if (monsterY == -200 || monsterY == 700) {
  richting = -richting;
 teller = teller+1;
  }
  if (teller==10){
    kleurtje= !kleurtje;
    teller = 0;
  }
  
  println(teller);
  println(kleurtje);
  
  fill(26);
  text(teller, 15, 35);
  textSize(30);

  
 //*TERUGKERENDE VIS*//

while ( x < stop ) {
fill(229,247,248);
    triangle(x,340,-43,1096,1347,-1854);   
  x = x + spatie;
}
x=0;
while ( x < stop ) {
fill(149,204,246);
  triangle(x,327,587,170,-24,-85); 
  x = x + spatie;
}
x=0;
while ( x < stop ) {
fill(232,242,252);
    triangle(x,166,747,49,460,-688);   
  x = x + spatie;
}
x=0;

while ( x < stop ) {
fill(193,222,254);
    triangle(x,590,800,-941,460,-386);   
  x = x + spatie;
}
x=0;


   


  
   
 
  //head
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY, 200, 160);
   
   
  //eye
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(monsterX-50, monsterY-30, 40, 40);
   
  //eye
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(monsterX+50, monsterY-30, 40, 40);
   
  //pupil
  stroke(0);
  fill(0);
  strokeWeight(0);
  ellipse(monsterX-50,monsterY-30,20,20);
   
  //pupil
  stroke(0);
  fill(0);
  strokeWeight(0);
  ellipse(monsterX+50, monsterY-30, 20, 20);
  
  
   //mouth
  stroke(0);
  strokeWeight(0);
  fill(190,42,56);
  ellipse(monsterX, monsterY+20, 100, 60);
 
   
  //body
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipse(monsterX, monsterY+200, 250, 300);
   
   
  //bodyyellow
stroke(0);
strokeWeight(0);
 if (kleurtje == false){fill(255, 252 ,0);}
  if (kleurtje == true){fill(26, 211, 187);}

ellipse(monsterX, monsterY+220, 200, 220);
   
   //body
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(monsterX, monsterY+240, 195, 220);
   
    //foot
  stroke(0);
  strokeWeight(0);
  fill(234, 126, 27);
  ellipse(monsterX+70, monsterY+355, 130, 30);
   
   //foot
  stroke(0);
  strokeWeight(0);
  fill(234,126,27);
  ellipse(monsterX-70, monsterY+355, 130, 30);
   
 //arm
stroke(0);
strokeWeight(30);
fill(0);
line(monsterX-195, monsterY+250, monsterX-75, monsterY+100);
 
//arm
stroke(0);
strokeWeight(30);
fill(0);
line(monsterX+205, monsterY+250, monsterX+75, monsterY+100);

  
 strokeWeight(0);
   
 
}
