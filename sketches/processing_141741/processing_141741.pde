
int count;
int branchSize;
int maxChildNum;
float distance;
float mesPosY;

Node rootNode;

int prevTime;
int nowTime;

class Node {

  int value;
  int group;
  ArrayList<Node> childList;
  
  Node(int _value) {
  
    value = _value;
    group = 0;
    childList = new ArrayList<Node>();
  
  }

}

void setup() {

  size( 750, 750 );
  frameRate(30);
  colorMode(HSB);
  autoBackground(false);
  
  count = 0;
  branchSize= 20;
  distance = 300;
  maxChildNum = 7;  

  prevTime = 10000;
  
}

void draw() {


  nowTime = second();

  randomSeed(nowTime);
  
  if (prevTime != nowTime) {

      //randomSeed(millis());
      rootNode = new Node(0);
      setupTree(rootNode, 6);
      
      randomSeed(10);
      
      mesPosY = 100;
    
      //fill(140, 96, 255, 64);
      //rect(0, 0, width, height);
      //background( 140, 96, 255, 64);
  }
  prevTime = nowTime;
  
  float posX = width / 2;
  float posY = height * 3 / 4;


  drawTreeMap(rootNode, 10, 10, width-20, height-20, 0, 0);
  
  fill( 255, 224, 64 );
  //drawTree( posX, posY, branchSize/2, mouseY/2, mouseX/50, childNum, -PI/2, PI);
  
  stroke(255,255,255);
  textSize(20);
  
  
  //drawTree(rootNode, 0); 
  

  float treeSize = calcTreeSize(rootNode);
  text("tree size: " + treeSize , 10, 30);

  count++;
  
}

Node setupTree(Node& node, int num) {

  int childNum = random(1, num);

  for(int i=0; i<childNum; i++ ) {
  
    Node tmpNode = new Node(0);
    node.childList.add(tmpNode);
  
    if (childNum >= 1) {
      setupTree(node.childList.get(i), num-1);
    } else {
      tmpNode.value = (int)random(9)+1;
    }
  
  }

  return node;
}

float calcTreeSize(Node node) {

  float sum = 0;
  
  sum += node.value;

  for(int i=0; i<node.childList.size(); i++ ) {

    Node childNode = node.childList.get(i);

    sum += calcTreeSize(childNode);

  }

  return sum;
}


void drawTree(Node node, int level) {

  text("level: " + level + " size: " + node.value, 10 + (40 * level), mesPosY);
  mesPosY += 30;
  
  for(int i=0; i<node.childList.size(); i++) {
 
    Node childNode = node.childList.get(i);
    
    drawTree(childNode, level+1);
    
  }

}

void drawTreeMap(Node node, float x, float y, float w, float h, int level, int dir) {

  float totalSize = calcTreeSize(node);
  float movePos = 0;

    if (node.value > 0) {
      
        fill(random(255), 64, 255, 48);
        stroke(0,0,0,255);
        strokeWeight(1);
        rect(x, y, w, h);
        
        fill(0,0,255,255);
        text(calcTreeSize(node), x, y+10);
      
    } else {
    
      if (node.childList.size() >= 2) {
        stroke(0,0,0);
        strokeWeight(12-level*2);
        noFill();
        rect(x, y, w, h);
      }
        
    }
  
  for(int i=0; i<node.childList.size(); i++) {
  
    Node childNode = node.childList.get(i);
    
    if (dir == 0) {

        float rectWidth = ceil(w * calcTreeSize(childNode) / totalSize);
        
        drawTreeMap(childNode, x+movePos, y, rectWidth, h, level+1, dir^1);        
        
        movePos += rectWidth;

    } else {
        float rectHeight = ceil(h * calcTreeSize(childNode) / totalSize);
        
        drawTreeMap(childNode, x, y+movePos, w, rectHeight, level+1, dir^1);
        
        movePos += rectHeight;

    }
   
  }
  

}
