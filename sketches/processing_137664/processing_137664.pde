
// Samantha Chiu copyrigth 2014
// Homework 7 
//use mouse to avoid the vegetables and touch the pizza 
//before time runs out
PImage banana, bear, bro, tomato;
int phase;
float cmin, csec;
int mouseX = 0, mouseY = 0;
int count;


void setup(){
  size (700,700);
  background (191,240,255);
  textSize (13);
  banana = loadImage("banana.png");
  bear = loadImage("bear.png");
  bro = loadImage("bro.png");
  tomato = loadImage("tomato.png");
  phase = 0;
  count = 0;
  
}

void draw(){
 if (phase == 0){
   instructions();
 }
 else if (phase ==1){
   play();
 }
 else if (phase ==2){
   score();
 }
}

void play(){
    banana();
    bear();
    tomato();
    bro();
  }


void keyPressed(){
  if (phase == 0){
    phase = 1;
    time();
  }
}

void checkhit(){
 // float d = dist(x,y,mouseX,mouseY);
}
void instructions(){
  
  background (191,240,255);
  fill (0);
  String s = "You're a cute bear who wants to avoid all the healthy foods and get to the pizza before time runs out.";
  text (s, 20,30,width-20, height);
  String s2 = "If you eat 5 healthy foods, you die of sadness. Press SPACEBAR to start the game!";
  text (s2,20,60, width-20, height);
}



void time (){
  background(191,240,255);
  int c; //time
  int cmin;
  int csec;
  int climit = 5; //5 min countdown
  c = climit*60*1000 - millis();
  cmin = (c/(60*1000))%60;
  csec = (c/1000)%60;
  String timer =("MIN: "+cmin+" SEC: "+csec);
  text (timer,10,.9*height);
}

void checktime(){
  if (cmin == 0 && csec == 0){
    background(191,240,255);
    String gameover= ("GAME OVER");
    text(gameover,10,.9*height);

}
}

void score (){
  text ("GAME OVER", width/2, 50);
  if (mouseX == 0 && mouseY == 0 && cmin>= 0 && csec >0){
    text ("You finished in MIN: "+cmin+" SEC: "+csec, width/2, 100);
    if (cmin>4){
      text ("WOW", width/2, 150);
    }
    else if (cmin>3){
      text ("Not bad", width/2,150);
    }
     else if (cmin>2){
       text ("OK", width/2, 150);
     }
      else if (cmin>0){
        text ("Barely made it", width/2,150);
      }
  }
  else if (mouseX > 0 || mouseY > 0){
    text( "You are a l0s3r", width/2, 100);
  }
}
    
    
    
    

void bear(){ // you
  image (bear, mouseX, mouseY,bear.width*.1,bear.height*.1);
}
void banana(){ // bounce
  int bspeedX = 3;
  int bspeedY = 1;
  int bX = 50;
  int bY = 10;
  bX+=bspeedX;
  bY+=bspeedY;
  bspeedX = constrain (bspeedX, 1,7);
  if ((bX<=0)||(bX>=width)||(bY<=0)||(bY>=height))
    bspeedX +=1;
  if ((bX<0)||(bX>width)){
    bspeedX=-bspeedX;
  }
  image(banana,bX,bY, banana.width *.2, banana.height*.2);
}

void tomato(){ // wrap
  float tX = 5, tY =0;
  tX+=1;
  tY = tY + random(1, 50);
  if (tX>width+20)
  {
    tX=-20;
  }
  image (tomato,tX,tY,tomato.width*.05, tomato.height*.05);
}

void bro(){ //random 
  float brX,brY;
  brX = random (20,width -50);
  brY = random (20,height -80);
  image (bro,brX,brY,bro.width*.05,bro.height*.05);
}
  




