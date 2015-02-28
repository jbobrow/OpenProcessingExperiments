
import processing.pdf.*;

/*
Snowflake
A fractal branching program by mkanemoto
Processing 2.0b7, Feb 22, 2013

The program will start with a point in the center of a square drawing. I call the points "nodes".
Using a random function, the program will load an array of equally spaced points around the
starting node. I call these "branches". Each parent node will then have children nodes around it.

This first loads an array, then has some drawing functions.

The array is filled in by moving from the start up to the very end child at the maximum level.
The program then loads nodes around the point before moving down one level, adding a point, and
moving back up. The program keeps going this way until it moves all the way back to the start.

There are many ways to change the program to get different results:
debug = will add lots of text to let you see what is happening. I recommend numberBranches = 3.
randomized = will randomize the angle and placement of nodes so with high branch numbers things get scattered.
randomNumberNodes = will pick a random number of children branches for each node. Otherwise uses the same.
randomRadius = will randomize the length of the radius from a parent node.

*/

boolean debug = false;
boolean randomized = false;
boolean randomNumberNodes = false;
boolean randomRadius = false;

// Variables for how complex a drawing
int numberBranches = 5;
int minNodes = 3; //this will always set an odd number
int maxNodes = 8; //this will always set an odd number

// Declarations
int pagePixels;
int arrayLength = 5000;
int i;
int j;
String filename;

// randomizing limits
float randLow = .95;
float randHigh = 1.05;

float randRadiusLow = .80;
float randRadiusHigh = 1.25;

// node array variables
String branchAction;
boolean maxLevelFlag = false;
boolean maxNodeFlag = false;
boolean reuseFlag = false;

// node calculation variables
int nodes;
int parentNode;
float x;
float y;
float radius;  //4 for 5 branches
float angle = 0.0;

// drawing varables
float drawMod;

PGraphics pg;

// Declare and construct objects
//---------------Branch-----------------
  // Creates the array
  Branch branch[] = new Branch[numberBranches] ;

//---------------Node-----------------
// Creates the array
  Node node[] = new Node[arrayLength] ;


// Setup
// -----
void setup() {
// for PDF uncomment
//  pagePixels = numberBranches * 150;
  pagePixels = 300;
  radius = pagePixels / 4;
  
// for PDF uncomment
//  filename = year()+"-"+month()+"-"+day()+" "+hour()+"-"+minute()+"-"+second()+" Snowflake.pdf";
//  size(pagePixels, pagePixels, PDF, filename);
//  pg = createGraphics(pagePixels, pagePixels, PDF, filename);

  size(pagePixels, pagePixels);
  pg = createGraphics(pagePixels, pagePixels);


  pg.beginDraw();
  smooth();
  background(255,255,255,0);
  pg.endDraw();
}


// Draw
void draw() {

  // All of these funtions are quite extensive, read them below.
  buildArray();

// Comment this next one out for PDF
  background(255,255,255,255);

  drawAllChildToChild();
  drawChildInRing();
  drawNodeOrbits();
  drawParentToChild();
  drawNodeEllipse();
 
  println("DONE");


// for PDF uncomment
//  exit();

} // ************** Draw END **************




void keyPressed() {
  if (key == 'q') {
    exit();
  }

  if (key == 's') {
    saveDrawing();
  }
}
// KeyPressed END


void saveDrawing() {
println("Saving...");
  filename = year()+"-"+month()+"-"+day()+" "+hour()+"-"+minute()+"-"+second()+"- Snowflake.pdf";
println("Saved.");
}


  
//-------------------
// Building the Array
//-------------------

