
int monsterY = 100;
int cirkelX;
int richting;
int score;
boolean test;

void setup() {
 size(400,400);
 cirkelX=200;
 richting =3;
 score =0;
 test = false;
 }
 
 void draw() {
 background(255);
 noStroke(); 
 
 //OREN
 if (test ==true){
    fill(3,117,164);}
 if (test ==false){
    fill(3,164,45);}
 ellipseMode(CENTER);
 ellipse(cirkelX-30,monsterY-26,25,25);
 ellipseMode(CENTER);
 ellipse(cirkelX+30,monsterY-26,25,25);
 if (test ==true){
 fill(1,64,130);}
  if (test ==false){
 fill(52,105,33);}
 ellipseMode(CENTER);
 ellipse(cirkelX-30,monsterY-26,20,20);
 ellipseMode(CENTER);
 ellipse(cirkelX+30,monsterY-26,20,20);
 
 //POTEN
 if (test ==true){
 fill(3,117,164);}
 if (test ==false){
 fill(3,164,45);}
 rectMode(CENTER);
 rect(cirkelX+9,monsterY+35,15,25);
 rect(cirkelX-9,monsterY+35,15,25);
 
 //HOOFD
 if (test ==true){
 fill(3,117,164);}
 if (test ==false){
 fill(3,164,45);}
 ellipseMode(CENTER);
 ellipse(cirkelX,monsterY,100,75);
 
  //OGEN
 fill(255);
  ellipse(cirkelX +14,monsterY+-13,17,15);
 ellipse(cirkelX -14,monsterY+-13,17,15);
  fill(0);
 ellipse(cirkelX +14,monsterY+-13,10,10);
 ellipse(cirkelX -14,monsterY+-13,10,10);
 
 //NEUS
 if (test ==true){
 fill(59,81,176);}
 if (test ==false){
 fill(10,146,45);}
 ellipseMode(CENTER);
 ellipse(cirkelX,monsterY,30,15);
 fill(34,34,34);
 ellipse(cirkelX-5,monsterY+0,5,5);
 ellipse(cirkelX+5,monsterY-0,5,5);
 
 //MOND
 fill(0);
 ellipse(cirkelX,monsterY +20,20,15);
 fill(249,0,41);
 ellipse(cirkelX,monsterY +25,15,5);
 
  //HOED
 fill(0);
 rect(cirkelX, monsterY+-34, 50, 8);
 fill(0);
 arc(cirkelX, monsterY+-33,40,40,-PI, 0);
 
 cirkelX = cirkelX +richting;
 
 if(cirkelX > 400 || cirkelX <0){
   richting= -richting;
   score = score+1;
   println(score);
 }
   
   if(score ==10){
     score =0;
     test = true;
   }
   
   println(test);
}
