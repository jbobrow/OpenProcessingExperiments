
ArrayList branches = new ArrayList();

void setup(){
  size(600,700);
  smooth();
  
  PVector tempPos = new PVector(width/2, height);
  PVector tempDir = new PVector((PI * 1.5) + random(PI/8), 200 - random(50));
  Branch tempBranch = new Branch(tempPos, tempDir, 4, 0);
  branches.add(tempBranch);

  tempPos = new PVector(width/2, height);
  tempDir = new PVector((PI * 1.5) - random(PI/8), 200 - random(50));
  tempBranch = new Branch(tempPos, tempDir, 4, 0);
  branches.add(tempBranch);  
}


void draw(){
  background(255);
  for(int i = 0; i < branches.size(); i++){
    Branch tempBranch = (Branch) branches.get(i);
    tempBranch.draw();
  }  
}

void keyPressed(){
  if(key == ' '){
    branches.clear();
 
    PVector tempPos = new PVector(width/2, height);
    PVector tempDir = new PVector((PI * 1.5) + random(PI/8), 200 - random(50));
    Branch tempBranch = new Branch(tempPos, tempDir, 4, 0);
    branches.add(tempBranch);
  
    tempPos = new PVector(width/2, height);
    tempDir = new PVector((PI * 1.5) - random(PI/8), 200 - random(50));
    tempBranch = new Branch(tempPos, tempDir, 4, 0);
    branches.add(tempBranch);  
  }
}

class Branch{

  PVector pos, dir, newPos, firstNewDir, secondNewDir;
  float strokeW;
  int gen;
  boolean duplicate = true;

  public Branch(PVector _pos, PVector _dir, float _strokeW, int _gen){
    pos = _pos;
    dir = _dir;
    strokeW = _strokeW;
    gen = _gen;
    newPos = new PVector((pos.x + (cos(dir.x) * dir.y)), (pos.y + (sin(dir.x) * dir.y)));
  }

  void draw(){
    stroke(75 - (gen/6*25), 40 + (gen/6*30), gen/6*25, 200);
    strokeWeight(strokeW);
    line(pos.x, pos.y, newPos.x, newPos.y);
    if(dir.y < 1){
      duplicate = false;
    }
    if(duplicate){
      growNewBranches();
      duplicate = false;
    }
  }

  void growNewBranches(){
    firstNewDir = new PVector(dir.x - random(PI/8), ((dir.y/4)*3)-random(dir.y/4));
    secondNewDir = new PVector(dir.x + random(PI/8), ((dir.y/4)*3)-random(dir.y/4));
    Branch firstBranch = new Branch(newPos, firstNewDir, (strokeW/4)*3, gen+1);
    Branch secondBranch = new Branch(newPos, secondNewDir, (strokeW/4)*3, gen+1);
    branches.add(firstBranch);
    branches.add(secondBranch);
  }

}


