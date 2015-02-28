
//import peasy.*;
//PeasyCam cam;

int diamondSize=15;
Node[][] tree1;
Node[][] tree2;
GraphOp op1;
GraphOp op2;
float theta = 0; // Variable for controlling wave
float delTheta = .01; // Rate of change of variable (radians); controls frequency

void setup(){
  size(600,600,OPENGL);
  lights(); 
  camera(2300,4200,2200,0,2500,0,0,0,-1);
  //cam = new PeasyCam(this,100);  
  
  
  NodeManager manager1=new NodeManager(diamondSize,100);  // Number of levels/Hex length
  manager1.seed(0,0,0);
  manager1.createTree();
  tree1=manager1.getCoords(); 
  
  NodeManager manager2=new NodeManager(diamondSize,100);  // Number of levels/Hex length
  manager2.seed(0,0,100);
  manager2.createTree();
  tree2=manager2.getCoords();
  
  op1 = new GraphOp(tree1,diamondSize,100);
  op1.initialize();
  op2 = new GraphOp(tree2,diamondSize,100);
  op2.initialize();
}

void draw(){
  background(0);
  drawAxes();
  
  
  op1.calcZ(theta);  // Calculate z coords
  op1.setZCoords(tree1,op1.getZ(),0);  // Set tree's z choords
  op1.drawTree();  // Draw tree 
  
  /*
  op2.calcZ(theta);  // Calculate z coords
  op2.setZCoords(tree2,op2.getZ(),100);  // Set tree's z choords
  op2.drawTree();  // Draw tree
  */
  theta+=delTheta;
}


//======================================================
// Axes
//======================================================
void drawAxes(){
 textSize(15);
 strokeWeight(2);
 
 stroke(250,0,0);  // Red z-axis
 line(0,0,0,0,0,80);
 pushMatrix();
 text("Z",0,0,80);
 popMatrix();
 
 stroke(0,250,0);  // Green x-axis
 line(0,0,0,80,0,0);
 pushMatrix();
 text("X",80,0,0);
 popMatrix();
 
 stroke(0,0,250);  // Blue y-axis
 line(0,0,0,0,80,0);
 pushMatrix();
 text("Y",0,80,0);
 popMatrix();
 noStroke();
}

/* This class provides methods for drawing a matrix of nodes and creating wave. The nodes are assumed to be connected.
*/ 

class GraphOp{
  Node[][] twoD;  // Graph we're working with
  float[] z;
  float[] theta;
  int n;
  float rH; 
  
  float amplitude=300;  // Amplitude of wave, pixels {FIX}
  
  GraphOp(Node[][] newGraph, int nSize,int rHex){
     twoD=newGraph; 
     n=nSize;
     rH=rHex;
     z=new float[4*n];  // We're addressing all levels; 
     theta=new float[4*n];
  }
  
  // Methods to create wave (NOT GENERIC; ONLY WORKS FOR ONE WAVE; CANNOT USE IT TWICE)
  public void initialize(){  // Map each level to a point of a circle
     int j=0;
     theta[0]=0;
     for(int i=1;i<6+4*(n-2);i+=2){
       theta[i]=((.5*rH)+(1.5*rH*j)); // .. .. .. .. .. ..
       theta[i+1]=((j+1)*(1.5*rH)); 
       j++;
     }   
     theta[4*n-1]=(theta[4*n-2]+(.5*rH));  // Anomally(corner case) requiring (PI/(n*rH)) to be done separately
     for(int i=1;i<theta.length;i++){
       theta[i]=theta[i]*(PI/(n*rH)); // .. .. .. .. .. ..
     }   
  }
  
  public void calcZ(float phi){  // Computes z-coords of each level -> z[]
    for(int i=0;i<z.length;i++){
      z[i]=amplitude*sin(phi+theta[i]);   // ADD PHI AFTER INITIALIZATION 
    }
  }
  
  public void setZCoords(Node[][] ar, float[] cords, float zOffset){  // zOffsets enables multiple waves to be animated
     for(int i=0;i<4*n;i++){                                          // Otherwise multiple nodes would be mapped to same z-height
       for(int j=0;j<n+1;j++){
        if(ar[i][j]!=null){
           ar[i][j].setZ(cords[i]+zOffset); 
        }
       } 
     }
  }
  
  public float[] getZ(){  // Outputs z-values for given phi
     return z; 
  }
  
  public void setAmplitude(float amp){
    amplitude=amp; 
  }  
  
