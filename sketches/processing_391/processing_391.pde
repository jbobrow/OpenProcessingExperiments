
class Being {

  //State
  boolean isZombie;
  boolean isDead = false;
  boolean isCannibal = false;
  int x,y;
  int dir; //1 = up, 2 = right, 3 = down, 4 = left
  int panic = 0;
  int active = 0;
  int humansKilled = 0;
  int decayed = 0;
  int deadVal;
  int localMass;

  Being(boolean isZombie) {
    this.isZombie = isZombie;

    x = (int)random(width-mass)+mass;
    y = (int)random(height-mass)+mass;
    dir = (int)random(4) + 1;
    deadVal = deadZombie;
    localMass = mass;
    
    noStroke();
  }

  //The main loop for the zombie/human.
  void exist() {
    checkState();
    updatePosition();
    apply();
  }

  //This function updates the being's state vars depending on if the being is a zombie or a human
  void checkState() {
    if(isZombie && !isDead) {
      fill(zombie);
      decayed++;
      if(decayed >= decay) isDead = true;
    } 
    else if(isZombie && isDead) {
      if(deadVal > 0) deadVal-=fade;
      if(deadVal <= 0) { deadVal = 0; noFill(); }
      else fill(0,deadVal,0);
    }
    else if(panic > 0) {
      fill(panicHuman);
    } 
    else {
      fill(human);
    }
  }

  color look(int d) {
    int xpos = x;
    int ypos = y;

    //We are using circles!
    if(dir==1) ypos-=localMass/2+1;
    if(dir==2) xpos+=localMass/2+1;
    if(dir==3) ypos+=localMass/2+1;
    if(dir==4) xpos-=localMass/2+1;


    for(int i = 0; i < d; i++) {
      if(dir==1) ypos--;
      if(dir==2) xpos++;
      if(dir==3) ypos++;
      if(dir==4) xpos--;

      if(xpos>width-1 || xpos<1 || ypos>height-1 || ypos<1) return wall;
      color pixel = getPixel(xpos,ypos);
      if(pixel == human) return human;
      if(pixel == panicHuman) return panicHuman;
      if(pixel == zombie) return zombie;
      int greenPixel = (pixel >> 8 & 0xFF);
      if(greenPixel <= deadZombie && greenPixel > 0) return deadZombie;
    }
    return nothing;
  }

  void updatePosition() {

    //Move!
    int r = (int)random(10);
    if(((!isZombie && panic>0) || r < 1 || active>0) && !isDead) {
      //update position

      if(look(1)==nothing || active>0) {
        if(dir==1) y-=1;
        else if(dir==2) x+=1;
        else if(dir==3) y+=1;
        else if(dir==4) x-=1;
      } 
      else {
        dir = (int)random(4)+1;
      }

      if(active>0) active--;
      if(panic>0) panic--;
    }  //End move

    int target = look(distance);

    //Zombie logic
    if(isZombie && !isDead) {
      
      panic = 0;

      //Look around!
      if((target == zombie && !isCannibal) || target == wall || (target == nothing && (int)random(5) == 1)) { 
        dir = (int)random(4)+1; 
      } else if(isEdible(target)) {
        active = activeTurns;
      }

      int ix = x, iy = y;
      if(dir==1) iy-=localMass;
      if(dir==2) ix+=localMass;
      if(dir==3) iy+=localMass;
      if(dir==4) ix-=localMass;
      
      if(((decayed*100)/decay) >= cannibalPercent) isCannibal = true;
      else isCannibal = false;

      //Infect something?!
      if(isEdible(look(1))) { //Stops zombie creation??
        boolean eatedBrains;
        for(int i=0; i<totalBeings; i++) {
          eatedBrains = beings[i].infect(ix,iy);
          if(eatedBrains == true) { 
            localMass += beings[i].localMass;
            if(localMass > maxMass) localMass = maxMass;
            decayed-=getHealth;
            if(decayed < 0) decayed = 0;
            break; 
          }
        }
      }

    } 
    else { //Is I human?!

      //Oh Noes!  Look for zombies!
      if(target == zombie || target == panicHuman) panic = panicTurns;
      else if(target == wall || target == human) dir = (int)random(4)+1;
      else if(target == nothing && (int)random(8) == 1) dir = (int)random(4)+1;

      //Run away!
      if(target == zombie) { 
        dir += 2; 
        if(dir>4) dir -= 4; 
      }

    }
  }

  boolean infect(int ix, int iy) {
    if(x == ix && y == iy) {
      if(isDead) deadVal = -1;
      else isZombie = true; 
      return true;
    }
    return false;
  }

  boolean isEdible(int target) {
    if(isCannibal) return target == human || target == panicHuman || target == zombie || target == deadZombie;
    return target == human || target == panicHuman;
  }

  void apply() {
    if(deadVal != 0) ellipse(x,y,localMass,localMass);
  }

  //Faster versions of get() using the Pixels[] array

  color getPixel(int xpos, int ypos) {
    return pixels[xpos+ypos*width];
  }
}


