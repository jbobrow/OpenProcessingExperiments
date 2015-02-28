

int iskenMove = 0;
int iskenY = 0;
int iskenBall = 80;
boolean iskenDis = true;

int iskiMove = 20;
int iskiY=0;
int iskiBall= 60;
boolean iskiDis = true;

PImage bg;
PFont helvet;
PFont frudiger;

void setup(){
  size(600, 400);
  helvet = createFont("HelveticaCY copy.dfont",80);
  bg  = loadImage("01.jpg");
  background(bg);
  
}


void draw(){
  
  textFont(helvet);
  text("helloooo",50,70);
  image(bg, 0, 0);
  noStroke();
  smooth();
//color
  fill(iskenMove, iskenY/60, iskenMove+100);
//ellipse(X, Y, weight, height);
  ellipse(iskenMove, iskenY+iskenBall/2, iskenBall, iskenBall);

  
  
  fill(iskenMove, iskenY+90, iskenMove+0);
  ellipse(iskenMove+100, iskenY+iskenBall-80, iskenBall/2, iskenBall/2);
  
  fill(iskenMove, iskenY+90, iskenMove+200);
  rect(iskenMove+100, iskenY+iskenBall-20, iskenBall/2, iskenBall/2);
  
  noFill();
  stroke(70);
  strokeWeight(6);
  ellipse(iskenMove, iskenY+iskenBall/2, iskenBall+10, iskenBall+10); 
  noFill();
  stroke(100);
  strokeWeight(3);
  ellipse(iskenMove, iskenY+iskenBall/2, iskenBall+20, iskenBall+20);
  noFill();
  stroke(130);
  strokeWeight(1);
  ellipse(iskenMove, iskenY+iskenBall/2, iskenBall+30, iskenBall+30);
  
  noFill();
  stroke(100);
  strokeWeight(1);
  ellipse(iskenMove+100, iskenY+iskenBall-80, iskenBall/4, iskenBall/4);
  
  
//if ball is going over flame, it will go back to the top 
  if(iskenY > height - iskenBall){
  iskenY = 0;

}

//if ball is over width, it will chage direction
if(iskenMove > width){
iskenDis = false;
iskenY += iskenBall;
}
if(iskenMove < 0){
iskenDis = true;
iskenY += iskenBall;
}
if(iskiMove > width){
iskiDis = false;
iskiY += iskiBall;
}

//設定球跑的方向，數字越大跑越快，加號往右，減號往左
if(iskenDis == true){
iskenMove += 15;
}
if(iskenDis == false){
iskenMove -= 5;
}


}


