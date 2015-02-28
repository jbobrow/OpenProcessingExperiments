
class cir{
  float loc;
  float opt;
  float target;
  float mutRate;
  float mutRange;
  
  public cir(float l, float t, float mRate, float mRange){
    loc = l;
    target = t;
    mutRate = mRate;
    mutRange = mRange;
    this.getOpt();
  }
  
  public cir(cir m){
    loc = m.loc;
    target = m.target;
    mutRange = m.mutRange;
    mutRate = m.mutRate;
    this.getOpt();
  }
  
  public void getOpt(){
    opt = 100 - abs(target - loc);
  }
  
  public void set(cir m){
    loc = m.loc;
    target = m.target;
    mutRange = m.mutRange;
    mutRate = m.mutRate;
    this.getOpt();
  }
  
  public cir reproduce(cir m){
    float newLoc = (loc + m.loc) / 2;
    if(random(100) <= mutRate){
      newLoc += random(0 - mutRange / 2, mutRange / 2);
    }
    cir baby = new cir(newLoc, target, mutRate, mutRange);
    return baby;
  }
  
  public void draw(){
    noStroke();
    fill(opt * (255 / 100), 0, 0);
    ellipse(loc, 50, opt / 10, opt / 10);
  }
  
  
  
  public cir getParent(cir[] cirs, int currloc){
    
    int numCirs = cirs.length;
    
    float all = 0;
    
    for (int i = 0; i < numCirs; i++){
      all += cirs[i].opt;
    }
    
    float r = random(all);
    for (int j = 0; j < numCirs; j++){
      float curT = 0;
      for (int k = 0; k <= j; k++){
        curT += cirs[k].opt;
        
        if(r <= curT){
          text("parent = cir " + j,10, (currloc + 1) * 10);
          return cirs[j];
        }
      }
    }
  
  return null;
  }
  
} 

float target = 100;
float mutRate = 30;
float mutRange = 40;
float numCirs = 3;
cir[] cirs = new cir[int(numCirs)];
cir gP = new cir(0,0,0,0);

void setup(){
  size(200, 100);
  background(255);
  frameRate(10);
  
  for (int i = 0; i < numCirs; i++){
    cirs[i] = new cir(random(100), target, mutRate, mutRange);
    cirs[i].draw();
  }
}

void draw(){
  background(255);
  cir[] nextGen = new cir[int(numCirs)];
  
  for (int m = 0; m < numCirs; m++){
    cir parent1 = new cir(100, target, mutRate, mutRange);
    cir parent2 = new cir(100, target, mutRate, mutRange);
    
    parent1.set(gP.getParent(cirs,m));
    parent2.set(gP.getParent(cirs, m + 6));
    
    nextGen[m] = new cir(parent1.reproduce(parent2));
  }
  
  
  for (int j = 0; j < numCirs; j++){
    cirs[j].set(nextGen[j]);
    cirs[j].draw();
  }
}



/*cir getParent(){
  float all = 0;
  for (int i = 0; i < numCirs; i++){
    all += cirs[i].opt;
  }
  float r = random(all);
  for (int j = 0; j < numCirs; j++){
    float curT = 0;
    for (int k = 0; k < j; k++){
      curT += cirs[k].opt;
    }
    if (r <= curT){
      return cirs[j];
    }
  }
}*/



