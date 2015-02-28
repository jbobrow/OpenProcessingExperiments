
/* 
Module opgave 3

- Ik heb na het maken van de opgave nog eraan verder gewerkt,
  Het is niet de origineele opdracht, maar de basis is hetzelfde.

Scripted by: Paul Verhoeven
*/

//Declaring Global Variables
int windowBreedte = 500, windowLengte = 500;
int robotX = 50, robotY = 50;
int vrachtX = 300, vrachtY = 50;
int basketX = 447, basketY = 447;
int attached = 0;
int rondeTick = 0;
int rondeTijd = 60;
int score = 0;
int maxscore = 100;
int scorePositieX = 5, scorePositieY = 20;


//Setting up window.
void setup(){
 size(500,500);
 smooth();
}

void draw(){
  background(#000000);
   
  //Basket draw
  ellipseMode(CORNER);
  fill(#043D5A);
  triangle(430,500,500,430,500,500);
  ellipse(basketX,basketY,57,57);
  noStroke();
  ellipseMode(CENTER);
  for(int basketColor = 0; basketColor <= 50; basketColor = basketColor +5){
  fill(20,100-basketColor*2,100-basketColor*2);
  ellipse(basketX+28,basketY+28,57-basketColor,57-basketColor);
  }
  
  //robot sprite
  stroke(#000000);
  fill(#FFC400);
  rect(robotX,robotY,50,50);
  fill(#84890B);
  rect(robotX+5,robotY+5,40,40);
  line(robotX,robotY,robotX+5,robotY+5);
  line(robotX+50,robotY+50,robotX+45,robotY+45);
  line(robotX+50,robotY,robotX+45,robotY+5);
  line(robotX+5,robotY+45,robotX,robotY+50);
  
  //Vracht draw
  ellipseMode(CORNER);
  stroke(#000000);
  fill(255,50,50);
  ellipse(vrachtX,vrachtY,50,50);
  noStroke();
  ellipseMode(CENTER);
  for(int vrachtColor = 0; vrachtColor <= 50; vrachtColor = vrachtColor +5){
  fill(255,vrachtColor*2,vrachtColor*2);
  ellipse(vrachtX+25,vrachtY+25,50-vrachtColor,50-vrachtColor);
  }
  fill(#FFFFFF);
  
  //timer en timeline
  rondeTick++;
  if (rondeTick >= 60) {
  rondeTijd--;
  rondeTick = 0;
  }
  textSize(20);
  
  // Dit gedeelte zorgt ervoor dat de tekst uitwijkt voor de bal/robot. Misschien een beetje omslachtig, maar het werkt redelijk.
  if(  (robotX < 100 && robotY < 50) && !(vrachtX > 350 && vrachtY < 50)  ){scorePositieX = 405;}
  else if( (robotX < 100 && robotY < 50) && (vrachtX > 350 && vrachtY < 50) ){scorePositieX = 205;}
  if(  (robotX > 350 && robotY < 50) && !(vrachtX < 100 && vrachtY < 50)  ){scorePositieX = 5;}
  else if(  (robotX > 350 && robotY < 50) && (vrachtX < 100 && vrachtY < 50)  ){scorePositieX = 200;} 
  if(  (robotX < 300 && robotX > 150 && robotY < 50) && !(vrachtX > 350 && vrachtY < 50)  ){scorePositieX = 405;}
  else if(  (robotX < 300 && robotX > 150 && robotY < 50) && (vrachtX > 350 && vrachtY < 50)  ){scorePositieX = 5;}
  if(  (robotX < 300 && robotX > 150 && robotY < 50) && !(vrachtX < 100 && vrachtY < 50)  ){scorePositieX = 5;}
  else if(  (robotX < 300 && robotX > 150 && robotY < 50) && (vrachtX < 100 && vrachtY < 50)  ){scorePositieX = 405;}
  
  //afdrukken van tijd en score op het beeld.
  text("Tijd: " + rondeTijd, scorePositieX, scorePositieY);
  text("Score: " + score, scorePositieX, scorePositieY +25);
  
  //als de tijd voorbij is het spel eindigen
  if (rondeTijd == 0){
  background(0);
  textSize(64);
  fill(255,0,0);
  text("Game over", 30, 250);
  textSize(32);
  text("Ran out of time", 40, 300);
  }
  if (rondeTijd == -1){
  delay(1500);
  exit();  
  }  //end of timer
  
  
  //als het spel gewonnen is eindigen.
  if (score >= maxscore){
  background(0);
  textSize(64);
  fill(0,255,0);
  text("You won!", 30, 250);
  textSize(32);
  text("Collected them all!", 40, 300);
  }
  
  //collisions  
  if((score < 100) && rondeTijd > 0){
  if((robotX == vrachtX) && (robotY == vrachtY) && (attached == 0)){
  text("Space to pick up",robotX-10,robotY-5);
  }
  if((vrachtX == basketX+3) && (vrachtY == basketY+3) && (attached == 1)){
  text("Space to drop",robotX-90,robotY-7);    
  }
  if((basketX+3==vrachtX && basketY+3==vrachtY) && (attached == 0)){
  score = score + 10;
  vrachtX = (floor((random(0,5)))*50 );
  vrachtY = (floor((random(0,5)))*50 );
  }
  }
}
 // key actions
 void keyPressed() { 
   
     if ( (keyCode == UP) && robotY >= 50) {
      robotY = robotY - 50;
      }
      if ( (keyCode == DOWN) && robotY <= 400) {
      robotY = robotY + 50;
      }
      if ( (keyCode == LEFT) && robotX >= 50) {
      robotX = robotX - 50;
      }
      if ( (keyCode == RIGHT) && robotX <= 400) {
      robotX = robotX + 50;
      }
      if (keyCode == 32){
        if( (attached == 0) && (robotX == vrachtX) && (robotY == vrachtY) ){
        attached = 1;
        }else if (attached == 1){
        attached = 0;
        }
      }
      if (attached == 1){
      vrachtX = robotX;
      vrachtY = robotY;
      }
      
}

