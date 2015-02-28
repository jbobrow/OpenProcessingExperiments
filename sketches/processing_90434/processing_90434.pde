
float timer=0;
int start=0;
PImage begin;
PImage winner;
PImage loser;
PImage instructions;

PImage floor;
int x=57;
int y=70;
int win=0;
int menue=0;

void setup(){
  size(450,600);
  background(0);
  textSize(34);
  
  begin=loadImage("Start.jpg");
  floor=loadImage("Rock_Floor.jpg");
  winner=loadImage("winner-win.jpg");
  loser=loadImage("your-a-loser.jpg");
  instructions=loadImage("instructions.jpg");
}

void draw(){
 background(0);
    
 if(key==ENTER){
   start=1;
  }
 openScreen();
 if(menue==1){
   maze();
 player();
 hud();
 collison();
 }
 if(menue==2){ //instructions page
   image(instructions,0,0);
   fill(255);
  textSize(36);
  text("[Back]",175,525);
  if(mousePressed==true && (mouseX>175 && mouseX<265) && (mouseY>490 && mouseY<540))
  {
    menue=0;
  }
    if((mouseX>175 && mouseX<265) && (mouseY>490 && mouseY<540)){
    cursor(HAND);
    }
   else
   cursor(ARROW);
 }
if(win==2){ //lose screen
image(loser,0,0);
fill(0);
textSize(34);
text("[Restart]",0,575);
  if(mousePressed==true && (mouseX>3 && mouseX<135) && (mouseY>546 && mouseY<577))
  {
  menue=0;
  win=0;
  x=57;
  y=70;
  start=0;
  }
  if((mouseX>3 && mouseX<135) && (mouseY>546 && mouseY<577)){
    cursor(HAND);
  }
  else
  cursor(ARROW);
}

if(win==1){ //win screen
  timer=-500;
image(winner,0,0);
fill(0);
textSize(34);
text("[Restart]",0,575);
  if(mousePressed==true && (mouseX>3 && mouseX<135) && (mouseY>546 && mouseY<577))
  {
  menue=0;
  win=0;
  x=57;
  y=70;
  start=0;
  }
  if((mouseX>3 && mouseX<135) && (mouseY>546 && mouseY<577)){
    cursor(HAND);
  }
  else
  cursor(ARROW);
}
}

void hud(){ 
if (start==1){  
  if(timer<10){
  timer+=.013;
  }
}
  textSize(25);
  fill(255);
  rect(0,0,600,50); // HUD menue

  if(timer<6 && win==0){
  fill(0);
  text("Timer : " + nf(timer, 1, 2),109,30);
  }
  else if(timer>6 && win==0){
   fill(random(100,255),0,0);
   text("Timer : " + nf(timer, 1, 2),109,30);
  }
}

void maze(){ //draws the maze
  image(floor,0,0);
  cursor(ARROW);
  noStroke();
  fill(0,255,0);
  rect(0,146,300,20);
  rect(0, 50, 20, 100);
  rect(430,50,20,500);
  rect(430,226,-355,20);
  rect(74,226,20,200);
  rect(0,504, 300, 20);
  rect(166,504, 20, -200);
  rect(296,226, 20, 200);
  fill(#D68000);
  rect(300,534,120,50);
}

void player(){ //creats the player
  fill(255,0,0);
  rect(x,y,25,25);
}

void keyPressed(){ //the players controls
  if(start==1){
    if (key == 'w'  && y > 55) {
      y = y-15;
    }
    if (key == 's' && y < 570) {
      y = y+15;
    }
    if (key == 'a' && x > 0) {
      x = x-15;
    }
    if (key == 'd' && x < 410) {
      x = x+15;
    }
  }
}

void openScreen(){ //opening page
  if(menue==0){
    timer=0;
    background(0);
  image(begin,0,0);
  fill(255);
  textSize(36);
  text("[Play]",175,350);
  text("[Instructions]",125,450);
  if(mousePressed==true && (mouseX>175 && mouseX<265) && (mouseY>320 && mouseY<350))
  {
    menue=1;
  }
  if(mousePressed==true && (mouseX>125 && mouseX<325) && (mouseY>420 && mouseY<450))
  {
    menue=2;
  }
  if((mouseX>175 && mouseX<265) && (mouseY>320 && mouseY<350)){
    cursor(HAND);
  }
  else if((mouseX>125 && mouseX<325) && (mouseY>420 && mouseY<450)){
    cursor(HAND);
  }
  else
  cursor(ARROW);
  
  }
  else
  background(0);
}

void collison(){ //test collsions between maze walls and player
  if((x>0 && x<20) && (y>50 && y<165)){
    win=2;
  }
  if((x>26 && x<300) && (y>129 && y<166)){
      win=2;
  }
  if((x>416 && x<450) && (y>56 && y<550)){
     win=2;
  }
  if((x>75 && x<430) && (y>204 && y<245)){
     win=2;
  }
  if((x>56 && x<95) && (y>204 && y<425)){
     win=2;
  }
  if((x>146 && x<185) && (y>279 && y<500)){
     win=2;
  }
  if((x>281 && x<316) && (y>225 && y<425)){
     win=2;
  }
  if((x>0 && x<300) && (y>489 && y<525)){
     win=2;
  }
  if((x>311 && x<420) && (y>519 && y<580)){
     win=1;
  }
  
  if(timer>10){
    win=2;
  }
}


