
// SNOW: An Action Game in Processing by Jake Levitas

// TO-DO: fix collision, make bonus color areas

// Dot = class
// dots = array of classes
// numdots = number of dots

// STARTING CONDITIONS

boolean is_intro=true;
boolean paused=false;
int resources=500;          //starting cash
int cost_shot=1;          //cost of firing each bullet
int cost_kill=5;          //cost rewarded per kill
int cost_death=3;        //cost of escaped enemy
int total_earned=0;      //total cash earned throughout game
int total_spent=0;        //total cash spent throughout game
int bonus;                //bonus points for hitting enemies sooner
int total_bonus=0;        //total bonus accrued during game
int level=1;              //starting game level
float bullet_spd=4;        //initial bullet speed
float bullet_size=4;       //initial bullet size
int upcost_speed;          //initial cost of upgrading speed
int upcost_size;           //initial cost of upgrading size
float dot_spd=0.5;        //initial enemy speed
int startdots=10;         //initial number of enemies
int numdots=startdots;
int numlines=0;
int numbullets=0;
int maxbullets=6;          //max bullets allowed on screen at once
Dot[] dots=new Dot[numdots];
Bullet[] bullets=new Bullet[maxbullets];
float linex1,linex2,liney1,liney2,shiploc,shipsize;
boolean pressed=false;
color guncolor=color(255,0,0);
PFont font;

void setup(){
  size(600,600);
  background(0);
  smooth();
  numdots=startdots;
  for(int i=0;i<numdots;i++){
    dot_spd=sqrt(level)*0.5;          //sets dot speed at level start
    dots[i]=new Dot(dot_spd);         //creates dots at level start
  }
  shipsize=height/30;
  //font=loadFont("Eureka-90.vlw");
  //textFont(font);
}

void draw(){
  background(0);
  
  upcost_speed=int(10*bullet_spd);
  upcost_size=int(10*bullet_size);
  
  drawstats();
  
  if (numdots<1) {                                //start new level once all are killed
    setup();
    level++;
  }
  
  runchecks();
  
  noStroke();
  for(int j=0;j<numdots;j++){                 //draws dots, detect collision and delete dot if hit
    dots[j].move();
    for (int k=0;k<numbullets;k++){
     if ((abs(bullets[k].x-dots[j].x)<dots[j].dotWidth/2)&&(abs(bullets[k].y-dots[j].y)<dots[j].dotWidth/2)) {
      dots[j].hit=true;
      bonus=calcbonus(dots[j].y);    //calculate bonus earned
      total_bonus+=bonus;
      resources+=cost_kill+bonus;
      total_earned+=cost_kill+bonus;
       if (j<numdots-1){                          //deletes dot from array if not the 'max' dot
          for (int m=j;m<numdots-1;m++){
            dots[m]=dots[m+1];
          }
        } 
        numdots--;
      } 
    }
    //println(dots[j].hit);
    if (dots[j].hit==false) dots[j].draw();
  }
  
  for(int k=0;k<numbullets;k++){          //draws and handles bullets
    bullets[k].move();
    if (bullets[0].onscreen==false) {      //deletes farthest bullet from array after exiting screen
      for (int m=0;m<numbullets-1;m++){
        bullets[m]=bullets[m+1];
       }
       numbullets--;
      }
     if (numbullets>0) bullets[k].draw();
  }
  
  drawship();
  if (is_intro) intro();
} //end draw

void drawship(){
  
  stroke(255);                          //draws ship
  shiploc=height*0.95;
  fill(255,0,0);
  rectMode(CORNER);
  rect(mouseX-shipsize/2,shiploc,shipsize,shipsize);
  fill(guncolor);
  triangle(mouseX-shipsize/2,shiploc,mouseX,shiploc-shipsize,mouseX+shipsize/2,shiploc);
  
}

void drawstats(){
  
 textAlign(RIGHT);                          //write stats board
  //textMode(SCREEN);
  fill(255,255,0);
  textSize(40);
  text(resources,width*0.98,height*0.1);
  fill(255);
  textSize(20);
  text("Level "+level,width*0.98,height*0.15);
  fill(255,255,0);
  textSize(20);
  text("Bonus "+total_bonus,width*0.98,height*0.2);
  fill(255,0,0);
  textSize(20);
  text("Spent "+total_spent,width*0.98,height*0.25);
  fill(0,255,0);
  textSize(20);
  text("Earned "+total_earned,width*0.98,height*0.3);
  fill(0,255,255);
  textSize(20);
  text("Upgrades",width*0.98,height*0.35);
  text("(S)peed: $"+upcost_speed,width*0.98,height*0.40);
  text("Si(z)e: $"+upcost_size,width*0.98,height*0.45);
  
  fill(0,255,0);                        //draw stats bars
  rect(width*.02,height*0.98,total_earned,height*0.01);
  fill(255,255,0);
  rect(width*.02+total_earned,height*0.98,total_bonus,height*0.01); 
  
  textAlign(LEFT);
  fill(255,255,0);
  text(calcbonus(height*0.2),width*0.02,height*0.2);
  text(calcbonus(height*0.4),width*0.02,height*0.4);
  text(calcbonus(height*0.6),width*0.02,height*0.6);
  
}

