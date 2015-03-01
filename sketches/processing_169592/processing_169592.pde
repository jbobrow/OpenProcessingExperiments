
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");

final int amount = 10;
Node[] nodeArray = new Node[amount];
color[] cols = new color[amount-2];

void setup() {
  size(200,200,P2D);
  smooth(8);
  generateNodes();
  generateColors();
}

void draw() { 
  externals.context.clearRect(0,0,width,height);
  for(int i = 0; i < amount; i++) {
    Node temp = nodeArray[i];
    temp.update();
    temp.checkCollisions();
    noStroke();
    generateTriangles(i);
    noStroke();
    fill(0,120);
    ellipse(temp.getPosX(),temp.getPosY(),temp.getSize(),temp.getSize());
  }
  
  if(frameCount % 50 == 0) {
    reroll();
  }
}

void generateNodes() {
  for(int i = 0; i < amount; i++) {
    nodeArray[i] = new Node(0,.3);
  }
}

void reroll() {
  generateColors();
  generateNodes();
}

void generateTriangles(int i) {
  if(i < amount-2) {
    fill(cols[i],230);
    triangle(nodeArray[i].getPosX(),nodeArray[i].getPosY(),nodeArray[i+1].getPosX(),nodeArray[i+1].getPosY(),nodeArray[i+2].getPosX(),nodeArray[i+2].getPosY());
    stroke(0,50);
    line(nodeArray[i].getPosX(),nodeArray[i].getPosY(),nodeArray[i+1].getPosX(),nodeArray[i+1].getPosY());
    line(nodeArray[i+1].getPosX(),nodeArray[i+1].getPosY(),nodeArray[i+2].getPosX(),nodeArray[i+2].getPosY());
    line(nodeArray[i+2].getPosX(),nodeArray[i+2].getPosY(),nodeArray[i].getPosX(),nodeArray[i].getPosY());
  }
}

void generateColors() {
  for(int i = 0; i < amount-2; i++) {
    cols[i] = color((int)random(20,70),(int)random(40,100),(int)random(120,255));
  }
}
public class Node {
  
  private float posX;
  private float posY;
  private float initX;
  private float initY;
  private float xSpeed;
  private float ySpeed;
  private float circleSize;
  
  public Node(float size, float cap) {
    this.posX = random(20,width-20);
    this.initX = this.posX;
    this.posY = random(20,height-20);
    this.initY = this.posY;
    
    this.xSpeed = random(-cap, cap);
    if(this.xSpeed == 0) this.xSpeed = random(-cap, cap);
    this.ySpeed = random(-cap, cap);
    if(this.ySpeed == 0) this.ySpeed = random(-cap, cap);
    
    this.circleSize = size;
  }
  
  public void update() {
    this.posX += this.xSpeed;
    this.posY += this.ySpeed; 
  }
  
  void checkCollisions() {
    if ( (this.posX<this.initX-15) || (this.posX>this.initX+15)){
      this.xSpeed = -(this.xSpeed);
    } 
    if( (this.posY<this.initY-15) || (this.posY>this.initY+15)) {
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
  
//  public float getSpeed() {
//    return abs(this.xSpeed)+abs(this.ySpeed);
//  }
  
}


