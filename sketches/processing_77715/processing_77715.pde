
//Victoria H, TR0N:PvP, CP1 mods 16/17

int xOne=50;
int yOne=250;
int xTwo=450;
int yTwo=250;
int dOne=RIGHT;
int dTwo=LEFT;
boolean gameOver=false;

void setup(){
  println("P1 controls: Left=a; Right=d; Up=w; Down=s");
  print("P2 controls: Left=4; Right=6; Up=8; Down=5");
  size(500,500);
  background(0);
  stroke(255);
  strokeWeight(50);
  noFill();
  rect(0,0,500,500);
  textAlign(CENTER);
  text("P1",55,250);
  text("P2",440,250);
}
void draw(){
  if(gameOver==true && mousePressed==true){
    background(0);
    stroke(255);
    strokeWeight(50);
    noFill();
    rect(0,0,500,500);
    textAlign(CENTER);
    textSize(12);
    fill(255);
    text("P1",55,250);
    text("P2",440,250);
    gameOver=false;
    xOne=50;
    yOne=250;
    xTwo=450;
    yTwo=250;
    dOne=RIGHT;
    dTwo=LEFT;
  }
  playerOne();
  playerTwo();
}
void playerOne(){
  if(get(xOne,yOne) !=color(0)){
    fill(250,0,0);
    textSize(70);
    textAlign(CENTER);
    text("GAME OVER",250,200);
    text("Player1 Loses",250,280);
    gameOver=true;
  }
  if(gameOver==false){
    stroke(0,255,0);
    strokeWeight(1);
    point(xOne,yOne);
    if(dOne==RIGHT){
      xOne++;
    }
    else if(dOne==LEFT){
      xOne--;
    }
    else if(dOne==UP){
      yOne--;
    }
    else if(dOne==DOWN){
      yOne++;
    }
  }
}
void playerTwo(){
  if(get(xTwo,yTwo) !=color(0)){
    fill(250,0,0);
    textSize(70);
    textAlign(CENTER);
    text("GAME OVER",250,200);
    text("Player2 Loses",250,280);
    gameOver=true;
  } 
  if(gameOver==false){
    stroke(0,0,255);
    strokeWeight(1);
    point(xTwo,yTwo);
    if(dTwo==RIGHT){
      xTwo++;
    }
    else if(dTwo==LEFT){
      xTwo--;
    }
    else if(dTwo==UP){
      yTwo--;
    }
    else if(dTwo==DOWN){
      yTwo++;
    }
  }
}
void keyPressed(){
  if(key=='a'){
    dOne=LEFT;
  }
  else if(key=='d'){
    dOne=RIGHT;
  }
  else if(key=='w'){
    dOne=UP;
  }
  else if(key=='s'){
    dOne=DOWN;
  }
  if(key=='4'){
    dTwo=LEFT;
  }
  else if(key=='6'){
    dTwo=RIGHT;
  }
  else if(key=='8'){
    dTwo=UP;
  }
  else if(key=='5'){
    dTwo=DOWN;
  }
}