//------------------------- INTRO SEQUENCE -------------------------------

void intro(){
  noLoop();
  background(0);
  textAlign(CENTER);
  fill(255,255,0);
  textSize(20);
  text("We don't need gun control...we need bullet control. - Chris Rock",width/2,height/2);
  
}

//------------------------- RUN PROGRAM CHECKS -------------------------------

void runchecks(){
 
  if (numbullets>0) {                              //checks
    //println(numdots);
    //println(resources);
    //println(bullets[0].onscreen); 
    //println(bullets[0].y);
    //println(numbullets);
  } 
  
}

//------------------------- CALCULATE BONUS -------------------------------

int calcbonus(float location){
 int calced_bonus = int((height-location)/(height/3));
 return calced_bonus;
}

//------------------------- MOUSE AND KEYBOARD CONTROLS -------------------------------

void keyPressed(){
 if (key=='`') setup();
 if (key=='g') {                                  //skips intro panel
   is_intro=false;
   setup();
   loop();
 }
 
 if (key==' '){
   if (numbullets<maxbullets){                    //shoot bullet with spacebar
    bullets[numbullets]=new Bullet(bullet_spd, bullet_size);
    numbullets++;
    resources-=cost_shot;
    total_spent-=cost_shot;
    guncolor=color(0,255,0);
  }
 }
 
 if (key=='p') {                                // PAUSE GAME
   paused=!paused;
   if (paused){
     fill(255,0,0);
     textAlign(CENTER);
     textSize(90);
     text("PAUSED",width/2,height/2);
     noLoop();
   }
   else loop();
 }
 
 if (key=='s') {                               //UPGRADE SPEED
   if (resources>=upcost_speed){
     resources-=upcost_speed;
     total_spent-=upcost_speed;
     bullet_spd++;
   }
 }
 
 if (key=='z') {                               //UPGRADE SPEED
   if (resources>=upcost_size){
     resources-=upcost_size;
     total_spent-=upcost_size;
     bullet_size+=3;
   }
 }
 
} //end keypressed

void mousePressed() {
  
  if (numbullets<maxbullets){
    bullets[numbullets]=new Bullet(bullet_spd, bullet_size);
    numbullets++;
    resources-=cost_shot;
    total_spent-=cost_shot;
    guncolor=color(0,255,0);
  }
}

void mouseReleased(){
 guncolor=color(255,0,0); 
}
class Bullet {
  float x,y,dotWidth,speed;
  boolean onscreen=true;
  color col;
  Bullet(float b_spd, float b_size){
   x=mouseX;
   y=.95*height-shipsize*2;
   dotWidth=b_size;
   speed=b_spd;
   col=color(255,0,0);
  }
  
  void move(){
    y-=speed; 
    if (y<0) onscreen=false; else onscreen=true;
  }
  
  void draw(){                 //within Dot class
    
    //Draw Dot
    fill(col);
    rectMode(CENTER);
    rect(x,y,dotWidth,dotWidth);
  }
  
} //end class
class Dot {
  float x,y,dotWidth,speed;
  color col;
  boolean hit=false;
  int type;                  //type of enemy
  Dot(float spd){
    x=random(width);                        //starting position
    y=0;
    dotWidth=16;
    speed=spd;
    col=color(255,random(100)+155);
    if (level<4) type=int(random(level)); else type=int(random(3));  //enemy types change with each level
  }

  void move(){
    if (y>height) { 
      y=0;
      x=random(width);
      resources-=cost_death;                         //lose money for escaped enemies
      total_spent-=cost_death;
    }
    enemydefine();                                   //handle behavior for enemy types
    if (x<dotWidth/2) x=dotWidth/2;                  //handle screen edge collision
    if (x>width-dotWidth/2) x=width-dotWidth/2;
  }
  void enemydefine(){

    if (type==0) {
      x+=random(4)-2;
      y+=speed;
    }
    if (type==1) {
      x+=random(10)-5;
      y+=speed;
    }
    if (type==2) {
      x+=random(20)-10;
      y+=speed;
    }
  }
  
  void draw(){                 //within Dot class

    //Draw Dot
    fill(col);
    if (type==0){
      ellipseMode(CENTER);
      ellipse(x,y,dotWidth,dotWidth);
    }
    if (type==1){
      rectMode(CENTER);
      rect(x,y,dotWidth,dotWidth);
    }
    if (type==2){
      rectMode(CENTER);
      triangle(x-dotWidth/2,y+dotWidth/2,x,y-dotWidth/2,x+dotWidth/2,y+dotWidth/2);
    }
  }

} //end class



