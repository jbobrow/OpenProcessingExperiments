
class Node{
  int index;
  float x,y;
  float xSeedInitial,ySeedInitial;
  float xSeedOffset,ySeedOffset;
  float xSeed,ySeed;
  float xRange,yRange;
  Node(int index,float xSeedInitial,float ySeedInitial,float xRange,float yRange){
    this.index = index;
    this.xSeedInitial = xSeedInitial;
    this.ySeedInitial = ySeedInitial;
    this.xRange = xRange;
    this.yRange = yRange;
  }
  void update(){
    xSeedOffset = lerp(xSeedOffset,float(mouseX)/500,0.1);
    ySeedOffset = lerp(ySeedOffset,float(mouseY)/500,0.1);
    xSeed = xSeedInitial+xSeedOffset;
    ySeed = ySeedInitial+ySeedOffset;
    x = noise(xSeed)*xRange;
    y = noise(ySeed)*yRange;
  }
  void display(){
    strokeWeight(1);
    stroke(0);
    point(x, y);
    fill(0);
    textFont(font);
    text(index, x+3, y);
  }
}

