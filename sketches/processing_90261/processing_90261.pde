
int ship;
Invader[] Invaders;
int c;
int wait;

ArrayList shots;

boolean shooting=false;
boolean waiting=false;

void setup(){
  size(1000,700);
  background(255);
  Invaders=new Invader[11];
  for (int i=1;i<11;i++)
  {//10
   int rx = (int) random(0,(width/25-1))*25;
   int ry = (int) random(0,(height/25-1))*-25;
   int rk = (int) random(1,4);
   int rl = (int) random(1,8);
   Invaders[i] = new Invader(rx,ry,rk,true,rl);
  }
  Invaders[0] = new Invader(width/2-14,height-5,0,true);
  ship=0;
  c=1;
  shots=new ArrayList()
}


void draw(){
  noStroke();
  fill(0);
  background(255);

 
  Invaders[0].drawInvader();
  for (int i = 1; i <11; i++)
  {
    Invaders[i].drawInvader();
    if(frameCount%(30)==0){
    Invaders[i].animate();}
  }
  if(frameCount%(30)==0){
  move();}
  int time=0;
  if(frameCount%(20)==0){
  waiting=true;}
  while(shooting && waiting){
      
      Invader bullet = new Invader(Invaders[0].getX()+28,Invaders[0].getY(),5,true);
      shots.add(bullet);
    
      waiting=false;
  }
  
  hit();
  
  for (int i = 0; i <shots.size(); i++)
  {
  Invader temp=(Invader) shots.get(0);
  shots.remove(0);
  temp.drawInvader();
  shots.add(temp);
  }
  shotMove();
}


void hit(){
  for(int i=1;i<11;i++)
{
    for(int J=0;J<shots.size();J++)
 {
  boolean col = false;
  Invader temp=(Invader) shots.get(0);
  shots.remove(0);
  switch(Invaders[i].getKind()){
   case 1: if((temp.getX() >= Invaders[i].getX() && temp.getX() <= Invaders[i].getX()+52) && (temp.getY() >= Invaders[i].getY() && temp.getY() <= Invaders[i].getY()+32)){
           Invaders[i].ouch();
           col=true;
             }
           break;
   case -1: if((temp.getX() >= Invaders[i].getX() && temp.getX() <= Invaders[i].getX()+52) && (temp.getY() >= Invaders[i].getY() && temp.getY() <= Invaders[i].getY()+32)){
           Invaders[i].ouch();
           col=true;
             }
           break;
   case 2: if((temp.getX() >= Invaders[i].getX() && temp.getX() <= Invaders[i].getX()+32) && (temp.getY() >= Invaders[i].getY() && temp.getY() <= Invaders[i].getY()+32)){
           Invaders[i].ouch();
           col=true;
             }
           break;
   case -2: if((temp.getX() >= Invaders[i].getX() && temp.getX() <= Invaders[i].getX()+32) && (temp.getY() >= Invaders[i].getY() && temp.getY() <= Invaders[i].getY()+32)){
           Invaders[i].ouch();
           col=true;
             }
           break;
   case 3: if((temp.getX() >= Invaders[i].getX() && temp.getX() <= Invaders[i].getX()+44) && (temp.getY() >= Invaders[i].getY() && temp.getY() <= Invaders[i].getY()+32)){
           Invaders[i].ouch();
           col=true;
             }
           break;
   case -3: if((temp.getX() >= Invaders[i].getX() && temp.getX() <= Invaders[i].getX()+44) && (temp.getY() >= Invaders[i].getY() && temp.getY() <= Invaders[i].getY()+32)){
           Invaders[i].ouch();
           col=true;
             }
           break;
   case 4: if((temp.getX() >= Invaders[i].getX() && temp.getX() <= Invaders[i].getX()+56) && (temp.getY() >= Invaders[i].getY() && temp.getY() <= Invaders[i].getY()+28)){
           Invaders[i].ouch();
           col=true;
             }
           break;
   case -4: if((temp.getX() >= Invaders[i].getX() && temp.getX() <= Invaders[i].getX()+56) && (temp.getY() >= Invaders[i].getY() && temp.getY() <= Invaders[i].getY()+28)){
           Invaders[i].ouch();
           col=true;
             }
           break;
    
  }
  if(!col){
  shots.add(temp);}
  if(Invaders[i].getLife()<=0){
    Invaders[i].respawn();}
  }
 }
}
 
