
int diceSize = 200;

/* Weclcome to my Somewhat functioning Casino game.
  To begin, Left-Click Anywhere on the screen.
      When you want to stop rolling, Right-Click anywhere.*/


//LEFT DICE DOT SPECS
float dotTLx = 210;
float dotTLy = 250;
float dotTRx = 315;
float dotTRy = 250;
float dotMx = 260;
float dotMy = 300;
float dotBLx = 210;
float dotBLy = 350;
float dotBRx = 315;
float dotBRy = 350;
float dotTMx = 265;
float dotTMy = 250;
float dotBMx = 265;
float dotBMy = 350;

//RIGHT DICE DOT SPECS
float zotTLx = 550;
float zotTLy = 250;
float zotTRx = 650;
float zotTRy = 250;
float zotMx = 600;
float zotMy = 300;
float zotBLx = 550;
float zotBLy = 350;
float zotBRx = 650;
float zotBRy = 350;
float zotTMx = 600;
float zotTMy = 250;
float zotBMx = 600;
float zotBMy = 350;
int roll1;
int roll2;
int dollars;

boolean winner = false;


void setup() {
  frameRate(10);
  size(800,600);
  dollars = 5;
  smooth();
  println("You have $" +dollars);
  noLoop();
}


void draw(){

background(#43936B);
roll1 = int(random(1, 7));
roll2 = int(random(1, 7));



//Dice
noStroke();
fill(255);
rectMode(CENTER);
rect(width/3,height/2,diceSize,diceSize,diceSize/5,diceSize/5);
rect(width - 200,height/2,diceSize,diceSize,diceSize/5,diceSize/5);

//Dots
fill(0);
if (roll1 == 1) {
  ellipse(dotMx,dotMy,40,40);
}

else if(roll1 == 2){
  ellipse(dotBRx,dotBRy,40,40);
  ellipse(dotTLx,dotTLy,40,40);
}



 else if(roll1 == 3) {
  fill(0);
  ellipse(dotTLx,dotTLy,40,40);
  ellipse(dotMx,dotMy,40,40);
  ellipse(dotBRx,dotBRy,40,40);
}


else if(roll1 == 4){
  ellipse(dotTRx,dotTRy,40,40);
  ellipse(dotBLx,dotBLy,40,40);
  ellipse(dotBRx,dotBRy,40,40);
  ellipse(dotTLx,dotTLy,40,40);
}

else if(roll1 == 5){
  ellipse(dotTRx,dotTRy,40,40);
  ellipse(dotBLx,dotBLy,40,40);
  ellipse(dotBRx,dotBRy,40,40);
  ellipse(dotTLx,dotTLy,40,40);
  ellipse(dotMx,dotMy,40,40);
}

else if(roll1 == 6){
  ellipse(dotTRx,dotTRy,40,40);
  ellipse(dotBLx,dotBLy,40,40);
  ellipse(dotBRx,dotBRy,40,40);
  ellipse(dotTLx,dotTLy,40,40);
  ellipse(dotTMx,dotTMy,40,40);
  ellipse(dotBMx,dotBMy,40,40);

}
 fill(0);
if (roll2 == 1) {
  ellipse(zotMx,zotMy,40,40);
}

if(roll2 == 2){
  ellipse(zotBRx,zotBRy,40,40);
  ellipse(zotTLx,zotTLy,40,40);
}



if(roll2 == 3) {
  fill(0);
  ellipse(zotTLx,zotTLy,40,40);
  ellipse(zotMx,zotMy,40,40);
  ellipse(zotBRx,zotBRy,40,40);
}


if(roll2 == 4){
  ellipse(zotTRx,zotTRy,40,40);
  ellipse(zotBLx,zotBLy,40,40);
  ellipse(zotBRx,zotBRy,40,40);
  ellipse(zotTLx,zotTLy,40,40);
}

if(roll2 == 5){
  ellipse(zotTRx,zotTRy,40,40);
  ellipse(zotBLx,zotBLy,40,40);
  ellipse(zotBRx,zotBRy,40,40);
  ellipse(zotTLx,zotTLy,40,40);
  ellipse(zotMx,zotMy,40,40);
}

if(roll2 == 6){
  ellipse(zotTRx,zotTRy,40,40);
  ellipse(zotBLx,zotBLy,40,40);
  ellipse(zotBRx,zotBRy,40,40);
  ellipse(zotTLx,zotTLy,40,40);
  ellipse(zotTMx,zotTMy,40,40);
  ellipse(zotBMx,zotBMy,40,40);

}







}
void mousePressed(){
loop();
  if(mouseButton == RIGHT){
    println("roll1 :" + roll1);
    println("roll2: " + roll2);
    
    if((roll1 + roll2 == 7 )||( roll1 + roll2 == 11)){
  println("You win!");
  dollars = dollars + 1;
  println("You now have $" +dollars);
     }
  else
  {
  println("You lose!");
  dollars = dollars - 1;
  println("You now have $" +dollars);
  }
    noLoop();

  }

//if(winner == true){
 
  

}
  
  




