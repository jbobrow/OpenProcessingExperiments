
Controller theControls;
boolean poinLipse=true;
Mover[] theMovers = new Mover[12];
int theSize = 400;
int rad = 5;
boolean[][] pix = new boolean[theSize][theSize];

void setup() {
//  Permutation[] x = genPerms(3);
//  GenGroup s4 = new GenGroup(x);
//  int[][] theGroup = {{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29}, {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0}, {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1}, {3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2}, {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3}, {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4}, {6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5}, {7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6}, {8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7}, {9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8}, {10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, {11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, {12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, {13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, {14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, {15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, {16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, {17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}, {18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}, {19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}, {20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}, {21, 22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}, {22, 23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21}, {23, 24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}, {24, 25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, {25, 26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24}, {26, 27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, {27, 28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}, {28, 29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}, {29, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28}};
  int[][] theGroup = {{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, {1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10}, {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 1}, {3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 1, 0}, {4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3}, {5, 4, 7, 6, 9, 8, 11, 10, 1, 0, 3, 2}, {6, 7, 8, 9, 10, 11, 0, 1, 2, 3, 4, 5}, {7, 6, 9, 8, 11, 10, 1, 0, 3, 2, 5, 4}, {8, 9, 10, 11, 0, 1, 2, 3, 4, 5, 6, 7}, {9, 8, 11, 10, 1, 0, 3, 2, 5, 4, 7, 6}, {10, 11, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, {11, 10, 1, 0, 3, 2, 5, 4, 7, 6, 9, 8}};
//  int[][] theGroup = s4.findGroup();
  size(400, 400);
  background(255);
  for(int i=0; i<theSize; i++){
    for(int j=0; j<theSize; j++){
      pix[i][j] = false;
    }
  }
  if(poinLipse){
    noStroke();
  }else{
    stroke(0);
  }
  for (int i=0; i<12; i++) {
    theMovers[i] = new Mover(new PVector(random(theSize), random(theSize)), i);
//    theMovers[i] = new Mover(new PVector(200+(150*cos(TWO_PI/30.0*i)), 200+150*sin(TWO_PI/30.0*i)), i);
  }
  theControls = new Controller(theGroup, theMovers);
}

void draw() {
  background(255);
//  fill(255, 255, 255, 10);
//  rect(-1, -1, theSize+1, theSize+1);
  fill(0, 0, 0, 255);
//  for(int i=0; i<10; i++){
    theControls.step();
//  }
}


class Controller {

  int[][] theGroup;
  Mover[] theMovers;

  Controller(int[][] theGroup_, Mover[] theMovers_) {
    theGroup = theGroup_;
    theMovers = theMovers_;
  }

  void step() {
    for (int i=0; i<theMovers.length; i++) {
      theMovers[i].render();
      Triplet theTriplet = theMovers[i].getClosest(theMovers);
      Mover[] toPass = {
        theMovers[theGroup[theTriplet.a][theTriplet.b]], theMovers[theGroup[theTriplet.b][theTriplet.c]]
      };
      theMovers[i].update(toPass);
    }
  }
}



class Mover {
  int me;
  PVector pos;
  float col1;
  float col2;
  PVector vel = new PVector(0, 0);
  Mover(PVector pos_, int me_) {
    me = me_;
    pos = pos_;
  }
  Triplet getClosest(Mover[] movList) {
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
    int secClindex;
    if(clindex+1!=me){
      secClindex = (clindex+1)%movList.length;
    }else{
      secClindex = (clindex+2)%movList.length;
    }
    for (int i=0; i<distList.length; i++) {
      if (i!=me && i!= clindex) {
        if (secClosest>distList[i]) {
          secClosest = distList[i];
          secClindex = i;
        }
      }
    }
    col2 = secClosest;
    float thirClosest = distList[(me+1)%movList.length];
    int thirClindex;
    if(clindex+1!=me && me!=secClindex){
      thirClindex = (clindex+1)%movList.length;
    }else{
      if(clindex+2!=me && me!=secClindex){
      thirClindex = (clindex+2)%movList.length;
      }else{
      thirClindex = (clindex+3)%movList.length;
      }
    }
    for (int i=0; i<distList.length; i++) {
      if (i!=me && i!= clindex && i!= secClindex) {
        if (thirClosest>distList[i]) {
          thirClosest = distList[i];
          thirClindex = i;
        }
      }
    }
    return new Triplet(clindex, secClindex, thirClindex);
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
  void update(Mover[] who) {
    //if multiplied with the identity, move away from it
    PVector temp;
    temp = new PVector(who[0].pos.x-who[1].pos.x, who[0].pos.y-who[1].pos.y);
    temp.normalize();
//    temp.(5.0);
    vel.set(temp);
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
      changePix((int)pos.x, (int)pos.y);
    }
  }
}

class Triplet {
  int a;
  int b;
  int c;
  Triplet(int a_, int b_, int c_){
    a = a_;
    b = b_;
    c = c_;
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

void changePix(int x, int y){
  if(pix[x][y] == false){
    stroke(0);
    point(x, y);
    pix[x][y] = true;
  }else{
    stroke(255);
    point(x, y);
    pix[x][y] = false;
  }
}

//void mouseClicked(){
//  save("img.tif");
//}