void shotMove(){
  for(int i=0;i<shots.size();i++)
 {
  
   
  Invader temp=(Invader) shots.get(0);
  shots.remove(0);
  for(int j=0;j<2;j++){
  temp.moveUp();
  }
  if(temp.getY()>=-10){
  shots.add(temp);}
 }  
}
void move(){
  for (int i=1;i<11;i++){
    if(Invaders[i].getX()>width-50){
      c=(int)random(0,1.9);
    }else if(Invaders[i].getX()<30){
      c=(int)random(0,1.9)+1;
    }else{
     c=(int)random(0,2.9);
    }
      if(c%(3)==0){
     for(int j=1;j<=10;j++){
      Invaders[i].moveDown();}
     for(int k=1;k<=24;k++){
      Invaders[i].moveLeft();}
  }else if(c%(3)==2){
     for(int j=1;j<=10;j++){
      Invaders[i].moveDown();}
     for(int k=1;k<=24;k++){
      Invaders[i].moveRight();}
  }else{
    for(int j=1;j<=10;j++){
      Invaders[i].moveDown();}
    }
     
   if(Invaders[i].getY()>=height+20){
    Invaders[i].respawn();}
  }
  
}
void keyPressed(){//begin keyPressed
  if(key == CODED)
  {
    /*if (keyCode == UP)
    {
      Invaders[0].moveUp();
    }
    else if (keyCode == DOWN)
    {
      Invaders[0].moveDown();
    }
    else */if (keyCode == LEFT)
    {
      for(int i=0;i<10;i++){
        Invaders[0].moveLeft();}
    }
    else if (keyCode == RIGHT)
    {
      for(int i=0;i<10;i++){
      Invaders[0].moveRight();}
    } 
  } 
  
  if(key == ' ')
    {
      shooting=true;
    }
} //end keyPressed

void keyReleased(){//begin keyReleased
  if(key == ' '){
   shooting=false; 
  }
  
  
}//end keyReleased



class Invader{//begin Invader class
 int locationX;
 int locationY;
 int type;
 int life;
 String pLife;
 Boolean visible;
 
