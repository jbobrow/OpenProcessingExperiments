
ArrayList shooters = new ArrayList();
int stimer,ctimer,gtimer,osec,px,py,firedelay;
boolean menu = true;
boolean fr = false;
Player player;
void setup(){
  size(480,360);
  background(#FFEEEE);
  text("Shots",width/2-10,height/2-50);
  smooth();
  shooters.add(new Shooter(int(random(30,width-30)),int(random(30,height-30))));
  player = new Player(width/2,height/2,15);
  speed = 2;
  osec  = 2;
}

void draw(){
  if (player != null){
    if (menu){
      background(#FFEEEE);
      fill(#552233);
      text("Shots",width/2-20,height/2-120);
      text("Choose difficulty wisely",width/2-65,height/2-85);
      if (mouseX>width/2-50 && mouseY>height/2-75 && mouseX<width/2+50 && mouseY<height/2-25){
        fill(#3377AA);
        if (mousePressed){firedelay=99;menu = false;}
      }
      else fill(#004477);
      rect(width/2-50,height/2-75,100,50);
      fill(#FFFFFF);
      text("Disappointing",width/2-38,height/2-45);
      if (mouseX>width/2-50 && mouseY>height/2-20 && mouseX<width/2+50 && mouseY<height/2+30){
        fill(#3377AA);
        if (mousePressed){firedelay=59;menu = false;}
      }
      else fill(#004477);
      rect(width/2-50,height/2-20,100,50);
      fill(#FFFFFF);
      text("Miserable",width/2-25,height/2+10);
      if (mouseX>width/2-50 && mouseY>height/2+35 && mouseX<width/2+50 && mouseY<height/2+95){
        fill(#3377AA);
        if (mousePressed){firedelay=29;menu = false;}
      }
      else fill(#004477);
      rect(width/2-50,height/2+35,100,50);
      fill(#FFFFFF);
      text("Atrocious",width/2-25,height/2+65);
    }
    else{
      background(#445599);
      switch(result) {
        case NORTH: player.y-=speed; break;
        case EAST: player.x+=speed; break;
        case SOUTH: player.y+=speed; break;
        case WEST: player.x-=speed; break;
        case NORTH|EAST: player.y-=speed; player.x+=speed; break;
        case NORTH|WEST: player.y-=speed; player.x-=speed; break;
        case SOUTH|EAST: player.y+=speed; player.x+=speed; break;
        case SOUTH|WEST: player.y+=speed; player.x-=speed; break;
        case NORTH|EAST|WEST: player.y-=speed; break;
        case NORTH|SOUTH|WEST: player.x-=speed; break;
        case NORTH|SOUTH|EAST: player.x+=speed; break;
        case EAST|WEST|SOUTH: player.y+=speed; break;
      }
      player.update();
      for (int i = shooters.size()-1; i >= 0; i--) {
        Shooter shooter = (Shooter) shooters.get(i);
        shooter.update();
      }
      stimer++;
      ctimer++;
      if (osec != second()){
        gtimer++;
        osec = second();
      }
      if (stimer==firedelay) stimer=0;
      if (ctimer==199){
        shooters.add(new Shooter(int(random(30,width-30)),int(random(30,height-30))));
        ctimer=0;
      }
      //fill(#003300);
      //text("Score: "+gtimer,5,15);
      if (fr) println(frameRate);
    }
  }
    else{
      background(#FFEEEE);
      fill(#003300);
      text("You lose", width/2-25, height/2);
      text("You survived for "+gtimer+" seconds, probably", width/2-100, height/2+15);
      text("Press space to lose again", width/2-70, height/2+30);
      text("Press M to return to the menu", width/2-80, height/2+45);
    }
}

class Shooter{
  int x,y,r;
  int ofd = firedelay;
  int[] colour = new int[3];
  //int[] border = new int[3];
  int tnum = int(random(0,firedelay));
  ArrayList shots = new ArrayList();
  Shooter (int x_, int y_){
    x = x_;
    y = y_;
    r = 20; 
    colour[0] = int(random(0,255));
    colour[1] = int(random(0,255));
    colour[2] = int(random(0,255));
  }
  void update(){
    if (firedelay != ofd) {tnum = int(random(0,firedelay));ofd=firedelay;}
    fill(colour[0],colour[1],colour[2]);
    rect(x,y,r,r);
    if (stimer==tnum) shots.add(new Shot());
  for (int i = shots.size()-1; i >= 0; i--) {
    Shot shot = (Shot) shots.get(i);
    shot.update();
    if (shot.l.x > width+10 || shot.l.x < -10 || shot.l.y > height+10 || shot.l.y < -10 ) shots.remove(i);
  }
  }
  class Shot{
    PVector v = new PVector(random(-1,1),random(-1,1));
    PVector l = new PVector(x+r/2,y+r/2);
    void update(){
      ellipse(l.x,l.y,10,10);
      l.add(v);
      if (Touching(player,this)){
        px=player.x;py=player.y;
        player = null;
      }
    }
  } 
}

class Player{
  int x,y,r;
  Player (int x_,int y_,int r_) {
    x=x_;
    y=y_;
    r=r_;
  } 
  void update(){
    fill(#FF55FF);
    ellipse(x,y,r,r);
    if (x <= r/2) x = r/2;
    if (y <= r/2) y = r/2;
    if (x >= width-r/2) x = width-r/2;
    if (y >= height-r/2) y = height-r/2;
  }
}

boolean Touching(Player pl,Shooter.Shot sh){
  if (player != null){
  if (dist(pl.x,pl.y,sh.l.x,sh.l.y)<=15){
    return true;
  }
  else return false;
  }
  else return false;
}

final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
int result,speed;
//code from processing wiki by sojamo
//three key sensing by me
void keyPressed(){
  if (key == CODED){
    switch(keyCode) {
      case(UP):result |=NORTH;break;
      case(RIGHT):result |=EAST;break;
      case(DOWN):result |=SOUTH;break;
      case(LEFT):result |=WEST;break;
    }
  }
  else if (key == ' ' && player == null){
    gtimer = 0;
    player = new Player(round(random(30,width-30)),round(random(30,height-30)),15);
  }
  else if ((key == 'm' || key == 'M') && player == null){
    player = new Player(width/2,height/2,15);
    menu=true;
  }
  else if (key == 'f' || key == 'F'){
    fr = !fr;
  }
}
 
void keyReleased(){  
  if (key == CODED){
    switch(keyCode) {
      case(UP):result ^=NORTH;break;
      case(RIGHT):result ^=EAST;break;
      case(DOWN):result ^=SOUTH;break;
      case(LEFT):result ^=WEST;break;
    }
  }
}
