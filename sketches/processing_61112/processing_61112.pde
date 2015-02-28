
// Function used to change the class of the being.
// To be used befor running the move action.
Being changeBeing(Being being){
  int x,y,changed;
  
  if (being.changed == isdead){
      return new Dead(being);
  }
  if (being.changed == iszombie){
      return new Zombie(being);
  }
  if (being.changed == issoldier){
      return new Soldier(being);
  }
  return being;
}

// Generic being class. Is not meant to be used
class Being { 
  int xpos, ypos, dir;
  int type, active; // type : zombie, ... active : >0 panic
  int changed;
  int seeList[][] = {};
  int ignoreList[] = {};

  //Being(){}

  // With planned structure (array of beings), can not die
  // should be killed by another object.
  void die(){
    changed=isdead;
  }

  // Places a being at a random position on an empty area
  void position(){
    for (int ok=0; ok<100; ok++){
      xpos = playArea.setX(); 
      ypos = playArea.setY();//(int)random(playArea.gHeight);
      if (get(xpos,ypos)==empty) { ok = 100; }
    }
  }
  
  // look in a given direction, up to a certain distance
  // return result depending on first object seen
  // beings look at what is drawn on the screen
  int look(int seeList[][],int ignoreList[],int d,int dist){
    int x,y; 
    color colour;
    
    x = xpos;
    y = ypos;
    for(int i=0; i<dist; i++){
      x += directionX(d);
      y += directionY(d);
      
      colour = get(x,y);
      if (!playArea.inside(x,y)) return seeWall;// saw nothing, out of playArea    
      for (int j=0; j<seeList.length; j++){
        if (colour == seeList[j][0]) return seeList[j][1];
      }
      
      // Checks if sees anything that is not in ignoreList
      int k;
      for ( k=0; k<ignoreList.length;k++){
        if (colour == ignoreList[k]) break;
      }
      if (k==ignoreList.length) return seeSomething; 
    }
    return seeNothing; // saw nothing
  }
  
  int directionX(int dir){
    switch(dir){
      case 1:
      case 3:
        return 0;
      case 2:
        return 1;
      case 4:
        return -1;
    }
    return 0;
  }
  
  int directionY(int dir){
    switch(dir){
      case 1:
        return -1;
      case 2:
      case 4:
        return 0;
      case 3:
        return +1;
    }
    return 0;
  }

  void drawBeing(){}
  void move(){}
  void infect(int x, int y){}
  void infect() {}
  void equip(){}
}

class Human extends Being {
  int belief, maxBelief;
  int rest;
  int seeList[][] = {  {panicHuman,seePanicHuman},
                   {zombie,seeZombie},
                   {activeZombie,seeZombie} };
  int ignoreList[] = {empty,dead,hit};
  
  Human(){
    dir = (int)random(4)+1;
    type = ishuman;
    active = 0;
    belief=500;
    maxBelief=500;
    rest=40;
    changed=-1;
  }
  
  Human(Being being){
    xpos = being.xpos;
    ypos = being.ypos;
    dir = being.dir;
    type = ishuman;
    active = 0;
    belief = 500;
    maxBelief = 500;
    rest = 40;
    changed = -1;
  }
  
  // If something is at the same position, the character turns into a zombie
  void infect(int x, int y){
    if (x==xpos && y==ypos) changed = iszombie; 
  }

  // character is infected, and draw a zombie
  void infect() { //type = iszombie; set(xpos, ypos, zombie); 
    changed = iszombie; set(xpos, ypos, zombie); 
  }
  
  void equip(){
    changed = issoldier;
  }
  
  void drawBeing(){
    if (active > 0) set(xpos, ypos, panicHuman);
    else set(xpos, ypos, human);
  }
  
  void move(){
    
    int r = (int)random(3); //being move once every 4 ticks, except panic who run every
    if (active>0 || r==1){ // if panicHuman or just moves by one
      set(xpos, ypos, empty);
      if(belief<=0){
        active=0;
        maxBelief-=100;
        belief=0;
        rest=0;
      }
      
      // if sees nothing in direction, moves   
      if (look(seeList,ignoreList,dir,1)==seeNothing) {
        xpos += directionX(dir);
        ypos += directionY(dir);
      }
      
      // otherwise turns
      else {
        dir = (int)random(4)+1; 
      }

      drawBeing();
      if (active>0) {active--;}
    }

    // everybody looks in direction
    int target = look(seeList,ignoreList,dir,10);

    // Saw a zombie !! Believes in them, and turns around
    if (target==1){
      maxBelief=500;
      belief=500;
      active=10;
      rest=0;
      dir = dir + 2; 
      if (dir>4) dir = dir - 4; 
    }
    
    // Saw someone panicking !!
    else if(target==seePanicHuman){ 
      active=10;
      if(belief>0){
        belief--;
      }
      else if(belief==0 && maxBelief!=0 && rest>=40){
        belief=maxBelief;
        rest=0;
      }
      else if(belief==0 && rest<40){
        rest++;
      }
    }
    
    // Saw neither a zombie, nor some panicking and not active
    else if(active==0) {
      rest++;
    }
    
    // pretty likely to change direction
    if ((int)random(2)==1) dir = (int)random(4)+1;
  }
  
}