  // Methods to draw graph
  public void drawTree(){  
    for(int i=0;i<4*n;i++){  // Row:Col
      for(int j=0;j<n+1;j++){
        if((twoD[i][j]!=null)&&(twoD[i][j].Left!=null)&&(twoD[i][j].Right!=null)){
          twoD[i][j].drawN();
          twoD[i][j].drawTo("LR");
        }
      }    
    }
  }
  
} // Ends GraphOP

class Node{
  
float nodeSize = 10;  // Size of Node
float edgeWeight = 2; // Size of wire
color nodeColor = color(180); 
color edgeColor =  color(250); 

int level;       // Indexes nBox[]
float x,y,z; 
Node Left;       // If not branch, then L=R
Node Right; 
boolean isbNode; // Is node a branch?
boolean isLeaf;  // Is node a leaf?


Node(float xInit, float yInit, float zInit, boolean isB, boolean isL){
  x=xInit; 
  y=yInit;
  z=zInit;
  isbNode = isB;
  isLeaf = isL; 
  level = 0;
} 

void setX(float xNum){x=xNum;}
void setY(float yNum){y=yNum;}
void setZ(float zNum){z=zNum;}
void setL(Node lNode){Left=lNode;}
void setR(Node rNode){Right=rNode;}
void setIsBNode(boolean bNode){isbNode = bNode;}
void setIsLeaf(boolean leaf){isLeaf = leaf;}
void setNLvl(int lvl){level=lvl;}

void drawN(){ // Render node
  fill(nodeColor);
  stroke(edgeColor);
  translate(x,y,z);
  box(nodeSize);
  translate(-x,-y,-z); // Restore Coords
}

void drawTo(String cmd){ // Render line to L/R node pos
  strokeWeight(edgeWeight); 
  stroke(edgeColor); 
  if(cmd=="L"){
    line(this.x,this.y,this.z,Left.x,Left.y,Left.z); 
  }
  else if(cmd=="R"){
    line(this.x,this.y,this.z,Right.x,Right.y,Right.z); 
  }
  else if(cmd=="LR"){
    line(this.x,this.y,this.z,Left.x,Left.y,Left.z); 
    line(this.x,this.y,this.z,Right.x,Right.y,Right.z); 
  }
}

} // Ends Class

/*  This class creates nodes of one tier of a diamond shape matrix and stores each node in a 2D array. 

    1. Call seed() to place the first vertex of hex matrix. Tree will be drawn in the y-direction 
       in default coordinate axis.
    2. Call createTree() to populate Node[][] with coordinates of hex matrix. This will display the graph
       unless debugDraw is set false.
    3. Call getCoords() to get coordinates of each node 
       call getRoot() to get root node
*/

class NodeManager{
 
  float rH;  // Hex side length
  int n;    // Number of levels
  Node rt;  // Root node
  Node[] bNodes;  // Working array of branch nodes
  Node[] nbNodes; // Working array of non-branch nodes
  Node[][] nBox;  // Holds all nodes in the array, for easy access, animating wave
  int c1=1; // Number of active bN in bNodes[], accounting for root
  int c2=2; // Number of active nbN in nbNodes[], account for root's first 2 children
  int nBuildLevel=1; // For indicating each newly created node's level
  
  boolean debugDrawN = false; // Draw nodes?
  boolean debugDrawTo = false; // Draw edges?
  boolean debugStatus = false; // Prints debug statements to terminal?
  
  NodeManager(int level, float hexLength){
    n=level;
    rH=hexLength; 
    bNodes = new Node[n];
    nbNodes = new Node[n+1];
    nBox = new Node[4*n][n+1];  // Should be as big as the diamond is big
  }
  
  void seed(float x, float y, float z){  // Creates first branching node
    rt = new Node(x,y,z,true,false);
    rt.setNLvl(nBuildLevel);   // Set lvl=1
    toBox(rt);       // Put in main array
    bNodes[0]=rt;    // Put in working array
    if(debugDrawN)rt.drawN();      // Display node
  }
  
  void createTree(){
     createTopMatrix();  // Populate main array
     createBotMatrix(); 
       if(debugDrawN){
        for(int j=0;j<4*n;j++){  // DEBUG: Draw every node from nBox[][]
          for(int i=0;i<n+1;i++){
             if(nBox[j][i]!=null){
               nBox[j][i].drawN();
             }
          }
        }
       }
  }
  
