
//var declarations
float baseX;  //base vals only used for initial "trunk"
float baseY;
float baseLineLength;

float[][] nodeX;  // these arrays hold x and y vals and the current line length for branch coords
float[][] nodeY;  
float[][] lineLength;

Node[][] tree;  //array of Nodes with the branchings divided up into levels
Node[] treeDisplay;  //same array, but just arranged sequentially for drawing one piece per frame

float bgFill;   //these are just for holding fill and stroke colors
float bgAlpha;
float objRed;
float objGreen;
float objBlue;
float leafGreen;
float objAlpha;
float leafAlpha;

int lineWidth;   //not using in this build, got a weird formula below instead


int levels;  //defines how many "levels" of forks will exist

int[] forkHolder;  //array for holding the number of forks generated so far in the current level, needed to properly populate x and y coords for each branch
int[] currentForks;  //used for controlling the "j" for loop in setup
int tempHolder;  //control variable, another one needed to populate arrays correctly

int count;  //used in draw() to draw the tree over a series of frames

float radius;  //not used in this build, leaf radius defined in the leaves() function of the Node class instead

int maxForks;  //used to set the size of the initial arrays for x, y, lineLength, and Nodes

int drawCounter;  //control variable to create a 1-D array of nodes that can be drawn sequentially in draw()

//setup
void setup() {
  size(500,400);
  smooth();
  bgFill = 255;
  objRed = 150;
  objGreen = 110;
  objBlue = 75;
  leafGreen = 75;
  objAlpha = 255;
  leafAlpha = 255;
  baseX = width/2;
  baseY = 0.9*height;
  baseLineLength = 100;
  count = 0;

  levels = int(random(7,9));  //arbitrary range here, it's the range I found to make most realistic looking trees
  
  lineWidth = 2*levels+1;  //again, not really used in this build
  strokeWeight(lineWidth);
  
  maxForks = 0;
  for(int i = 0; i < levels+1; i++) {
    maxForks += pow(4, i+1);  //the 4 here is based on the max possible number of forks in an individual Node, defined in its constructor below
  }
  
//  println("maxForks: " + maxForks);

//all these arrays need memory set aside here apparently, got lots of "NullPointer" type errors early on
  currentForks = new int[levels+1];
  nodeX = new float[levels+1][maxForks];
  nodeY = new float[levels+1][maxForks];
  lineLength = new float[levels+1][maxForks];
  tree = new Node[levels+1][maxForks];
  forkHolder = new int[levels+1];
  
  tempHolder = 0;
  drawCounter = 0;

  for(int i = 0; i < levels; i++) {  //the outer loop causes it to generate info one level at a time
    if(i < 1) {
      currentForks[i] = 1;
    }
    else {
      currentForks[i] = forkHolder[i];
    }
    for(int j = 0; j < currentForks[i]; j++) {  //this loop generates the details for each fork within a specific level
    
      if(i == 0 && j == 0) {  //the initial run through the loop needs to set some initial data for the constructor of the first Node
        nodeX[i][j] = baseX + random(-0.1*baseLineLength,0.1*baseLineLength);
        nodeY[i][j] = baseY + random(-0.6*baseLineLength,-0.9*baseLineLength);
        lineLength[i][j] = sqrt((baseX-nodeX[i][j])*(baseX-nodeX[i][j])+(baseY-nodeY[i][j])*(baseY-nodeY[i][j]));
        tree[i][j] = new Node(nodeX[i][j],nodeY[i][j],lineLength[i][j]);
        tree[i][j].fork();
        for(int k = 0; k < tree[i][j].forksGet(); k++) {  //this loop structures the populating of the x and y arrays
          nodeX[i+1][k+currentForks[i]-1] = tree[i][j].xGet()[k];
          nodeY[i+1][k+currentForks[i]-1] = tree[i][j].yGet()[k];
          lineLength[i+1][k+currentForks[i]-1] = tree[i][j].lengthGet()[k];
          forkHolder[i+1] += 1;
          drawCounter += 1;
        }
//        println("first branch base X: " + nodeX[0][0]);
//        println("first branch base Y: " + nodeY[0][0]);
//        println("first branch first fork X: " + nodeX[1][0]);
//        println("first branch first fork Y: " + nodeY[1][0]);
//        println("first loop complete");
      }
      else {
        tree[i][j] = new Node(nodeX[i][j],nodeY[i][j],lineLength[i][j]);
        tree[i][j].fork();
        tempHolder = 0;
        for(int k = 0; k < tree[i][j].forksGet(); k++) {  //same as the k loop above, but used for all subsequent runs through the loop
          nodeX[i+1][k+forkHolder[i+1]] = tree[i][j].xGet()[k];
          nodeY[i+1][k+forkHolder[i+1]] = tree[i][j].yGet()[k];
          lineLength[i+1][k+forkHolder[i+1]] = tree[i][j].lengthGet()[k];
          tempHolder += 1;
          drawCounter += 1;
        }
        forkHolder[i+1] += tempHolder;

//        println("Node " + i + " " + j + " base X: " + nodeX[i][j]);
//        println("Node " + i + " " + j + " base Y: " + nodeY[i][j]);
//        println("currentForks: " + currentForks[i]);
      }
    }
  }
  
  //this part creates a new 1-D array using the already created Nodes so that the draw() function can cycle through them easily frame by frame
  treeDisplay = new Node[drawCounter];
  drawCounter = 0;
  for(int i = 0; i < levels; i++) {
    for(int j = 0; j < currentForks[i]; j++) {
      treeDisplay[drawCounter] = tree[i][j];
      drawCounter++;
    }
  }


  background(bgFill,bgFill,bgFill);
}

