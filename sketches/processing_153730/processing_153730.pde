
ArrayList<Node> nodes;
int startingNodes = 10;
int linesPerRedraw;
int maxNodes = 100;
int currentLine;
float insertionDistance = 0;
int insertionX = 0;
int insertionY = 0;
boolean drawHorizontal = true;
boolean nodeColours = false;

void setup() {
  size(500, 500);
  linesPerRedraw = height;
  colorMode(HSB, 360, 100, 100);

  randomSeed(hour() + minute() + second() + millis());

  nodes = new ArrayList<Node>();

  for (int i=0; i<startingNodes; i++) {
    nodes.add(new Node(random(width), random(height)));
  };


  currentLine = 0;
  background(360);
}

void draw() {
  Node currentNode = closestNode(0, 0);
  float currentHue = currentNode.hue;

  stroke(0);
  if (drawHorizontal) {
    if (nodeColours) {
      for (int i=0; i<linesPerRedraw; i++) {
        if (currentLine < height) {
          for (int j=0; j<width; j++) {
            currentNode = closestNode(j, currentLine);
            if (currentNode.hue != currentHue) {
              stroke(0);
              point(j, currentLine);
              currentHue = currentNode.hue;
            } else {
              stroke(currentHue, 100, 100, 64);
              point(j, currentLine);
            }
          }
          currentLine++;
        }
      }
      if (currentLine >= height) {
        drawHorizontal = !drawHorizontal;
        currentLine = 0;
      }
    } else {
      drawHorizontal = !drawHorizontal;
    }
  } else {
    for (int i=0; i<linesPerRedraw; i++) {
      if (currentLine < width) {
        for (int j=0; j<height; j++) {
          currentNode = closestNode(currentLine, j);
          float currentDistance = dist(currentLine, j, currentNode.x, currentNode.y);
          if (currentDistance > insertionDistance) {
            insertionDistance = currentDistance;
            insertionX = currentLine;
            insertionY = j;
          }
          if (nodeColours) {
            if (currentNode.hue != currentHue) {
              stroke(0);
              point(currentLine, j);
              currentHue = currentNode.hue;
            } else {
              stroke(currentHue, 100, 100, 64);
              point(currentLine, j);
            }
          }
        }
        currentLine++;
      }
    }
    if (currentLine >= width) { 
      drawHorizontal = !drawHorizontal;
      if (nodes.size() < maxNodes) {
        nodes.add(new Node(insertionX, insertionY));
      } else {
        nodeColours = true;
        linesPerRedraw = 10;
      }
      insertionDistance = 0;
      currentLine = 0;
    }
  }
  for (int j=0; j<nodes.size (); j++) {
    nodes.get(j).display();
  }
}

Node closestNode(float x_, float y_) {
  Node bestNode = nodes.get(0);
  float bestDistance = dist(x_, y_, bestNode.x, bestNode.y);

  for (int i=1; i<nodes.size (); i++) {
    Node otherNode = nodes.get(i);
    float otherDistance = dist(x_, y_, otherNode.x, otherNode.y);

    if (otherDistance < bestDistance) {
      bestNode = otherNode;
      bestDistance = otherDistance;
    }
  }

  return bestNode;
}

void mouseReleased() {
  nodes.add(new Node(mouseX, mouseY));
  println(nodes.size());
}

class Node {
  float x;
  float y;
  float hue;
  
  Node(float x_, float y_) {
    x = x_;
    y = y_;
    hue = random(360);
    background(360);
  }
  
  void display() {
    noStroke();
    fill(0);
    ellipse(x,y,3,3);
  }
}


