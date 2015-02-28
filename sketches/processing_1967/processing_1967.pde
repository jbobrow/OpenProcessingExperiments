
Timer timer1;
Fly[] flies=new Fly[15];
FlySwatter swat1;
boolean death;
boolean swat;
boolean danger;
boolean gameOver;
int score=0;
PFont loserDisplay;
PFont spaceBar;
PImage title;
void setup(){
  size(600,600);
  for (int i=0; i<flies.length;i++){
    flies[i]=new Fly();
  }
  swat1=new FlySwatter();
  timer1=new Timer();
  death=false;
  swat=false;
  gameOver=false;
  title=loadImage("byeFly.png");

}

void draw(){
  background(255);
    timer1.drawTimer();
  if(gameOver==true){
    lose();
  }
  else{
    runGame();
  }

}
void mousePressed(){
  swat=true;
}
void mouseReleased(){
  swat=false;
}


void runGame(){
  image(title,0,550);
  for(int i=0;i<flies.length;i++){
    flies[i].annoy();
  }
  if (swat==true){
    swat1.swat();
  }
  else{
    swat1.norml();
  }

}

void lose(){
  background(0);
  loserDisplay=createFont("HelveticaNeue",48,true);
  fill(255);
  textAlign(CENTER);
  text("Game Over", width/2,height/8);
  text("Score "+score, width/2,height/2);
  spaceBar=createFont("HelveticaNeue",30,true);
  textFont(spaceBar);
  text("Hold R to restart", width/2,height*.8);
  if((keyPressed==true)&&(key=='r')||(keyPressed==true)&&(key=='R')){
    gameOver=false;
    score=0;
  }

}
















