

class Arm {
  PVector offset, topLink;
  int armSize;
  color col;
  int maxArmSize = 50;
  float sep, diam;
  Links[] links = new Links[maxArmSize];
        
  Arm(PVector offsetTemp, int armSizeTemp, color colTemp) {
    offset = offsetTemp.get();
    armSize = armSizeTemp;
    col = colTemp;
    
    topLink = new PVector(0,0,0);

    for(int i = 0; i < armSize; i+=1) {
      sep = (armSize + 5) - i;
      diam = ((armSize + 1) - i)/1.4;
      links[i] = new Links(offset,sep,diam,col);
    }
  }
  
  void update() {
    topLink.set(mouseX+offset.x,mouseY+offset.y,0);
    links[0].update(topLink);
    for(int i = 1; i < armSize; i+=1) {
      links[i].update(links[i-1].pos);
    }
  }

  void paint() {
    links[0].paint(topLink);
    for(int i = 1; i < armSize; i+=1) {
      links[i].paint(links[i-1].pos);
    }
  }
  
}  