  void createTopMatrix(){      // Create first half 
    while(c1<=n){
      if(debugStatus){
        println("CYCLE "+c1+ "  c1="+c1+",c2="+c2+",Lvl="+nBuildLevel);
        print("Processing bN[]: ");
        dumpArray(bNodes);                              // Process branching Nodes in working array: Make next set of nodes
      }
        processbN();   
      if(debugStatus){
        print("Done proccessing bN. Updated nBN[]: ");
        dumpArray(nbNodes);
      }
      if(c1!=n){
        if(debugStatus){
          print("Processing nbN[]: ");
          dumpArray(nbNodes);
        }
        processnbN();                                // Process non-branching Nodes in working array: Make next set of nodes
        if(debugStatus){
          print("Done proccessing nbN. Updated bN[]: ");
          dumpArray(bNodes);
        }
      }
    c1++;            // Increment counter: c1 indicates how many non-branching Nodes to build
    c2++;            // Increment counter: c2 indicates how many branching Nodes ot build
    nBuildLevel+=2;  // Increment level counter
    if(debugStatus)dumpBox();          // DEBUG
    if(debugStatus)dumpArray(bNodes);  // DEBUG Since for c1=n, this doesn't get executed but we want to see it
    if(debugStatus)dumpBox();          // DEBUG
    }
  }
  
 void createBotMatrix(){    // Invert the y's and add offset from root pos. 
    int row=(nBuildLevel-2);       // Count down from mid row index, before nBuildLevel gets modified
    for(int i=row;i>=0; i--){
      genRow(i, nBuildLevel);       // Generate nodes based on nodes in row, put into nBox 
      nBuildLevel++;                  // Increment level counter
    }
    if(debugStatus)dumpBox();
    connectRows();   // Connect bottom rows
 }
 
  
  
//============================================================================================= 
// Methods to Create TOP Half 
//============================================================================================= 
  void processbN(){  // Process each branching node of level <c1>: Create nbN's
    gennbN(c1, nBuildLevel);                                           // Generate the number of nbN for this level
    setnbNCoords(bNodes[0].x, bNodes[0].y, bNodes[0].z);  // Set each coordinate of nbN based on position of left-most parent bN of level c1
    for(int i=0;i<c1;i++){  // Set each bN's left/R
      bNodes[i].setL(nbNodes[i]); 
      bNodes[i].setR(nbNodes[i+1]);
    }
    if(debugDrawTo){
      for(int j=0;j<c1;j++){          //DEBUG
        bNodes[j].drawTo("LR");  
      }
    }
  }
  
  void processnbN(){  // Process each nbN of level <c2>: Create bN's
  genbN(c2,nBuildLevel);                                            // Generate new bNodes based on previous level
  setbNCoords(nbNodes[0].x,nbNodes[0].y,nbNodes[0].z);  // Set newly created bNode's coords
  for(int j=0;j<c2;j++){                                // Set each 00's L/R to newly created bN
    nbNodes[j].setL(bNodes[j]);
    nbNodes[j].setR(bNodes[j]);
  }
  if(debugDrawTo){
    for(int a=0;a<c2;a++){            //DEBUG
      nbNodes[a].drawTo("LR");  
    }
  }
}
//=============================================================================================  
  void gennbN(int quantity,int nBLvl){           // Make non-branching nodes based on c1
    for(int i=0;i<quantity+1;i++){
      Node newNode = new Node(0,0,0,false,false); // Create & initialize nodes
      newNode.setNLvl(nBLvl+1);                   // Set node's level
      toBox(newNode);                             // Put in main array
      nbNodes[i]=newNode;                         // Add node to working array
    }
  }
  
  void genbN(int quantity, int nBLvl){            // Make branching nodes based on c2
    for(int i=0;i<quantity;i++){
        Node newbNode = new Node(0,0,0,true,false);
        newbNode.setNLvl(nBLvl+2);                   // Set node's level
        toBox(newbNode);                             // Put in main array
        bNodes[i]=newbNode;                          // Add node to working array
    }
  }
  
