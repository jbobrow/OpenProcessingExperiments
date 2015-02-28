
class worm{
  //Variables
  PVector loc, vel, acc;//Standard particle variables
  float speed, MAXspeed;
  int trail, WW, WH;//Length of trail, world size
  PVector[] tail;//Locations of tail segments
  color WormCol = color(0,0,0);//Black unless defined.
  private float counter1 = 0, rot;//Used in my sine squiggle algorithm
  
  //Constructor
  public worm(float _speed, float _MAXspeed, int _trail, int _worldwidth, int _worldheight, color _WormCol){
    speed = _speed;
    MAXspeed = _MAXspeed;
    trail = _trail;
    WW = _worldwidth;
    WH = _worldheight;
    WormCol = _WormCol;
    loc = new PVector(random(_worldwidth), random(_worldheight));
    tail = new PVector[trail];
    for (int i = 0; i < trail; i++){
      tail[i] = new PVector(loc.x, loc.y);
    }
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  public void TailStep(){
    //Moves the locations of the tail segments
    tail[trail - 1].set(loc.x, loc.y, loc.z);
    for (int t = 0; t < trail-1; t++){
      tail[t].set(tail[t+1].x,tail[t+1].y,0);
    }
  }
  
  public void check(){
    //Makes sure the worm is still inside the world.
    if (loc.x > WW){
      loc.set(0,loc.y,0);
    }
    if (loc.y > WH){
      loc.set(loc.x,0,0);
    }
    if (loc.y < 0){
      loc.set(loc.x,WH,0);
    }
    if (loc.x < 0){
      loc.set(WW,loc.y,0);
    }
  }
  
  public void draw(){
    //Draws each worm segment. I got this idea from
    for (int z = 0; z < trail; z++){
      noStroke();
      fill(WormCol, 100 + z * (255 / trail / 5));
      ellipse(tail[z].x, tail[z].y, z,z);
    }
  }
  
  public void drawR(){
    for (int z = 0; z < trail; z++){
      noStroke();
      fill(random(255),random(255),random(255), 100 + z * (255 / trail / 5));
      ellipse(tail[z].x, tail[z].y, z,z);
    }
  }
  
  
  //movement algorithms
  public void wander(){
    acc.set(acc.x + random(-2, 2), acc.y + random(-2, 2), 0);
    acc.normalize();
    acc.mult(speed);
    vel.add(acc);
    vel.limit(MAXspeed);
    
    PVector newLoc = new PVector(loc.x, loc.y);
    newLoc.add(vel);
    loc.set(newLoc.x, newLoc.y, 0);    
    check();
  }
  
  public void esquiggle(int SW){
    counter1 = counter1 + 1;
    rot = sin(counter1) * SW;
    PVector z = new PVector(acc.x * cos(rot) - acc.y * sin(rot), acc.x * sin(rot) + acc.y * cos(rot), 0);
    acc.add(z);
  }
  
  public PVector r(float range){
    PVector r = new PVector(random(range / -2, range / 2), random(range / -2, range / 2));
    return r;
  }
  public void straight(PVector dir){
    acc.set(dir);
    acc.add(r(80));
    acc.normalize();
    acc.mult(speed);
    vel.add(acc);
    vel.limit(MAXspeed);
    loc.add(vel);
    
    check();
  }
  
  public void seek(PVector target){
    acc.set(target.x - loc.x, target.y - loc.y, 0);
    acc.normalize();
    acc.add(r(3));
    acc.normalize();
    acc.mult(speed);
    checkDist(target);
    vel.add(acc);
    vel.limit(MAXspeed);
    loc.add(vel);
    check();
  }
  
  public void flee(PVector target){
    acc.set(loc.x - target.x, loc.x - target.x, 0);
    acc.normalize();
    acc.mult(speed);
    checkDist(target);
    vel.add(acc);
    vel.limit(MAXspeed);
    loc.add(vel);
    check();
  }
  
  public void checkDist(PVector target){
    PVector dis = new PVector(target.x - loc.x, target.y - loc.y);
    if (dis.x > (WW / 2)){
      acc.set(acc.x * -1, acc.y, 0);
    }
    if (dis.y > (WH / 2)){
      acc.set(acc.x, acc.y * -1, 0);
    }
  }
  public void frict(float frict){
    vel.div(frict);
  }
  
  public void arrive(PVector target, float closeDist){
    acc.set(target.x - loc.x, target.y - loc.y, 0);
    if(acc.mag() > closeDist){
      seek(target);
    } 
  }
  
  public PVector FlockTarg(worm[] flock){
    PVector Avgloc;
    float xa = 0, ya  = 0;
    
    for(int i = 0; i < flock.length; i++){
      xa += flock[i].loc.x;
      ya += flock[i].loc.y;
    }
    xa = xa/flock.length;
    ya = ya/flock.length;
    Avgloc = new PVector(xa, ya);
    return Avgloc;
  }
}