void buildArray() {
println("Branches " + numberBranches);

//---------------Branch-----------------
  // Creates the objects and assigns them to the array
  for (i = 0; i < numberBranches; i++) {
    branch[i] = new Branch();
  }

  // Sets the first node as branch[0]
  branch[0].Branch(int((2*round(random(minNodes,maxNodes)/2))+1), radius); //int NodeNum; float radius;

    if(debug == true){
      println("Branch 0 Node #: " + branch[0].getNodeNum() );
      println("Branch 0 radius: " + branch[0].getRadius() );
    }


  // Reset arrayLength to the first node
  arrayLength = 1;

  // Sets the values for the array
  for (i = 1; i < numberBranches; i++) {
    // designed to always produce an odd number
//    branch[i].Branch(int((2*round(random(minNodes,maxNodes)/2))+1), branch[i-1].getRadius()/2); //int NodeNum; float radius;
    branch[i].Branch(int((2*round(random(minNodes,maxNodes)/2))+1), branch[i-1].getRadius()/2.075); //int NodeNum; float radius;

    if(debug == true){
      println("Branch " + i + " Node #: " + branch[i].getNodeNum() );
      println("Branch " + i + " radius: " + branch[i].getRadius() );
    }

  }

  arrayLength = node.length;

  if(debug == true){
    println("arrayLength #: " + arrayLength);
  }

//---------------Node-----------------
  // Creates the objects and assigns them to the array
  for (i = 0; i < arrayLength; i++) {
    node[i] = new Node();
  }

  if(debug == true){
    println("Node Array Length #: " + node.length);
    println("");
  }
  
// Clear out array
for (i = 0; i < arrayLength; i++) {
  //int int branchPosition, int nodePosition, int parentReference, int nodeNumber, float nodeRadius, float theta, float x, float y, String action
  node[i].Node(0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, "empty"); 
  } 

if (debug == true) {
  println("START");
  println("");
  println("node, int branchPosition, int nodePosition, int parentReference, int nodeNumber, float nodeRadius, float theta, float x, float y, String action"); 
}


if (randomNumberNodes == false) {
// First Node
  //int int branchPosition, int nodePosition, int parentReference, int nodeNumber, float nodeRadius, float theta, float x, float y, String action
  node[0].Node(0, 0, 0, branch[0].getNodeNum(), radius, 0.0, pagePixels/2, pagePixels/2, "up"); 
} else {
// First Node
  //int int branchPosition, int nodePosition, int parentReference, int nodeNumber, float nodeRadius, float theta, float x, float y, String action
  node[0].Node(0, 0, 0, int((2*round(random(minNodes,maxNodes)/2))+1), radius, 0.0, pagePixels/2, pagePixels/2, "up"); 
}

node[0].setNodePosition(node[0].getNodeNumber());

if(debug == true){
  print("0, ");
  node[0].printNode();
}
    
// DETERMINE WHAT ACTIONS TO TAKE: add, up, down, reuse
//---------------------------------------
for (i = 1; i < arrayLength; i++) {

  // set boolean conditions ...this was for legability...
  //   maxLevelFlag = was the last node at the highest branch level?
  //   maxNodeFlag = was the last node at the highest node number (the last node)?
  //   reuseFlag = was the last node a reuse. Or, was it a node that exists already as we move back down the tree?

  if (node[i-1].getBranchPosition() == numberBranches - 1) {  // If max level
    maxLevelFlag = true;
  }  else {
    maxLevelFlag = false;
  }

  if (node[i-1].getNodePosition() == node[node[i-1].getParentReference()].getNodeNumber() ) {   // If max node from parent node
    maxNodeFlag = true;
  }  else {
    maxNodeFlag = false;
  }

  if (node[i-1].getAction() == "reuse") {   // If reuse
    reuseFlag = true;
  }  else {
    reuseFlag = false;
  }

  // Set actions based on boolean conditions
  if (maxLevelFlag == false && maxNodeFlag == false && reuseFlag == false) {
      parentNode = i - 1;
      branchAction = "up";
  }
  if (maxLevelFlag == false && maxNodeFlag == true && reuseFlag == false) {
      parentNode = i - 1;
      branchAction = "up";
  }
  if (maxLevelFlag == false && maxNodeFlag == true && reuseFlag == true) {
    if (node[node[i-1].getParentReference()].getNodePosition() < node[node[node[i-1].getParentReference()].getParentReference()].getNodeNumber()) {  // if parent is not max node
        parentNode = node[node[i-1].getParentReference()].getParentReference();
        branchAction = "down";
      } else {
        if (node[i-1].getBranchPosition() == 0) {  // if back to the start
          arrayLength = i - 1;
          println("arrayLength = " + arrayLength);

          i = node.length - 1;
          branchAction = "reuse";

        } else {
          parentNode = node[node[i-1].getParentReference()].getParentReference();
          branchAction = "reuse";
        }
      }
  }

  if (maxLevelFlag == true && maxNodeFlag == false && reuseFlag == false) {
    parentNode = node[i-1].getParentReference();
    branchAction = "add";
  }

  if (maxLevelFlag == true && maxNodeFlag == true) {
      if (node[node[i-1].getParentReference()].getNodePosition() == node[node[node[i-1].getParentReference()].getParentReference()].getNodeNumber()) {  // if parent is max node
        parentNode = node[node[i-1].getParentReference()].getParentReference();
        branchAction = "reuse";
      } else {
        parentNode = node[node[i-1].getParentReference()].getParentReference();
        branchAction = "down";
      }
  }

// ACTIONS: add, up, down, reuse
//---------------------------------------

// Add node at same branch level
  if (branchAction == "add") {

    // Set Parent Reference.
    node[i].setParentReference(parentNode);

    // Keep the parent node's branch level.
    node[i].setBranchPosition(node[i-1].getBranchPosition());

    // Add 1 to the node position of the previous node.
    node[i].setNodePosition(node[i-1].getNodePosition() + 1);

    //if Adding a node, NodeNumber is zero
    node[i].setNodeNumber(0);

    if (randomRadius == false) {
      node[i].setNodeRadius(branch[node[i].getBranchPosition()].getRadius());
    } else {
      node[i].setNodeRadius(random(randRadiusLow,randRadiusHigh)*branch[node[i].getBranchPosition()].getRadius());
    }
  
    // Set the angle by adding the Node's branch angle (2 PI / Number of nodes) to the previous node's angle.
    if (randomized == true) {
      node[i].setAngle(random(randLow,randHigh)*(node[node[i].getParentReference()].getAngle() + (node[i].getNodePosition()*(TWO_PI / node[node[i].getParentReference()].getNodeNumber() ))));
    }
    if (randomized == false) {
      node[i].setAngle((node[node[i].getParentReference()].getAngle() + (node[i].getNodePosition()*(TWO_PI / node[node[i].getParentReference()].getNodeNumber()) )));
    }

    // Calculate and set the x, y position of the node  

    if (randomized == true) {
      x = node[node[i].getParentReference()].getX() + sin(node[i].getAngle()) * random(randLow,randHigh)*node[node[i].getParentReference()].getNodeRadius();  
      y = node[node[i].getParentReference()].getY() + cos(node[i].getAngle()) * random(randLow,randHigh)*node[node[i].getParentReference()].getNodeRadius();  
    }

    if (randomized == false) {
      x = node[node[i].getParentReference()].getX() + sin(node[i].getAngle()) * node[node[i].getParentReference()].getNodeRadius();  
      y = node[node[i].getParentReference()].getY() + cos(node[i].getAngle()) * node[node[i].getParentReference()].getNodeRadius();  
    }


    node[i].setPosition(x, y);

    // Set action
    node[i].setAction("add");
  }



// Go up one branch level, add node to upper branch level
  if (branchAction == "up") {

    // Set Parent Reference.
    node[i].setParentReference(parentNode);

    // Go up one branch level. Add 1 to the former node's branch level.
    node[i].setBranchPosition(node[i-1].getBranchPosition() + 1);

    // When you go up a branch the node is always 1, the starting position.
    node[i].setNodePosition(1);


    //if Maximum branch level, NodeNumber is zero
    if(node[i].getBranchPosition() == numberBranches - 1) {
      node[i].setNodeNumber(0);
    } else {
      if (randomNumberNodes == false) {
        node[i].setNodeNumber(branch[node[i].getBranchPosition()].getNodeNum() );
      } else {
        node[i].setNodeNumber(int((2*round(random(minNodes,maxNodes)/2))+1) );
      }
    }


    if (randomRadius == false) {
      node[i].setNodeRadius(branch[node[i].getBranchPosition()].getRadius());
    } else {
      node[i].setNodeRadius(random(randRadiusLow,randRadiusHigh)*branch[node[i].getBranchPosition()].getRadius());
    }


    // Set the angle by adding the Node's branch angle (2 PI / Number of nodes) to the previous node's angle.
    if (randomized == true) {
      node[i].setAngle(random(randLow,1.01)*(node[i-1].getAngle() + (TWO_PI / node[node[i].getParentReference()].getNodeNumber() )));
    }
    if (randomized == false) {
      node[i].setAngle((node[i-1].getAngle() + (TWO_PI / node[node[i].getParentReference()].getNodeNumber() )));
    }


    // Calculate and set the x, y position of the node  
    if (randomized == true) {
      x = node[i-1].getX() + sin(node[i].getAngle()) * random(randLow,randHigh)*node[node[i].getParentReference()].getNodeRadius();  
      y = node[i-1].getY() + cos(node[i].getAngle()) * random(randLow,randHigh)*node[node[i].getParentReference()].getNodeRadius();  
    }

    if (randomized == false) {
      x = node[i-1].getX() + sin(node[i].getAngle()) * node[node[i].getParentReference()].getNodeRadius();  
      y = node[i-1].getY() + cos(node[i].getAngle()) * node[node[i].getParentReference()].getNodeRadius();  
    }

    node[i].setPosition(x, y);

    // Set action
    node[i].setAction("up");

    // Set parentNode to this node
    parentNode = i;  
  }

// Go down one branch level, add node from parent at lower branch level
  if (branchAction == "down") {

    // Set Parent Reference.
    node[i].setParentReference(parentNode);

    // Keep the parent node's branch level.
    node[i].setBranchPosition(node[node[i-1].getParentReference()].getBranchPosition());

    // Add 1 to the parent node's position.
    node[i].setNodePosition(node[node[i-1].getParentReference()].getNodePosition() + 1);


    if (randomNumberNodes == false) {
      node[i].setNodeNumber(branch[node[i].getBranchPosition()].getNodeNum() );
    } else {
      node[i].setNodeNumber(int((2*round(random(minNodes,maxNodes)/2))+1) );
    }

    if (randomRadius == false) {
      node[i].setNodeRadius(branch[node[i].getBranchPosition()].getRadius());
    } else {
      node[i].setNodeRadius(random(randRadiusLow,randRadiusHigh)*branch[node[i].getBranchPosition()].getRadius());
    }


    // Set the angle by adding the node's branch angle (2 PI / Number of nodes) to the parent's angle.
    if (randomized == true) {
      node[i].setAngle(random(.99,1.01)*(node[node[i-1].getParentReference()].getAngle() + (TWO_PI / node[node[i].getParentReference()].getNodeNumber() )));
    }
    if (randomized == false) {
      node[i].setAngle((node[node[i-1].getParentReference()].getAngle() + (TWO_PI / node[node[i].getParentReference()].getNodeNumber() )));
    }


    // Calculate and set the x, y position of the node  
    if (randomized == true) {
      x = node[parentNode].getX() + sin(node[i].getAngle()) * random(randLow,randHigh)*node[node[i].getParentReference()].getNodeRadius();  
      y = node[parentNode].getY() + cos(node[i].getAngle()) * random(randLow,randHigh)*node[node[i].getParentReference()].getNodeRadius();  
    }

    if (randomized == false) {
      x = node[parentNode].getX() + sin(node[i].getAngle()) * node[node[i].getParentReference()].getNodeRadius();  
      y = node[parentNode].getY() + cos(node[i].getAngle()) * node[node[i].getParentReference()].getNodeRadius();  
    }


    node[i].setPosition(x, y);  

    // Set action
    node[i].setAction("down");
  }

  // Go down one branch level, reuse parent at lower branch level
  if (branchAction == "reuse") {

    // Set Parent Reference.
    node[i].setParentReference(parentNode);

    // Keep the parent node's branch level.
    node[i].setBranchPosition(node[node[i-1].getParentReference()].getBranchPosition());

    // Keep the parent node position.
    node[i].setNodePosition(node[node[i-1].getParentReference()].getNodePosition());

    // Keep the parent node number.
    node[i].setNodeNumber(node[node[i-1].getParentReference()].getNodeNumber());

    // Keep the parent node radius.
    node[i].setNodeRadius(node[node[i-1].getParentReference()].getNodeRadius());

    // Keep the parent angle.
    node[i].setAngle(node[node[i-1].getParentReference()].getAngle());

    // Keep the parent x.
    x = node[node[i-1].getParentReference()].getX();

    // Keep the parent y.
    y = node[node[i-1].getParentReference()].getY();

    // Keep the parent postition.
    node[i].setPosition(x, y);

    // Set action
    node[i].setAction("reuse");

    // set parentNode to the reused node's parent to keep it moving down
    parentNode = node[i].getParentReference();
  }

  if (debug == true) {
    // print node information
    print(i + ", ");
    node[i].printNode();
  }
} 

// buildArray END
}


