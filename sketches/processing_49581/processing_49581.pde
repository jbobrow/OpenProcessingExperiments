
int num = 100;
int theSize = 450;
Mover[] theMovers = new Mover[num];
float incr = 0;
int count = 0;
void setup(){
  colorMode(HSB);
  size(450, 450);
//  background(255);
  background(0);
  fill(0, 0, 0, 10);
  stroke(255);
  for(int i=0; i<num; i++){
    theMovers[i] = new Mover(new PVector(random(theSize), random(theSize)), new PVector(random(1), random(1)), i);
//    theMovers[i] = new Mover(new PVector(theSize/2.0+20*cos(i*PI/((float)num)), theSize/2.0+20*sin(i*PI/((float)num))), new PVector(0, 0), i);
    theMovers[i].render();
  }
}

void draw(){
  incr += .05;
  rect(-1, -1, theSize+1, theSize+1);
  for(int i=0; i<num; i++){
    theMovers[i].update(theMovers);
    theMovers[i].render();
  }
}

class Mover{
  int me;
  PVector pos;
  PVector vel;
  Mover(PVector pos_, PVector vel_, int me_){
    me = me_;
    pos = pos_;
    vel = vel_;
  }
  void update(Mover[] movList){
    float[] distList = new float[movList.length];
    for(int i=0; i<movList.length; i++){
      distList[i] = getDistance(movList[i]);
    }
    float closest = distList[(me+1)%movList.length];
    int clindex = (me+1)%movList.length;
    for(int i=0; i<distList.length; i++){
      if(i!=me){
        if(closest>distList[i]){
          closest = distList[i];
          clindex = i;
        }
      }
    }
    float secClosest = distList[(me+1)%movList.length];
    int secClindex = (me+1)%movList.length;
    for(int i=0; i<distList.length; i++){
      if(i!=me && i!= clindex){
        if(secClosest>distList[i]){
          secClosest = distList[i];
          secClindex = i;
        }
      }
    }
    PVector temp = new PVector((movList[secClindex].pos.x+pos.x)-(pos.x+movList[clindex].pos.x), (movList[secClindex].pos.y+pos.y)-(pos.y+movList[clindex].pos.y));
    temp.normalize();
    temp.mult(.1);
    vel.normalize();
    vel.add(temp);
    vel.normalize();
    vel.mult(.4);
    pos.add(vel);
        if(pos.x < 0){
      pos.x += theSize;
    }
    if(pos.y < 0){
      pos.y += theSize;
    }
    if(pos.x > theSize){
      pos.x -= theSize;
    }
    if(pos.y > theSize){
      pos.y -= theSize;
    }
  }
  float getDistance(Mover mov){
   if(mov.pos.x-pos.x>theSize/2.0){
     if(mov.pos.y-pos.y>theSize/2.0){
       return(dist(mov.pos.x-theSize, mov.pos.y-theSize, pos.x, pos.y));
     }
     if(mov.pos.y-pos.y<-theSize/2.0){
       return(dist(mov.pos.x-theSize, mov.pos.y+theSize, pos.x, pos.y));
     }
     return(dist(mov.pos.x-theSize, mov.pos.y, pos.x, pos.y));
   }
   if(mov.pos.x-pos.x<-theSize/2.0){
     if(mov.pos.y-pos.y>theSize/2.0){
       return(dist(mov.pos.x+theSize, mov.pos.y-theSize, pos.x, pos.y));
     }
     if(mov.pos.y-pos.y<-theSize/2.0){
       return(dist(mov.pos.x+theSize, mov.pos.y+theSize, pos.x, pos.y));
     }
     return(dist(mov.pos.x+theSize, mov.pos.y, pos.x, pos.y));
   }
   return(dist(mov.pos.x, mov.pos.y, pos.x, pos.y));
  }
  void render(){
    fill(255*noise(pos.x, pos.y, incr), 255, 255);
    ellipse(pos.x, pos.y, 2, 2);
    fill(0, 0, 0, 10);
  }
}

