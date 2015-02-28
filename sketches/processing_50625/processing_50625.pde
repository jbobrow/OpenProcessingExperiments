
Controller theControls;
boolean poinLipse=false;
Mover[] theMovers = new Mover[720];
int theSize = 200;
int rad = 2;

void setup() {
  Permutation[] x = genPerms(6);
  GenGroup s4 = new GenGroup(x);
  int[][] theGroup = s4.findGroup();
  size(200, 200);
  background(255);
  if(poinLipse){
    noStroke();
  }else{
    stroke(0);
  }
  theMovers[0] = new Mover(new PVector(theSize/2.0, theSize/2.0), 0);
  for (int i=1; i<720; i++) {
    theMovers[i] = new Mover(new PVector(random(theSize), random(theSize)), i);
  }
  theControls = new Controller(theGroup, theMovers);
}

void draw() {
  //  fill(255, 255, 255, 10);
  //  rect(-1, -1, theSize+1, theSize+1);
  background(255);
//  fill(0, 0, 0, 255);
  theControls.step();
}


class Controller {

  int[][] theGroup;
  Mover[] theMovers;

  Controller(int[][] theGroup_, Mover[] theMovers_) {
    theGroup = theGroup_;
    theMovers = theMovers_;
  }

  void step() {
    for (int i=1; i<theMovers.length; i++) {
      theMovers[i].render();
      Pair thePair = theMovers[i].getClosest(theMovers);
      Mover[] toPass = {
        theMovers[theGroup[i][thePair.a]], theMovers[theGroup[i][thePair.b]]
      };
      theMovers[i].update(toPass);
    }
  }
}



class Mover {
  PVector identity = new PVector(theSize/2.0, theSize/2.0);
  int me;
  PVector pos;
  float col1;
  float col2;
  PVector vel = new PVector(0, 0);
  Mover(PVector pos_, int me_) {
    me = me_;
    pos = pos_;
  }
  Pair getClosest(Mover[] movList) {
    float[] distList = new float[movList.length];
    for (int i=0; i<movList.length; i++) {
      distList[i] = getDistance(movList[i]);
    }
    float closest = distList[(me+1)%movList.length];
    int clindex = (me+1)%movList.length;
    for (int i=0; i<distList.length; i++) {
      if (i!=me) {
        if (closest>distList[i]) {
          closest = distList[i];
          clindex = i;
        }
      }
    }
    col1 = closest;
    float secClosest = distList[(me+1)%movList.length];
    int secClindex = (me+1)%movList.length;
    for (int i=0; i<distList.length; i++) {
      if (i!=me && i!= clindex) {
        if (secClosest>distList[i]) {
          secClosest = distList[i];
          secClindex = i;
        }
      }
    }
    col2 = secClosest;
    return new Pair(clindex, secClindex);
  }
  void update(Mover[] who) {
    //if multiplied with the identity, move away from it
    PVector temp;
    temp = new PVector(who[0].pos.x-who[1].pos.x, who[0].pos.y-who[1].pos.y);
    temp.normalize();
//    temp.(5.0);
    vel.set(temp);
    vel.normalize();
    vel.mult(1);
    pos.add(vel);
    if (pos.x < 0) {
      pos.x += theSize;
    }
    if (pos.y < 0) {
      pos.y += theSize;
    }
    if (pos.x > theSize) {
      pos.x -= theSize;
    }
    if (pos.y > theSize) {
      pos.y -= theSize;
    }
  }