// Class of the corpses lying around. 
// They stay there doing nothing...
class Dead extends Being {
  
  Dead(Being being){
    xpos = being.xpos;
    ypos = being.ypos;
    type = isdead;
    changed = -1;
  }
  
  void drawBeing(){
    set(xpos,ypos,dead);
  }
  
  void move(){
    drawBeing();
  } 
  
  // Dead can't be infected nor die.
  void die(){}
}

class Zombie extends Being {
  int zombielife;
  int seeList[][] = {  {wall,seeWall},
                       {panicHuman, seeHuman},
                       {human, seeHuman},
                       {shootingSoldier, seeHuman},
                       {soldier, seeHuman}};
  int ignoreList[] = {empty,dead,hit};
  
  Zombie(Being being){
    xpos=being.xpos;
    ypos=being.ypos;
    dir=being.dir;
    type=iszombie;
    active = 0;
    zombielife=(int)random(200)+800;
    changed=-1;
  }
  
  void drawBeing(){
    if (active > 0) set(xpos, ypos, activeZombie);
    else set(xpos, ypos, zombie);
  }
  
   void move(){
     int target; // store data from look()
   //Zombies move once every 4 ticks
    
     int r = (int)random(3); 
     if (r==1) {
        set(xpos, ypos, empty);
        
        // if sees nothing in direction, moves
        target=look(seeList,ignoreList,dir,1);   
        if (target==seeNothing){
          xpos += directionX(dir);
          ypos += directionY(dir);
        }
        
        // otherwise turns
        else {
          if (target!=seeHuman) dir = (int)random(4)+1;
        }
        
        // draws the zombie at its new position
        drawBeing();
      }
  
      // now, checks what can be seen
      target = look(seeList,ignoreList,dir,10);
      
      // if sees human, activates
      if (target==seeHuman) active = 10; 
      
      // if sees a wall, might destroy it
      else if (target==seeWall)  { 
        if((int)random(4)==1){
          set(xpos+directionX(dir),ypos+directionY(dir),empty); 
        }
      }
      
      // might turn if is not active
      if (active==0){ 
        if((int)random(10)==1){
          if((int)random(2)==0) dir = dir+1;
          else dir = dir-1;
          if(dir==5) dir=1;
          if(dir==0) dir=4;
        }
      }
      if (active>0) {active--;}
      /*if(look(xpos,ypos,dir,2)==1){ // avoid zombies
        dir=dir+1;
        if(dir>4) dir=1;
      }*/
   
      // search for victims
      int victim = look(seeList,ignoreList,dir,1);
      if (victim == seeHuman){
        int ix = xpos+directionX(dir);
        int iy = ypos+directionY(dir);
        for(int i=0; i<num; i++) beings[i].infect(ix,iy); 
      }
      
      // Zombies too can die...
      zombielife--;
      if(zombielife<=0) die();
  }
}

class Soldier extends Human{
  
  Soldier(int x, int y){
    xpos=x;
    ypos=y;
    active=0;
  }
  
  Soldier(Being being){
    xpos=being.xpos;
    ypos=being.ypos;
    active=0;
    changed=-1;
  }
  
  void drawBeing(){
    if (active > 0) set(xpos, ypos, shootingSoldier);
    else set(xpos, ypos, soldier);
  }
  
  void move(){
    int dirBack;
    
    int r = (int)random(3); //being move once every 4 ticks, except panic who run every
    if (active>0 || r==1){ // if panicHuman or just moves by one
      set(xpos, ypos, empty);
      
      // If just shot moves back
      if (active>0){
          dirBack=dir+2;
          if (dirBack>4) dirBack -=4;
          if (look(seeList,ignoreList,dirBack,1)==seeNothing){
            xpos += directionX(dirBack);
            ypos += directionY(dirBack);
          }
      }
      else if (look(seeList,ignoreList,dir,1)==seeNothing) {
        xpos += directionX(dir);
        ypos += directionY(dir);
      }
      
      // otherwise turns
      else dir = (int)random(4)+1; 
      drawBeing();
      if (active>0) {active--;}
    }
    
    int target = look(seeList,ignoreList,dir,10);

    // Saw a zombie !! Shoots him
    // Not efficient at all (CPU)!! 
    if (target==seeZombie){
      
      for (int i=0;i<num;i++){
        int x=xpos;
        int y=ypos;
        for (int j=0;j<10;j++){
          x += directionX(dir);
          y += directionY(dir);
          if (beings[i] instanceof Zombie && beings[i].xpos==x 
              && beings[i].ypos==y){
            beings[i].die();
          }
        }
      }
      active=5;
    }
    
    // pretty likely to change direction
    if ((int)random(2)==1) dir = (int)random(4)+1;
  }
}




