
PVector Pos;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer KING;
Minim minim;
AudioSnippet sfx1, sfx2;

int numCats=5;
boolean hitsfx;
 
int numAst =10;
int bullCount = 100;
 
int currshot =1;
int cannon = 0;
int score =0;
int timer = 0;
int stage = 0;
int lives = 3;
int win=0;
int evil=0;
 
PVector Rocks[] = new PVector[numAst];
PVector Bulls[] = new PVector[bullCount];
 
float rot;
float rto;
 
float fallSpeed = 1.5;
 
float speedx[] = new float[bullCount];
float speedy[] = new float[bullCount];
 
Boolean Fire = true;


PImage pug_left;
PImage pug_right;
PImage castle;
PImage cat;
PImage start;
PImage instructions;
PImage winner;
PImage loser;

float catX=820;
float catY=450;
float kittyX=1020;
float kittyY=450;

int direction=0;
int pugx=0;
int pugy=0;

void setup(){
  size(800,550);
   minim = new Minim(this);
   KING = minim.loadFile("EVO_062_1_One_Glorious_Sunday_Harpaz_Klein_311595.mp3");
   KING.loop();
   
  sfx1 = minim.loadSnippet("Loud_Bang-Osama_Bin_Laden-925764326.mp3");
  sfx2 = minim.loadSnippet("Cat_Meow_2-Cat_Stevens-2034822903.mp3");
  hitsfx = false;
   

  pug_left=loadImage("pug_left.png");
  pug_right=loadImage("pug_right.png");
  castle=loadImage("Dragon_and_castle_landscape_by_grebenru.jpg");
  cat=loadImage("evil_cat_sprite_animation_by_yamino-d3096fx.gif");
  start=loadImage("open.jpg");
    instructions=loadImage("instructions.jpg");
    winner=loadImage("winner-win.jpg");
  loser=loadImage("your-a-loser.jpg");
  
  Pos = new PVector(250,600);

  for(int num =0; num<bullCount; num++) {
    Bulls[num] = new PVector(0,600);
    speedx[num] = 10*cos(rot);
    speedy[num] = 10*sin(rot);
  }
}


void draw(){
  
  if(score==200)
    evil=1;
  if(score==500)
    evil=2;
  
  if(stage==0){
    openScreen();
  }
  
  if(stage==1){ //instructions page
  image(instructions,0,0);
  fill(255);
  textSize(36);
  text("[Back]",325,450);

  if(mousePressed==true && (mouseX>325 && mouseX<450) && (mouseY>410 && mouseY<560))
  {
    stage=0;
  }
    if((mouseX>325 && mouseX<450) && (mouseY>410 && mouseY<450)){
    cursor(HAND);
    }
   else
   cursor(ARROW);
 }
  if(stage == 2){
    image(castle, 0, 0);
  pushMatrix();
  translate(20,5);
 
  fill(255);
 
  if(mouseX <= Pos.x +20) rto = 180;
  else rto = 0;
 
  rot = atan2(-(pugy-mouseY) , -(pugx-mouseX) );
 
  if(Fire==false) timer++;
  else timer=0;
  if(timer >=15){
  Fire =true;
  timer =0;
  }
 
  missle(Rocks);
     
  translate(pugx+90,pugy+160);
  rotate(rot + radians(90));
  rect(-10,-40,20,40);
  ellipse(0,0, 20,20);
  popMatrix();
  
 fill(255);
 rect(700,0,100,100);
   fill(0);
  textSize(14);
 text("Score : " + score,720,50);
  pug();
  cat();
  win();
  }
}