 Invader(int x, int y, int kind,Boolean seen,int lives){
   locationX = x;
   locationY = y;
   type = kind;
   visible = seen;
   life=lives;
 }
 Invader(int x, int y, int kind,Boolean seen){
   locationX = x;
   locationY = y;
   type = kind;
   visible = seen;
 }
 int getX(){
  return locationX; 
 }
 int getY(){
  return locationY; 
 }
 int getKind(){
  return type; 
 }
 int getLife(){
  return life; 
 }
 void drawInvader()
 {
  pLife="";
  pLife+=life;
  pushMatrix();
  noStroke();
  fill(0);
  translate(locationX,locationY);
  if(type==1)
  {
  rect(-50+8,-50,4,4);
  rect(-50+32,-50,4,4);
  rect(-50,-50+4,4,16);
  rect(-50+40,-50+4,4,16);
  rect(-50+12,-50+4,4,8);
  rect(-50+28,-50+4,4,8);
  rect(-50+8,-50+8,4,20);
  rect(-50+32,-50+8,4,20);
  rect(-50+16,-50+8,12,16);
  rect(-50+4,-50+12,4,12);
  rect(-50+36,-50+12,4,12);
  rect(-50+12,-50+16,4,8);
  rect(-50+28,-50+16,4,8);
  rect(-50+4,-50+28,4,4);
  rect(-50+36,-50+28,4,4);
   text(pLife,-50+17,-50+4);
  }
  if(type==-1)
  {
  rect(-50+8,-50,4,4);
  rect(-50+32,-50,4,4);
  rect(-50,-50+16,4,12);
  rect(-50+40,-50+16,4,12);
  rect(-50+12,-50+4,4,8);
  rect(-50+28,-50+4,4,8);
  rect(-50+8,-50+8,4,20);
  rect(-50+32,-50+8,4,20);
  rect(-50+16,-50+8,12,16);
  rect(-50+4,-50+12,4,8);
  rect(-50+36,-50+12,4,8);
  rect(-50+12,-50+16,4,8);
  rect(-50+28,-50+16,4,8);
  rect(-50+12,-50+28,8,4);
  rect(-50+24,-50+28,8,4);
   text(pLife,-50+17,-50+4);
  }
  if(type==0)
  {
  rect(-50,-50+16,60,16);
  rect(-50+4,-50+12,52,4);
  rect(-50+24,-50+4,12,8);
  rect(-50+28,-50,4,4);
  }
  if(type==2){
  rect(-50+12,-50,8,20);
  rect(-50+8,-50+4,16,8);
  rect(-50+4,-50+8,24,4);
  rect(-50,-50+12,8,8);
  rect(-50+24,-50+12,8,8);
  rect(-50,-50+16,32,4);
  rect(-50+8,-50+20,4,4);
  rect(-50+20,-50+20,4,4);
  rect(-50+4,-50+24,4,4);
  rect(-50+12,-50+24,8,4);
  rect(-50+24,-50+24,4,4);
  rect(-50,-50+28,4,4);
  rect(-50+8,-50+28,4,4);
  rect(-50+20,-50+28,4,4);
  rect(-50+28,-50+28,4,4);
  text(pLife,-50+11,-50-3);
  }
  if(type==-2)
  {
  rect(-50+12,-50,8,20);
  rect(-50+8,-50+4,16,8);
  rect(-50+4,-50+8,24,4);
  rect(-50,-50+12,8,8);
  rect(-50+24,-50+12,8,8);
  rect(-50,-50+16,32,4);
  rect(-50+4,-50+20,4,4);
  rect(-50+12,-50+20,8,4);
  rect(-50+24,-50+20,4,4);
  rect(-50,-50+24,4,4);
  rect(-50+28,-50+24,4,4);
  rect(-50+4,-50+28,4,4);
  rect(-50+24,-50+28,4,4); 
  text(pLife,-50+11,-50-3);
  }
  if(type==3)
  {
  rect(-50+16,-50,16,4);
  rect(-50+4,-50+4,40,8);
  rect(-50,-50+8,12,12);
  rect(-50+36,-50+8,12,12);
  rect(-50+20,-50+12,8,4);
  rect(-50+12,-50+16,24,4);
  rect(-50+12,-50+20,8,4);
  rect(-50+28,-50+20,8,4);
  rect(-50+8,-50+24,8,4);
  rect(-50+20,-50+24,8,4);
  rect(-50+32,-50+24,8,4);
  rect(-50,-50+28,8,4);
  rect(-50+40,-50+28,8,4); 
  text(pLife,-50+19,-50-2);
  }
  if(type==-3)
  {
  rect(-50+16,-50,16,4);
  rect(-50+4,-50+4,40,8);
  rect(-50,-50+8,12,12);
  rect(-50+36,-50+8,12,12);
  rect(-50+20,-50+12,8,4);
  rect(-50+12,-50+16,24,4);
  rect(-50+8,-50+20,12,4);
  rect(-50+28,-50+20,12,4);
  rect(-50+4,-50+24,8,4);
  rect(-50+20,-50+24,8,4);
  rect(-50+36,-50+24,8,4);
  rect(-50+8,-50+28,8,4);
  rect(-50+32,-50+28,8,4); 
  text(pLife,-50+19,-50-2);
  }
  if(type==4||type==-4)
  {
  rect(-50+20,-50,24,4);
  rect(-50+12,-50+4,40,8);
  rect(-50+8,-50+8,48,4);
  rect(-50+4,-50+12,8,8);
  rect(-50+16,-50+12,8,8);
  rect(-50+28,-50+12,8,12);
  rect(-50+40,-50+12,8,8);
  rect(-50+52,-50+12,8,8);
  rect(-50,-50+16,64,4);
  rect(-50+8,-50+20,12,4);
  rect(-50+44,-50+20,12,4);
  rect(-50+12,-50+24,4,4);
  rect(-50+48,-50+24,4,4);
  }
  if(type==5||type==-5)
  {
    rect(-50,-50,4,8);
  }
  popMatrix();
 }
  void moveUp()
  {
    locationY--;
  }
  void moveDown()
  {
    locationY++;
  }
  void moveLeft()
  {
    locationX--;
  }
  void moveRight()
  {
    locationX++;
  }
  void animate()
  {
    type*=-1;
  }
  void ouch(){
   life--; 
  }
  void respawn(){
    locationX=(int) random(0,(width/25-1))*25;
    locationY=(int) random(0,(height/10-1))*-10;
    type=(int) random(1,4);
    life=(int) random(1,8);
  }
 }//end Invader class
