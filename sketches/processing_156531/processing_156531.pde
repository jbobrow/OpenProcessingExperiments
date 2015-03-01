
final int nodeAmount = 200;
Node[] nodeArray = new Node[nodeAmount];
float[][] distance;

void setup() {
  size(700,500);
  background(252);
  smooth(8);
  generateNodes(nodeAmount);
}

void draw() {
  fill(252,150);
  rect(0,0,width,height);
  
  evalDist();
  
  for(int i = 0; i < nodeAmount; i++) {
    
    Node temp = nodeArray[i];
    temp.update();
    temp.checkCollisions();
    noStroke();
//    fill(0,50);
//    ellipse(temp.getPosX(),temp.getPosY(),temp.getSize()*temp.getSpeed()*3,temp.getSize()*temp.getSpeed()*3);
    fill(0,180);
    ellipse(temp.getPosX(),temp.getPosY(),temp.getSize(),temp.getSize());
    
    for(int j = 0; j < nodeAmount; j++) {
      if(distance[i][j] <= 60 && i < j) {
        int transp = (int)(255-(255*distance[i][j]/60));
        stroke(0,transp);
        line(temp.getPosX(),temp.getPosY(),nodeArray[j].getPosX(),nodeArray[j].getPosY());
      }
    }
    
  }

}

void generateNodes(int nodeAmount) {
  for(int i = 0; i < nodeAmount; i++) {
    nodeArray[i] = new Node(4,1);
  }
}

void evalDist() {
  distance = new float[nodeAmount][nodeAmount];
  for(int i = 0; i < nodeAmount; i++) {
    for(int j = 0; j < nodeAmount; j++) {
      if(i < j) distance[i][j] = dist(nodeArray[i].getPosX(),nodeArray[i].getPosY(),nodeArray[j].getPosX(),nodeArray[j].getPosY());
    }
  }
  
}

class Node {
  
  private float posX;
  private float posY;
  private float xSpeed;
  private float ySpeed;
  private float circleSize;
  
  public Node(float size, float cap) {
    this.posX = random(0,width);
    this.posY = random(0,height);
    
    this.xSpeed = random(-cap, cap);
    this.ySpeed = random(-cap, cap);
    
    this.circleSize = size;
  }
  
  public void update() {
    this.posX += this.xSpeed;
    this.posY += this.ySpeed; 
  }
  
  void checkCollisions() {
    float r = this.circleSize/2;
    if ( (this.posX<r) || (this.posX>width-r)){
      this.xSpeed = -(this.xSpeed);
    } 
    if( (this.posY<r) || (this.posY>height-r)) {
      this.ySpeed = -(this.ySpeed); 
    }
  }
   
  public float getPosX() {
    return this.posX;
  }
  
  public float getPosY() {
    return this.posY;
  }
  
  public float getSize() {
    return this.circleSize;
  }
  
  public float getSpeed() {
    return abs(this.xSpeed)+abs(this.ySpeed);
  }
  
}

