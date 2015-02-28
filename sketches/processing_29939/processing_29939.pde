
float a1 =height-10;
float a2=height-10;
float x1=0;
float x2=90;
float y1=0;
float speed= random(1,10);
float y2=0;
float speed2 = random(1,2);
float y3=0;
float speed3 =random(1,2);
float y4=0;
float speed4=random(1,2);
float y5=0;
float speed5=random(1,2);
float y6=0;
float speed6=random(1,2);
float y7=0;
float speed7=random(1,2);
float y8=0;
float speed8=random(1,2);
float y9=0;
float speed9=random(1,2);
int score = 300;
int mode = 0;

void setup(){ 
  size (800,480);
  smooth();
  noCursor();
 
}

void reset(){
  score=300;
 a1 =height-10;
a2=height-10;
 x1=0;
 x2=90;
 y1=0;
 speed= random(1,10);
y2=0;
 speed2 = random(1,2);
 y3=0;
 speed3 =random(1,2);
 y4=0;
 speed4=random(1,2);
 y5=0;
 speed5=random(1,2);
 y6=0;
 speed6=random(1,2);
 y7=0;
 speed7=random(1,2);
 y8=0;
 speed8=random(1,2);
 y9=0;
 speed9=random(1,2);

}
  
 
  void draw(){
     noStroke();
  background (0);
 
  if (mode == 0){startScreen();} else if (mode==1){playGame();}
  else if (mode ==2){gameOver();}
  
  }
  void mousePressed() {
  if (mode == 0){reset();mode =1;}
  if (mode == 2){mode =0;}
 }
 void startScreen() {
   text("CATCH the BAR",350,150);
   text("Try to catch the falling bars as many as you can",250,230);
   text("Do not try too hard to catch all of them!",280,250);
   text("You lose 10 scores for missing a bar but you gain 30 scores for catching one",200,270);
   text("CLICK TO START",350,400);}  


 void gameOver(){
   background(0);
  text("GAME OVER",380,230);
  text("CLICK TO GO BACK",360,300);}
  
  void playGame() {
    
 if(score <0){mode=2;}
 // line(mouseX,470,mouseX+90,470); 
//  if(mouseX<101 && mouseX>0){mouseX=0;}
//if(mouseX<200 && mouseX>100){mouseX=200;}    
if (circleLineIntersect(x1,y1,x2,y1,mouseX+90, 470, 2) == true) {score=score+50; y1=0;speed = random(0.2,5);}

if (circleLineIntersect(100,y2,190,y2,mouseX, 470, 1) == true) {score=score+50;}
if (circleLineIntersect(200,y3,290,y3,mouseX, 470, 1) == true) {score=score+50;}
if (circleLineIntersect(300,y4,390,y4,mouseX, 470, 1) == true) {score=score+50;}
if (circleLineIntersect(400,y5,490,y5,mouseX, 470, 1) == true) {score=score+50;}
if (circleLineIntersect(500,y8,590,y8,mouseX, 470, 1) == true) {score=score+50;}
if (circleLineIntersect(600,y9,690,y9,mouseX, 470, 1) == true) {score=score+50;}



text(score,720,60);

  stroke(170);
  strokeWeight(10);
  line(x1,y1,x2,y1);
  y1 = y1+speed;
  if(y1>480){score=score-10 ; y1=0; speed = random(0.2,5);}
  

  stroke(170);
  line(100,y2,190,y2);
  y2 = y2+speed2;
  if(y2>480){score=score-10 ; y2=0; speed2 = random(0.2,5);}
  speed2 = random(0.8,3); 
  
  stroke(170);
  strokeWeight(10);
  line(200,y3,290,y3);
  y3 = y3+speed3;
  if(y3>480){score=score-10 ;y3 = 0;
  speed3 = random(0.6,3.5); } 

  stroke(170);
  strokeWeight(10);
  line(300,y4,390,y4);
  y4 = y4+speed4;
  if(y4>480){score=score-20 ;y4 = 0;  speed4 = random(1,5); }

  stroke(170);
  strokeWeight(10);
  line(400,y5,490,y5);
  y5 = y5+speed5;
  if(y5>480){score=score-20 ;y5 = 0;  speed5 = random(0.2,5); }


  stroke(170);
  strokeWeight(10);
  line(500,y8,590,y8);
  y8 = y8+speed8;
  if(y8>480){score=score-20 ;y8 = 0;  speed8 = random(0.5,3); }

  stroke(170);
  strokeWeight(10);
  line(600,y9,690,y9);
  y9 = y9+speed9;
  if(y9>480){score=score-20 ;y9 = 0;  speed9 = random(1,2); }

  stroke(200,230,250);
  strokeWeight(20);
  
  //if(mouseX>0 && mouseX<100){
    ellipse(mouseX, 470, 90, 5);
  }


