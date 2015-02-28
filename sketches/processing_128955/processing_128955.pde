
float stickx=400;
float sticky=450;
float horiza=200;
float horizb=200;
float movex=0;
float movey=0;
float fuel=2550;
float gameO=0;
float targetx=random(640);
float targety=random(380);

void setup(){
  size(800,500);

}

void draw(){
  background(0);
  strokeWeight(0);
  fill(0,20,255);
  rect(60,10,680,380);
  fill(250,100,50);
  stroke(250,100,50);
  horiza=200+(movey*5)-(movex*20);
  horizb=200+(movey*5)+(movex*20);
  
  
  quad(60,390,60,horiza,740,horizb,740,390);
  fill(0);
  strokeWeight(1);
  stroke(0);
  rect(0,0,800,10);
  rect(0,390,800,110);
  rect(0,0,60,400);
  rect(740,0,60,400);
  textSize(24);
  fill(255);
  text("Pilot Trainer 101",450,420);
  textSize(20);
  
  text("Use your mouse to move the stick",450,455);
  text("in order to line up the cross",450,475);
  text("target before the fuel runs out",450,495);
  
  
  if(gameO==0){
    fuel=fuel-1;
    strokeWeight(0);
    stroke(0);
    fill(100);
    rect(60,410,3,20);
    fill (255-(fuel/10),fuel/10,0);
    rect(60,410,fuel/10,20);
    fill(100);
    rect(350,400,100,100);
    fill(255,0,0);
    stroke(200);
    strokeWeight(10);
    line(stickx,sticky,400,450);
    strokeWeight(1);
    ellipse(stickx,sticky,20,20);
    stroke(255);
    strokeWeight(3);
    line(375,200,425,200);
    line(400,175,400,225);
    targetx=targetx+(movex/3);
    targety=targety+(movey/3);
    if(targetx<60){
      targetx=60;
    }
    if(targetx>740){
      targetx=740;
    }
    if(targety<10){
      targety=10;
    }
    if(targety>390){
      targety=390;
    }
    
    stroke(0,255,0);
    line(targetx-20,targety-20,targetx+20,targety+20);
    line(targetx+20,targety-20,targetx-20,targety+20);
    stroke(0);
    textSize(24);
    fill(255);
    text("FUEL LEVEL",60,460);
  }
  if(fuel<=0){
    gameO=1;
    textSize(64);
    fill(255,0,0);
    text("GAME OVER",220,190);
    fill(255);
    textSize(32);
    text("Click to restart",280,250);
    fuel=0;
 
  }
  if(targetx>398&&targetx<402&&targety<202&&targety>198){
    gameO=2;
    textSize(64);
    fill(255,0,0);
    text("YOU WON !!!",220,190);
    fill(255);
    textSize(32);
    text("Click to restart",280,250);
    
  }
}

void mouseDragged(){
    if((mouseX>360)&&(mouseX<440)&&(mouseY>410)&&(mouseY<490)&&(fuel>0)){
    stickx=mouseX;
    sticky=mouseY;
    movex=400-mouseX;
    movey=-(450-mouseY);
  }
}

void mouseClicked(){
  if(gameO>0){
    reset();
  }
}

void reset(){
  size(800,500);
  stickx=400;
  sticky=450;
  horiza=200;
  horizb=200;
  movex=0;
  movey=0;
  fuel=2550;
  gameO=0;
  targetx=random(640);
  targety=random(380);


}
