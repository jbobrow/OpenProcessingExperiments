
int count;
int branchSize;
int childNum;
float distance;
float mesPosY;

Node rootNode;

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
  
  count = 0;
  branchSize= 20;
  distance = 300;
  childNum = 6;  


  
}

void draw() {

  randomSeed(minute());
  //randomSeed(millis());
  rootNode = new Node(0);
  setupTree(rootNode, 5);
  
  
  randomSeed(10);
  
  mesPosY = 100;

  background( 140, 96, 255, 255);

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

  int childNum = random(num)+1;

  for(int i=0; i<childNum; i++ ) {
  
    Node tmpNode = new Node(0);
    node.childList.add(tmpNode);
  
    if (childNum >= 1) {
      setupTree(node.childList.get(i), num-1);
    } else {
      tmpNode.value = (int)random(10);
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
  
  for(int i=0; i<node.childList.size(); i++) {
  
    Node childNode = node.childList.get(i);
   
    if (dir == 0) {
        float rectWidth = w * calcTreeSize(childNode) / totalSize;
        drawTreeMap(childNode, x+movePos, y, rectWidth, h, level+1, dir^1);
        
        if (childNode.childList.size() == 0) {
          fill(random(255), 128, 255);
        } else {
          noFill();
        }
          stroke(128,255,0,255);
          strokeWeight(16>>level);
        rect(x+movePos, y, rectWidth+x+movePos, y+h);
        fill(0,0,255,255);
        text(calcTreeSize(childNode), x+movePos, y+10);
    } else {
        float rectHeight = h * calcTreeSize(childNode) / totalSize;
        drawTreeMap(childNode, x, y+movePos, w, rectHeight, level+1, dir^1);
        
        if (childNode.childList.size() == 0) {
          fill(random(255), 128, 255);
        } else {
          noFill();
        }
          stroke(128,255,0,255);
          strokeWeight(16>>level);
        rect(x, y+movePos, w, y+movePos+rectHeight);
        fill(0,0,255,255);
        text(calcTreeSize(childNode), x, y+10+movePos);
    }
       
   
    if (dir == 0) {
        movePos += rectWidth;
    } else {
        movePos += rectHeight;
    }
  
  }
  

}

/*
void drawTree(float centerX, float centerY, float nodeSize, float distance, int num, int level, float angle, float angleWidth) {

  for(int i=0; i<num; i++) {
  
    float tmpAngle = angle - angleWidth/2 + (angleWidth * (float)i / (float)num) ;  
    float posX = centerX + ( (distance/4 + random(distance/2)) * cos( tmpAngle ) );
    float posY = centerY + ( (distance/4 + random(distance/2)) * sin( tmpAngle ) );
  
    stroke(255, 64, 128,160);
    strokeWeight(nodeSize);
    line(centerX, centerY, posX, posY);

    if (level >= 1) {
      drawTree(posX, posY, nodeSize/4+random(nodeSize/4), (distance/4 + random(distance/2)), random(num-1), level-1, tmpAngle , angleWidth/2);
    }
    
    noStroke();
    ellipse(posX, posY, 2, 2);
  }
    
}
*/