//draw
void draw() {
  //  println("levels:  " + levels);
  lineWidth = int(drawCounter/(count*30+400));  //this is a weird formula I came up with for making branches get thinner as it goes, it's a work in progress
  strokeWeight(lineWidth);
  stroke(objRed,objGreen,objBlue,objAlpha);
  
  if(count <1) {  //draws just the initial trunk
    line(baseX,baseY,nodeX[0][0],nodeY[0][0]);
  }
  
  if(count < drawCounter) {  //this part draws the rest of the tree
    strokeWeight(int(drawCounter/(count*30+400)));
    
    if(int(drawCounter/(count*30+400))<2) {  //leaves are only drawn once the branches are down to 1 pixel wide
      fill(0,leafGreen,0,leafAlpha);
      noStroke();
      treeDisplay[count].leaves();
    }
      stroke(objRed,objGreen,objBlue,objAlpha);  //this draws each branch
      treeDisplay[count].display();
  }
  
  count ++;
  
  
  if (count < 30){  //this darkens the branches in the later parts of the tree and decreases their alpha value
  objRed = objRed - 3.75;
  objGreen = objGreen - 2.5;
  objBlue = objBlue - 1.875;
  objAlpha = objAlpha - 1.875;
  }
  
  leafGreen = leafGreen + 0.03;  //darker leaves are drawn first, moving on to bright leaves at the end
  leafAlpha = leafAlpha - 0.05;  //decrease alpha for later leaves to allow the earlier drawn layers to create more interesting texture
  
//  println("count: "+count);
//  println("drawCounter: " + drawCounter);
}

class Node {  //node is a class that creates several (x,y) coordinates based on an initial (x,y), and has methods for drawing lines to them from the inital (x,y)
  float rootX;
  float rootY;
  int forks;
  float[] tipX;
  float[] tipY;
  float lineLength;
  int leafCounter;

  Node(float tempRootX,float tempRootY,float tempLineLength) {  //constructor
    rootX = tempRootX;
    rootY = tempRootY;
    lineLength = tempLineLength;
    forks = int(random(2,5));  //chose this arbitrarily, I liked this range best for realistic looking trees
    tipX = new float[forks];
    tipY = new float[forks];
    leafCounter = 6-forks;  //again arbitrary, allows tall branches to get more leaves and thins them on the sides
  }

  void fork() {  //creates some branchings from the current (x,y), formulas are hard to describe, but attempt to keep the branchings "treelike"
    for(int i = 0; i<forks;i++) {
      tipX[i] = rootX + int(random(-0.15*forks*lineLength,0.15*forks*lineLength))+int((rootX-(width/2))/10);
      tipY[i] = rootY - int(random(0.6*lineLength,0.9*lineLength))+int(abs((rootX-(width/2))/10));
    }
  }

  void display() {  //used in draw() to display lines to represent the forks
    for(int i = 0; i<forks;i++) {
      line(rootX,rootY,tipX[i],tipY[i]);
    }
  }

  void leaves() {  //also used in draw(), but draws leaves instead of branches
    for(int i = 0; i<forks;i++) {
      for(int j = 0; j<leafCounter;j++) {
        ellipse(tipX[i]+random(-0.2*lineLength,0.2*lineLength),tipY[i]+random(-0.2*lineLength,0.2*lineLength),int(random(1,3)),int(random(2,5)));
      }
    }
  }

  float[] xGet() {  //grabs the new x values it's created for the branches, used in setup() to populate the next level of Nodes
    float[] xVals = new float[forks];
    for(int i = 0; i<forks; i++) {
      xVals[i] = tipX[i];
    }
    return xVals;
  }
  float[] yGet() {  //similar to xGet(), but for y values
    float[] yVals = new float[forks];
    for(int i = 0; i<forks; i++) {
      yVals[i] = tipY[i];
    }
    return yVals;
  }
  float[] lengthGet() {  //again, used for populating next level of Nodes in setup()
    float[] lengthVals = new float[forks];
    for(int i = 0; i<forks; i++) {
      lengthVals[i] = sqrt((tipX[i]-rootX)*(tipX[i]-rootX)+(tipY[i]-rootY)*(tipY[i]-rootY));
    }
    return lengthVals;
  }
  int forksGet() {  //and another grabber for populating next level of Nodes
    int forkTotal = forks;
    return forkTotal;
  }
}