//-------------------
// Drawing Functions
//-------------------
void drawAllChildToChild() {

println("START: Draw line connecting all children together...");
// Draw line connecting all children together
for (i = 1; i < arrayLength; i++) {
  for (j = 2; j < arrayLength; j++) {

    if(node[i].getParentReference() == node[j].getParentReference() && i!= j) {
      drawMod = numberBranches-node[i].getBranchPosition()+1;

      if (randomized == true) {
        stroke(random(randLow,randHigh)*round(random(100,150)),
               random(randLow,randHigh)*round(random(100,150)),
               random(randLow,randHigh)*round(random(100,150)),
               random(randLow,randHigh)*round(random(200,255))*drawMod/numberBranches);
          strokeWeight(random(.75,1.5)*drawMod*.03);
      }

      if (randomized == false) {
        stroke(10 * drawMod/numberBranches,
               200 * drawMod/numberBranches,
               200 * drawMod/numberBranches,
               255 * drawMod/numberBranches);
        strokeWeight(drawMod*.05);
      }
  pg.beginDraw();
      line (node[i].getX(), node[i].getY(), node[j].getX(), node[j].getY());
  pg.endDraw();

    }
  }
}
println("END: Draw line connecting all children together.");
}



void drawChildInRing() {
println("START: Draw line connecting all children together in a ring...");
// Draw line connecting all children together in a ring



for (i = 1; i < arrayLength; i++) {
  for (j = 2; j < arrayLength; j++) {
    if( (node[i].getParentReference() == node[j].getParentReference() && node[i].getNodePosition() + 1 == node[j].getNodePosition())
         ||
        (node[i].getParentReference() == node[j].getParentReference() && (node[i].getNodePosition() == 1
           && node[j].getNodePosition() == node[node[j].getParentReference()].getNodeNumber()))
        )
       {
      drawMod = numberBranches-node[i].getBranchPosition()+1;

      if (randomized == true) {
        stroke(random(randLow,randHigh)*round(random(215,255))*drawMod/numberBranches,
               random(randLow,randHigh)*round(random(125,150))*drawMod/numberBranches,
               random(randLow,randHigh)*round(random(25,75))*drawMod/numberBranches,
               random(randLow,randHigh)*round(random(200,255))*drawMod/numberBranches);
        strokeWeight(random(.75,1.25)*drawMod*.0625);
      }

      if (randomized == false) {
        stroke(250 * drawMod/numberBranches,
               166 * drawMod/numberBranches,
               52 * drawMod/numberBranches,
               255 * drawMod/numberBranches);
        strokeWeight(drawMod*.0625);
      }
  pg.beginDraw();
      line (node[i].getX(), node[i].getY(), node[j].getX(), node[j].getY());
  pg.endDraw();
    }
  }
}

println("END: Draw line connecting all children together in a ring.");
}