  float getDistance(Mover mov) {
    if (mov.pos.x-pos.x>theSize/2.0) {
      if (mov.pos.y-pos.y>theSize/2.0) {
        return(dist(mov.pos.x-theSize, mov.pos.y-theSize, pos.x, pos.y));
      }
      if (mov.pos.y-pos.y<-theSize/2.0) {
        return(dist(mov.pos.x-theSize, mov.pos.y+theSize, pos.x, pos.y));
      }
      return(dist(mov.pos.x-theSize, mov.pos.y, pos.x, pos.y));
    }
    if (mov.pos.x-pos.x<-theSize/2.0) {
      if (mov.pos.y-pos.y>theSize/2.0) {
        return(dist(mov.pos.x+theSize, mov.pos.y-theSize, pos.x, pos.y));
      }
      if (mov.pos.y-pos.y<-theSize/2.0) {
        return(dist(mov.pos.x+theSize, mov.pos.y+theSize, pos.x, pos.y));
      }
      return(dist(mov.pos.x+theSize, mov.pos.y, pos.x, pos.y));
    }
    return(dist(mov.pos.x, mov.pos.y, pos.x, pos.y));
  }
  void render() {
    if(poinLipse){
      ellipse(pos.x, pos.y, rad, rad);
      if(pos.x < rad){
          ellipse(pos.x+theSize, pos.y, rad, rad);
        if(pos.y <rad){
          ellipse(pos.x+theSize, pos.y+theSize, rad, rad);
        }
        if(500-pos.y < rad){
          ellipse(pos.x+theSize, pos.y-theSize, rad, rad);
        }
      }
      if(500-pos.x < rad){
        ellipse(pos.x-theSize, pos.y, rad, rad);
        if(pos.y <rad){
          ellipse(pos.x-theSize, pos.y+theSize, rad, rad);
        }
        if(500-pos.y < rad){
          ellipse(pos.x-theSize, pos.y-theSize, rad, rad);
        }
      }
      if(pos.y < rad){
        ellipse(pos.x, pos.y+theSize, rad, rad);
      }
      if(500-pos.y<rad){
        ellipse(pos.x, pos.y-theSize, rad, rad);
      }
    }else{
//      stroke(127+127*sin(col1/2.0), 50-50*sin(col2/2.0), 127-127*sin(col2), 50);
      point((int)pos.x, (int)pos.y);
    }
  }
}

class Pair {
  int a;
  int b;
  Pair(int a_, int b_) {
    a = a_;
    b = b_;
  }
}

class Permutation {
  int[] thePerm;
  Permutation(int[] thePerm_) {
    thePerm = thePerm_;
  }
  int[] theMult(Permutation other) {
    int[] temp = new int[thePerm.length];
    for (int i=0; i<thePerm.length; i++) {
      temp[i] = other.thePerm[thePerm[i]];
    }
    return temp;
  }
  boolean isEqual(Permutation other) {
    for (int i=0; i<thePerm.length; i++) {
      if (thePerm[i]!=other.thePerm[i]) {
        return false;
      }
    }
    return true;
  }
}

Permutation[] genPerms(int n) {
  if (n==1) {
    int[] temp = {
      0
    };
    Permutation[] tempPerms = new Permutation[1];
    tempPerms[0] = new Permutation(temp);
    return tempPerms;
  }
  Permutation[] last = genPerms(n-1);
  Permutation[] theFinalOne = new Permutation[n*last.length];
  for (int i=0; i<n; i++) {
    int[] toPerm = new int[n-1];
    int count = 0;
    for (int j=0; j<n; j++) {
      if (j!=i) {
        toPerm[count] = j;
        count++;
      }
    }
    Permutation subPerm = new Permutation(toPerm);
    for (int j=0; j<last.length; j++) {
      int[] temp = new int[n];
      temp[0] = i;
      int[] appen = last[j].theMult(subPerm);
      for (int k=1; k<n; k++) {
        temp[k] = appen[k-1];
      }
      theFinalOne[i*last.length+j] = new Permutation(temp);
    }
  }
  return theFinalOne;
}


class GenGroup {
  Permutation[] permList;
  GenGroup(Permutation[] permList_) {
    permList = permList_;
  }
  int[][] findGroup() {
    int[][] theGroup = new int[permList.length][permList.length];
    for (int i=0; i<permList.length; i++) {
      for (int j=0; j<permList.length; j++) {
        Permutation product = new Permutation(permList[i].theMult(permList[j]));
        for (int k=0; k<permList.length; k++) {
          if (product.isEqual(permList[k])) {
            theGroup[i][j] = k;
          }
        }
      }
    }
    return theGroup;
  }
}

//void mouseClicked(){
//  save("img.tif");
//}

