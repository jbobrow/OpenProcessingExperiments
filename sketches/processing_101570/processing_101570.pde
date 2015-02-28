
Player player;
Block[] block=new Block[10];
int time=0;
void setup() {
  size(300, 500);
  smooth(); 
  player=new Player(); 
  for (int i=0; i<block.length; i++) { 
    block[i] = new Block();
  }
}
boolean jumped=false;
void draw() {
  
  background(255); 
  managePlayer();
  blockGenerator();
  collisionDetection();
}
void blockGenerator() {
  int i=0;
  for(int t=0; t<millis(); t+=2000){
     if(t/2000<block.length){
      block[i].fall();
      block[i].display();
  i++;
  }
  }
  }


void collisionDetection() {
  for (int i=0; i<block.length; i++) {
    detectPBCollisions(player, block[i]);
  }
    for (int i=0; i<block.length; i++) {
    for (int j=0; j<block.length; j++) {
      BBcols(block[i], block[j], i);
    }
  }
}

void managePlayer() {
  if (jumped) {
    player.jumpRange=50;
  } 
  else {
    player.jumpRange=30;
  }
  player.move();
  player.display();
  checkLevel();
}
void BBcols(Block b1, Block b2, int index) {
  //println(dist(b1.loc.x+b1.bw.x/2, b1.loc.y+b1.bw.y/2, b2.loc.x+b2.bw.x/2, b2.loc.y+b2.bw.y/2));
  //Horizontal
  if (dist(b1.loc.x+b1.bw.x/2, b1.loc.y+b1.bw.y/2, b2.loc.x+b2.bw.x/2, b2.loc.y+b2.bw.y/2) < b1.bw.x/2+b2.bw.x/2 && b1.loc.y>1 && b2.loc.y>1) { 
    if (((b1.loc.x+b1.bw.x>=b2.loc.x && b1.loc.x+b1.bw.x<b2.loc.x+b2.bw.x/2))) {
      b1.xfree=false;
      b2.xfree=false;
    }
  }
  //Vertical
  if (b1.loc.y>1 && b2.loc.y>1) {
    if (b1.loc.y+b1.bw.y>=b2.loc.y && b1.loc.y+b1.bw.y<b2.loc.y+b2.bw.y/2) {
      if (ybarCheck(b1,index)) {
        b1.ybar=height-b1.bw.y;
      } else 
      if (b1.loc.x>b2.loc.x-b1.bw.x&&b1.loc.x+b1.bw.x<b2.loc.x+b2.bw.x+b1.bw.x) { 
        b1.ybar=b2.loc.y-b1.bw.y-1;
      }
      //else if (b1.loc.x<b2.loc.x-b1.bw.x || b1.loc.x+b1.bw.x>b2.loc.x+b2.bw.x+b1.bw.x) {
    }
  }
}

boolean ybarCheck(Block b, int exeption){
  for(int i=0; i<block.length; i++){
  if(i==exeption){} else
  if (b.loc.x<block[i].loc.x-block[i].bw.x || b.loc.x+b.bw.x>block[i].loc.x+block[i].bw.x+b.bw.x) {} else {return false;}
  }
  return true;
}
void detectPBCollisions(Player p, Block b) {
  //Vertical
  if (p.location.x+p.pw.x>b.loc.x && 
    p.location.x<b.loc.x+20) {
    if (p.location.y+p.pw.y<b.loc.y+1) {
      //p.jumpRange=50;
      jumped=true;
    }
    if (p.location.y<b.loc.y+20  && b.inAir) {
      noLoop();
    }
  }     
  //Horizontal
  if (p.location.y+p.pw.y>b.loc.y && b.loc.y+20>p.location.y ) {

    if (p.location.x<b.loc.x+20 && p.location.x>b.loc.x+10){
    if(b.xfree) {
      b.loc.x=p.location.x-b.bw.x;
    } else if(!b.xfree){ p.Lfree=false; p.location.x=b.loc.x+b.bw.x;}
    }
     if (p.location.x+p.pw.x>b.loc.x && p.location.x+p.pw.x<b.loc.x+10){
     if(b.xfree) {
      b.loc.x=p.location.x+p.pw.x; 
    } else if(!b.xfree){ p.Rfree=false; p.location.x=b.loc.x-p.pw.x;}
    }
  }
  //println((p.location.x+p.pw.x)+" "+b.loc.x+" id: "+b.id+" mX: "+mouseX );
  if(!b.xfree){ 
  if(((p.location.x+p.pw.x<b.loc.x && p.location.x+p.pw.x>b.loc.x-p.pw.x) || p.location.y+p.pw.y<b.loc.y)&&!p.Rfree){ p.Rfree=true; }
  if(((p.location.x>b.loc.x+b.bw.x && p.location.x<b.loc.x+b.bw.x+p.pw.x)|| p.location.y+p.pw.y<b.loc.y)&&!p.Lfree){ p.Lfree=true; }
  }
  //println("Rfree: "+p.Rfree+" "+"Lfree: "+p.Lfree+" "+"Bloc");
}

class Player {
  int jumpRange=30;
  PVector location;
  PVector pw;
  float maxUP,maxDOWN;
  int force=2;
  boolean air;
  boolean Rfree=true;
  boolean Lfree=true;
  Player(){
   pw=new PVector(10,20);
   location=new PVector(width/2, height-(pw.y/2));
   MnMreset();
  }
  
  void display(){
    fill(0);
   rect(location.x,location.y,pw.x,pw.y);
  }
  void move(){
    MnMreset();
   if(keyPressed){
    if(keyCode==RIGHT && Rfree){ location.x+=force; }
    if(keyCode==LEFT && Lfree){ location.x-=force; }
    if(keyCode==UP && location.y>maxUP && !air){ location.y-=6; if(location.y==maxUP){
    air=true;}
    }
   } 
   location.x=constrain(location.x,0,width-pw.x);
   if(location.y==maxDOWN){ air=false; }
   location.y=constrain(location.y,maxUP,maxDOWN);
   location.y+=force/2;
  }
  void MnMreset(){
   maxUP=height-(pw.y)-jumpRange;
   maxDOWN=height-(pw.y)-jumpRange+30;
}
}
class Block{
 float id=random(0,1);
 PVector bw=new PVector(20,20);
 PVector loc=new PVector(random(0,width-bw.x),0);
 PVector vel=new PVector(0,1);
 boolean inAir=true;
 boolean yfree=true;
 boolean xfree=true;
 float ybar=height-bw.y;
 color c = color(random(0,255),random(0,255),random(0,255));
 void fall(){ 
   fill(c);
  loc.y=constrain(loc.y,0,ybar);
  //loc.x=constrain(loc.x,0,width-bw.x);
  if(loc.x<=0-1 || loc.x+bw.x>=width){xfree=false;}
  loc.add(vel); 
  if(loc.y>=player.location.y-player.pw.y){inAir=false; } 
 }
 void display(){
  rect(loc.x,loc.y,bw.x,bw.y);
  //println(loc.y);
 }
}
int resetJR(Player p, Block b) {
    if (p.location.x+p.pw.x>b.loc.x && 
    p.location.x<b.loc.x+20) {
    if (p.location.y+p.pw.y<b.loc.y+1) {
      return 1;
    }}
    return 0; 
}

void checkLevel(){
   int j=0;
  for (int i=0; i<block.length; i++) {
    j+=resetJR(player,block[i]);
  }
  if(j==0){ jumped=false;}
}