void drawParentToChild() {
println("START: Draw line connecting parent node to child node...");
// Draw line connecting parent node to child node
for (i = 1; i < arrayLength; i++) {
  if(node[i].getAction() != "reuse") {
    drawMod = numberBranches-node[i].getBranchPosition()+1;

    if (randomized == true) {
      stroke(random(randLow,randHigh)*round(random(0,50)),
             random(randLow,randHigh)*round(random(0,150)),
             random(randLow,randHigh)*round(random(200,255)),
             random(randLow,randHigh)*round(random(200,255))*drawMod/numberBranches);  //blue
      strokeWeight(random(.75,1.5)*drawMod*.125);
    }

    if (randomized == false) {
      stroke(0,
             127 * drawMod/numberBranches,
             195 * drawMod/numberBranches,
             255 * drawMod/numberBranches);  //blue
      strokeWeight(drawMod*.125);
    }
  pg.beginDraw();
    line (node[i].getX(), node[i].getY(), node[node[i].getParentReference()].getX(), node[node[i].getParentReference()].getY());
  pg.endDraw();
  }
}
println("END: Draw line connecting parent node to child node.");
}


void drawNodeOrbits() {
println("START: Draw ellipse at each node with radius...");
// Draw ellipse at each node
for (i = 0; i < arrayLength; i++) {
      if(node[i].getAction() != "reuse") {
        drawMod = (numberBranches - node[i].getBranchPosition())*1.5;

        // Fill
        if (randomized == true) {
          fill(random(randLow,randHigh)*round(random(5,125)),
               random(randLow,randHigh)*round(random(175,255)),
               random(randLow,randHigh)*round(random(5,125)),
               random(randLow,randHigh)*round(random(30,50))*drawMod/numberBranches);  //green
        }

        if (randomized == false) {
          fill(127 * drawMod/numberBranches,
               255 * drawMod/numberBranches,
               50 * drawMod/numberBranches,
               40 * drawMod/numberBranches);
        }

        // Stroke
        if (randomized == true) {
          stroke(random(randLow,randHigh)*round(random(0,125)),
                 random(randLow,randHigh)*round(random(200,255)),
                 random(randLow,randHigh)*round(random(0,125)),
                 random(randLow,randHigh)*round(random(225,255))*drawMod/numberBranches);  //green
          strokeWeight(random(.75,1.5)*drawMod*.0625);
        }

        if (randomized == false) {
          stroke(63 * drawMod/numberBranches,
                 127 * drawMod/numberBranches,
                 25 * drawMod/numberBranches,
                 255 * drawMod/numberBranches);
          strokeWeight(drawMod*.0625);
        }

  pg.beginDraw();
        ellipse(node[i].getX(), node[i].getY(), node[i].getNodeRadius(), node[i].getNodeRadius());
  pg.endDraw();
      }
    }
println("END: Draw ellipse at each node with radius.");
}