void pug(){
  if(direction==0){
  image(pug_right, pugx, pugy);
  pugx+=1;
  if(pugx>500){
    direction=1;
  }
  }
  if(direction==1){
    image(pug_left,pugx,pugy);
    pugx-=1;
    if(pugx<0){
    direction=0;
 }
  }
}
  
  
  void missle(PVector[] bos) {
    float X=0;
    
  if((mousePressed && Fire ==true)) {
    Bulls[currshot].x += speedx[currshot] + pugx-160;
    Bulls[currshot].y += speedy[currshot] - 450;
    Fire =false;
    currshot +=1;
  }
 
  for(int shoo =0; shoo < bullCount; shoo++) {
    if(currshot >= bullCount) currshot = 1;
 
    if(Bulls[shoo].dist(Pos) == 0) {
      speedx[shoo] = 10*cos(rot);
      speedy[shoo] = 10*sin(rot);
    }
 
    if(Bulls[shoo].dist(Pos) > 0) {
      Bulls[shoo].x += speedx[shoo];
      Bulls[shoo].y += speedy[shoo];
    }
    if(Bulls[shoo].x >800 || Bulls[shoo].x < -800 || Bulls[shoo].y < -550) {
      Bulls[shoo].x = 800;
      Bulls[shoo].y = -800;
      speedx[shoo]=0;
      speedy[shoo]=0;
    }
    ellipse((Bulls[shoo].x), Bulls[shoo].y, 20,20);
    
    if((Bulls[shoo].x > catX && Bulls[shoo].x < (catX + 100)) && (Bulls[shoo].y > 475 && Bulls[shoo].y < 550)){
      catX=850;
      Bulls[shoo].x = 800;
      Bulls[shoo].y = -800;
      speedx[shoo]=0;
      speedy[shoo]=0;
      score= score+100;
    /* hitsfx = true;
       
     if (sfx2 != null && !sfx2.isPlaying())
     {
       sfx2.rewind();
        sfx2.play();
    }
    */
    }
      if((Bulls[shoo].x > kittyX && Bulls[shoo].x < (kittyX + 100)) && (Bulls[shoo].y > 475 && Bulls[shoo].y < 550)){
      kittyX=1075;
      Bulls[shoo].x = 800;
      Bulls[shoo].y = -800;
      speedx[shoo]=0;
      speedy[shoo]=0;
      score= score+100;
      /*
            if (sfx2 != null && !sfx2.isPlaying())
      {
        sfx2.rewind();
        sfx2.play();
    }
    */
    }
  }
}
 
void mouseReleased() {
  Fire=true;
  /*
              if (sfx1 != null && !sfx1.isPlaying())
      {
        sfx1.rewind();
        sfx1.play();
    }
    */
}

void cat(){
  if(evil==0){
  image(cat,catX,catY);  
  
  catX= catX-2;
  
  if(catX<-100){
    fill(255,0,0);
    rect(0,0,800,600);
    lives= lives -1;
    catX=850;
  }
  }
  if (evil==1){
    image(cat,catX,catY);  
  
  catX= catX-4;
  
  if(catX<-100){
    fill(255,0,0);
    rect(0,0,800,600);
    lives= lives -1;
    catX=850;
}
  }
  if (evil==2){
    image(cat,catX,catY);  
  
  catX= catX-4;
  
  if(catX<-100){
    fill(255,0,0);
    rect(0,0,800,600);
    lives= lives -1;
    catX=850;
}

  image(cat,kittyX,kittyY);  
  
  kittyX= kittyX-6;
  
  if(kittyX<-100){
    fill(255,0,0);
    rect(0,0,800,600);
    lives= lives -1;
    kittyX=850;
}
  }
}

void openScreen(){ //opening page
  if(stage==0){
    timer=0;
    background(0);
 image(start,0,0);
  fill(255);
  textSize(36);
  text("[Play]",470,350);
  text("[Instructions]",400,450);
  if(mousePressed==true && (mouseX>470 && mouseX<537) && (mouseY>320 && mouseY<350))
  {
    stage=2;
  }
  if(mousePressed==true && (mouseX>400 && mouseX<635) && (mouseY>420 && mouseY<450))
  {
    stage=1;
  }
  if((mouseX>470 && mouseX<570) && (mouseY>320 && mouseY<350)){
    cursor(HAND);
  }
  else if((mouseX>400 && mouseX<635) && (mouseY>420 && mouseY<450)){
    cursor(HAND);
  }
  else
  cursor(ARROW);
  }
  else
  background(0);
}

void win(){
  if(lives<1){ //lose screen
image(loser,0,0);
fill(0);
textSize(34);
text("[Restart]",650,500);
  if(mousePressed==true && (mouseX>650 && mouseX<781) && (mouseY>475 && mouseY<520))
  {
   evil=0;
  stage=0;
  win=0;
  score=0;
  lives=3;
  }
  if((mouseX>650 && mouseX<781) && (mouseY>475&& mouseY<520)){
    cursor(HAND);
  }
  else
  cursor(ARROW);
}
 
if(score>1000){ //win screen
image(winner,0,0);
fill(0);
textSize(34);
text("[Restart]",625,350);
  if(mousePressed==true && (mouseX>625 && mouseX<750) && (mouseY>275 && mouseY<350))
  {
  stage=0;
  win=0;
  score=0;
  lives=3;
  evil=0;
  }
  if((mouseX>625 && mouseX<750) && (mouseY>275 && mouseY<350)){
    cursor(HAND);
  }
  else
  cursor(ARROW);
}
}




