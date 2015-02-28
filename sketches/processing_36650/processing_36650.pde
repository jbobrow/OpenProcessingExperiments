
PFont score;
PFont names;
int start=1;
int instruct=0;
int instructone=0;
int instructtwo=0;
int scoreone=0;
int scoretwo=0;
void setup(){
  size(542,400);
  background(255,128,0);
  score= loadFont("AgencyFB-Bold-72.vlw");
  rectMode(CENTER);
}
  
void draw(){
  //STARTING SCREEN
  if(start==1){
    if(((mouseX>=186)&&(mouseX<=356))&&((mouseY>=235)&&(mouseY<=285))){
      fill(150);
      rect(271,260,170,50);
      fill(255,0,64);
      textFont(score,62);
      text("Phalanges of Fury",20,80);
      fill(0);
      textFont(score,10);
      text("START",250,265);
      if(mousePressed){
        start=0;
        background(255,128,0);
      }
    }else{
      fill(255);
      rect(271,260,170,50);
      fill(255,0,64);
      textFont(score,62);
      text("Phalanges of Fury",20,80);
      fill(0);
      textFont(score,10);
      text("START",250,265);
    }
    //INSTRUCTIONS
  }else{
    if(instruct==0){
      background(255,128,0);
      text("Here are the instructions:",200,20);
      text("PLAYER 1: When you are ready, press S.",160,40);
      text("When you and player 2 have verified they are ready, tap the A key as fast as you can.",70,60);
      text("PLAYER 2: Press K to verify that you are ready.",140,90);
      text("When player 1 also verifies he/she is ready, press L as fast as you can.",90,110);
      text("First to 50 wins!!!",220,120);
      if(keyPressed){
        if((key=='k')||(key=='K')){
          instructtwo=1;
        }else{
          if((key=='s')||(key=='S')){
            instructone=1;
          }
        }
      }
      if((instructone==1)&&(instructtwo==1)){
        instruct=1;
        background(255,128,0);
      }
    }else{
      background(255,128,0);
      textFont(score,20);
      text("Player 1",20,120);
      text("Player 2",460,120);
      textFont(score,62);
      text(scoretwo,460,100);
      text(scoreone,20,100);
      line(271,0,271,400);
      if((scoreone>=50)&&(scoretwo<50)){
        fill(0,255,0);
        text("WINNER",10,200);
        noLoop();
      }else{
        if((scoretwo>=50)&&(scoreone<50)){
          fill(0,255,0);
          text("WINNER",280,200);
          noLoop();
        }
        if((scoreone>=50)&&(scoretwo>=50)){
          fill(128);
          text("TIE",230,200);
          noLoop();
        }
      }
    }
  }
}
  
void keyReleased(){
  if(instruct==1){
    if((key=='a')||(key=='A')){
      scoreone+=1;
    }
    if((key=='l')||(key=='L')){
      scoretwo+=1;
    }
  }
}

                
               