void drawNodeEllipse() {
println("START: Draw ellipse at each node...");
// Draw ellipse at each node
for (i = 0; i < arrayLength; i++) {
  for (j = 0; j < numberBranches; j++) {
    if (node[i].getBranchPosition()==j){
      if(node[i].getAction() != "reuse") {
        drawMod = (numberBranches - node[i].getBranchPosition());

        // Fill
        if (randomized == true) {
          fill(random(randLow,randHigh)*round(random(100,150))*drawMod/numberBranches,
               random(randLow,randHigh)*round(random(200,255))*drawMod/numberBranches,
               random(randLow,randHigh)*round(random(25,75))*drawMod/numberBranches,
               random(randLow,randHigh)*round(random(200,255))*drawMod/numberBranches);  //green
        }

        if (randomized == false) {
          fill(127 * drawMod/numberBranches,
               255 * drawMod/numberBranches,
               50 * drawMod/numberBranches,
               250 * drawMod/numberBranches);
        }

        // Stroke
        if (randomized == true) {
          stroke(random(randLow,randHigh)*round(random(0,50))*drawMod/numberBranches,
                 random(randLow,randHigh)*round(random(100,150))*drawMod/numberBranches,
                 random(randLow,randHigh)*round(random(0,50))*drawMod/numberBranches,
                 random(randLow,randHigh)*round(random(200,255))*drawMod/numberBranches);  //green
          strokeWeight(random(.75,1.5)*drawMod*.0625);
        }

        if (randomized == false) {
          stroke(63 * drawMod/numberBranches,
                 127 * drawMod/numberBranches,
                 25 * drawMod/numberBranches,
                 250 * drawMod/numberBranches);
            strokeWeight(drawMod*.0625);
        }

  pg.beginDraw();
        ellipse(node[i].getX(), node[i].getY(),pow(drawMod,1.5),pow(drawMod,1.5));
  pg.endDraw();
      }
    }
  }
}
println("END: Draw ellipse at each node.");
}