  void setnbNCoords(float x, float y, float z){  // Set coordinates of nodes in work array; Used with gennbN()
    for(int i=0;i<c1+1;i++){
      nbNodes[i].setX(x-rH*sin(radians(60))*(1-2*i)); // Given by geometry 
      nbNodes[i].setY(y+rH*cos(radians(60)));         // No need to set Z for now
      nbNodes[i].setZ(z);
    }
    if(debugDrawN){  
      for(int j=0;j<c1+1;j++){      //DEBUG
        nbNodes[j].drawN(); 
      }
    }
  }

void setbNCoords(float x, float y, float z){
  for(int i=0;i<c2;i++){
     bNodes[i].setX(x+2*i*rH*sin(radians(60)));
     bNodes[i].setY(y+rH);   
     bNodes[i].setZ(z);
  }
  if(debugDrawN){
    for(int i=0;i<c2;i++){           //DEBUG
       bNodes[i].drawN(); 
    }
  }
}
//============================================================================================= 
// Methods to Create BOT Half 
//============================================================================================= 
void genRow(int row, int nLvl){      // Generate nodes based on nodes in row, put into nBox 
  float toAOS = nBox[2*n-1][0].y+(rH/2);    // Distance from root to axis of symmetry ** Could be an issue if not nicely placed **, r/2+distance from rt to y-coord of nodes in last lv
  for(int i=0;i<n+1;i++){     // Check all array slots for node(cols)
    if(nBox[row][i]!=null){   // If row contains node
      float frAOStoN = dist(rt.x,toAOS,rt.z,rt.x,nBox[row][i].y,rt.z);   // Distance from AOS to node indexed by row
      Node newNode = new Node(nBox[row][i].x,toAOS+frAOStoN,nBox[row][i].z,nBox[row][i].isbNode,nBox[row][i].isLeaf);  // Make new node
      newNode.setNLvl(nLvl);  // Set node's level
      toBox(newNode);         // Store newly created node in main array
    }
  }
}

void connectRows(){
  Node[] prev = new Node[n+1];
  Node[] next = new Node[n+1]; 
  int cP=n+1;   // Node counter for prev
  
  // CONNECTING LEVEL ABOVE AOS TO LEVEL BELOW AOS
  prev = nbNodes; // Initalize prev array; prev is immediate level of nodes above AOS
  for(int i=0;i<n+1;i++) next[i]=nBox[2*n][i];  // Initialize next
  for(int i=0;i<n+1;i++){
     prev[i].setL(next[i]);
     prev[i].setR(next[i]);
     if(debugDrawTo)prev[i].drawTo("LR");  // DEBUG draw
  }
  for(int i=0;i<n+1;i++) prev[i] = next[i];  // Prev gets immediate level below AoS    
  // CONNECTING LEVELS BELOW AOS
    for(int i=(2*n+1);i<4*n;i++){  // i indexes row in nBox
      int cN=0;   // Node counter for next
      for(int j=0;j<n+1;j++){ // Populate next
        next[j]=nBox[i][j];
        if(nBox[i][j]!=null){ // Add to node counter if node actually exits
        cN++;
        }
      }
      if(cP==cN){  // Num nodes in prev = next
        for(int z=0;z<cP;z++){
           prev[z].setL(next[z]);
           prev[z].setR(next[z]);
           if(debugDrawTo)prev[z].drawTo("LR"); 
        }
      }
      if(cP>cN){    // Draw connections between uneven-levels
         prev[0].setL(next[0]);
         prev[cP-1].setR(next[cN-1]);
         for(int m=0;m<cP-1;m++){ 
           prev[m].setR(next[m]);
           //prev[m].drawTo("R");    // DEBUG  Note: Can't do drawTo("LR") here because L hasn't been connected yet...
         }
         for(int n=cP-1;n>0;n--){ 
           prev[n].setL(next[n-1]);
           //prev[n].drawTo("R");    // DEBUG
         }
         if(debugDrawTo){              // DEBUG draw
           for(int h=0;h<cP;h++){
              prev[h].drawTo("LR"); 
           }
         }
      }
      for(int y=0;y<n+1;y++) prev[y] = next[y];  // Prev gets immediate level below AoS
      cP=cN;
    } 
}


//============================================================================================= 
// nBox[][] Insert/Retrieval Methods
//============================================================================================= 
void toBox(Node n){  // Level denotes a row the node should be stored
  int index = 0; 
  while(nBox[n.level-1][index]!=null){index++;}  // Find next index with no objects
  nBox[n.level-1][index]=n; 
}

//============================================================================================= 
// Debug Methods
//============================================================================================= 
void dumpBox(){    // Prints the coordinates of all nodes store in main array
  println("MAIN ARRAY CONTAINS:");
  for(int i=0;i<(4*n);i++){ 
  print("["+i+"] = ");
    for(int j=0;j<(n+1);j++){
      if(nBox[i][j]!=null){  // If contains node
      print((j+1)+"."+"("+nBox[i][j].x+","+nBox[i][j].y+","+nBox[i][j].z+","+nBox[i][j].level+") ");
      } 
    }
    println(); 
  }  
  println();
}

void dumpArray(Node[] tar){  // Prints out the coordinates of each Node in each the array
  for(int i=0;i<tar.length;i++){
    if(tar[i]!=null){
    print("("+tar[i].x+","+tar[i].y+","+tar[i].z+","+tar[i].level+") "); 
    }
  }
  println();
}

Node[][] getCoords(){return nBox;}
Node getRoot(){return rt;}
int getN(){return n;}

} // Ends NodeManager class