// ---------------
// HERE BE CLASSES
// ---------------

 
public class  Node{
        
    // the first letter of a class name should be capitalized

    // the class has fields
    // for fields, spell the first word lowercase, capitalize the first letter of each subsequent word
    // --------------------------

    // these are private and you use the get Methods to return the public values

    // private float radius, theta, x, y, action;
    int branchPosition, nodePosition, parentReference, nodeNumber;
    float theta, x, y, nodeRadius;
    String action;

    // the class has constructors
    // --------------------------

    public void Node(int startBranchPosition, int startNodePosition, int startParentReference, int startNodeNumber, float startNodeRadius, float startAngle, float startX, float startY, String startAction) {
        branchPosition = startBranchPosition;
        nodePosition = startNodePosition;
        parentReference = startParentReference;
        nodeNumber = startNodeNumber;
        nodeRadius = startNodeRadius;
        theta = startAngle;
        x = startX;
        y = startY;
        action = startAction;
    }
        
    // the class has methods
    // the first (or only) word in a method name should be a verb
    // --------------------------

    // ---------SET and GET------------
    public int getBranchPosition() {
        return branchPosition;
    }

    public void setBranchPosition(int newValue) {
        branchPosition = newValue;
    }

    public int getNodePosition() {
        return nodePosition;
    }

    public void setNodePosition(int newValue) {
        nodePosition = newValue;
    }

    public int getParentReference() {
        return parentReference;
    }

    public void setParentReference(int newValue) {
        parentReference = newValue;
    }

    public int getNodeNumber() {
        return nodeNumber;
    }

    public void setNodeNumber(int newValue) {
        nodeNumber = newValue;
    }

    public float getNodeRadius() {
        return nodeRadius;
    }

    public void setNodeRadius(float newValue) {
        nodeRadius = newValue;
    }


    public float getAngle() {
        return theta;
    }

    public void setAngle(float newValue) {
        theta = newValue;
    }

    public float getX() {
        return (x);
    }

    public float getY() {
        return (y);
    }
    
    public void setPosition(float newX, float newY) {
        x = newX;
        y = newY;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String newValue) {
        action = newValue;
    }
    
    public void printNode() {
        println(branchPosition + ", " + nodePosition + ", " + parentReference + ", " + nodeNumber + ", " + nodeRadius + ", " + theta + ", " + x + ", " + y + ", " + action);
    }
}



public class  Branch{
        
    // the first letter of a class name should be capitalized

    // the class has fields
    // for fields, spell the first word lowercase, capitalize the first letter of each subsequent word
    // --------------------------

    // these are private and you use the get Methods to return the public values

    // private float radius, theta, x, y;
    int NodeNum;
    float radius;

    // the class has constructors
    // --------------------------

    public void Branch(int startNodeNum, float startRadius) {
        NodeNum = startNodeNum;
        radius = startRadius;
    }
        
    // the class has methods
    // the first (or only) word in a method name should be a verb
    // --------------------------

    // ---------SET and GET------------

    public int getNodeNum() {
        return NodeNum;
    }

    public void setNodeNum(int newValue) {
        NodeNum = newValue;
    }

    public float getRadius() {
        return radius;
    }

    public void setRadius(float newValue) {
        radius = newValue;
    }

}



