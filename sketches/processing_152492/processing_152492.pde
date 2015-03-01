
PVector startPoint;
Tree tree1;
void setup() {
  background(0);
  size(500, 500);
  stroke(255);
  startPoint = new PVector(random(0, width), -10);
  PVector direction = new PVector(mouseX-startPoint.x, mouseY-startPoint.y);    
  tree1 = new Tree(startPoint, direction, 0.05*direction.mag());
}

void draw(){
  backgroundUpdate();
/*  
  println("Tree size is : " + tree1.getTreeSize());
  println(frameRate);
  println("********************");
*/
}

void backgroundUpdate() {
  rect(0, 0, width, height);
  fill(0, 10);
  
} // void backgroundUpdate() {


void mousePressed() {

  startPoint = new PVector(random(0, width), -10);
  
  PVector direction = new PVector(mouseX-startPoint.x, mouseY-startPoint.y);    
  
  tree1 = new Tree(startPoint, direction, 0.025*direction.mag());
  tree1.displayGND();
  tree1.displayBODY();  
} 
class Tree {
  
  private Twig[] branches;
  private int treeSize;
  private int [][] generationMap;
  
  
  Tree(PVector startPoint, PVector direction, float initialWeight) {
    
    int generation = floor( random(2.0, 5.0) );
    generationMap = new int[generation][];
    generationMap[0] = new int[1];
    generationMap[0][0] = generation ;
    
//    println("Total generation : " + generation);
    
    treeSize = generationMap[0][0] + 1;
    
    int generationSize = generationMap[0][0];
    
    for(int j = 1; j < generation; j++) {  
      
      if(generationSize == 0) {
        generationMap[j] = new int[1];
        generationMap[j][0] = -1;
//        println("!!!!!!!!!!!!!!!!!!!");
        break;
      }
      
      generationMap[j] = new int[generationSize];
      
      for(int k = 0; k < generationSize; k++) {
        generationMap[j][k] = floor( random(0.0, 3.0) );
      }
      
      generationSize = 0;
      
      for(int k = 0; k < generationMap[j].length; k++) {
        generationSize = generationSize + generationMap[j][k];
      }
      
      treeSize = treeSize + generationSize;
      
    } // for(int j = 1; j < generation; j++) {
    
//    for(int j = 0; j < generation; j++) {
//      println("the " + j + " layer : ");
//      println(generationMap[j]);
//    }      
    
//    println("treeSize is : " + treeSize);
    
    branches = new Twig[treeSize];    
            
    branches[0] = new Twig(startPoint, direction, initialWeight);
    
    int treeIndex = 1;
//    PVector branchDirection = new PVector();

//    PVector startTemp = new PVector();
//    PVector endTemp = new PVector();
    PVector currentDirection = direction;
    
    for(int j = 0; j < generationMap.length; j++) {
      
      if(generationMap[j][0] == -1) {
        break;
      }      
            
      for(int k = 0; k < generationMap[j].length; k++) {        
        
//        startTemp = branches[j+k].getPoint(0);
//        endTemp = branches[j+k].getPoint( branches[j+k].getPointSum()-1 );
//        branchDirection = PVector.sub(endTemp, startTemp);
        
        int branchNum = generationMap[j][k];
        
        for(int n = 0; n < branchNum; n++){
           
//          currentDirection = branchDirection;
//          int chk = round(random(0.0, 1.0));
//          if(chk == 1) {
//            currentDirection.rotate(QUARTER_PI);
//          } else {
//            currentDirection.rotate(-QUARTER_PI);
//          }           
          
          int branchIndex = floor(random(0.0, branches[j+k].getPointSum()*0.75));
          branches[treeIndex] = new Twig(branches[j+k].getPoint(branchIndex), currentDirection, branches[j+k].getWeight(branchIndex));
          treeIndex ++;
          
        } // for(int n = 0; n < branchNum; n++){
  
      } // for(int k = 0; k < generationMap[j].length; k++) {
        
    } // for(int j = 0; j < generationMap.length; j++) {
       
  } // Tree(PVector startPoint, PVector direction, float initialWeight) {
    
  
  void displayGND() {
    
    for (int j = 0; j < treeSize; j++) {    
      branches[j].displayGND();
    }
    
  } // void displayGND() {
  
  
  void displayBODY() {
    for (int j = 0; j < treeSize; j++) {    
      branches[j].displayBODY();
    }
    
  } // void displayBODY() {
  
  int getTreeSize() {
    return treeSize;
  }
  
  Twig getTwig(int index) {
    return branches[index];
  }
    
} // class Tree {
  
      
class Twig {
  
  private PVector[] pathPoints;
  private float[] weights;
  private int pointSum;

  Twig(PVector startPoint, PVector direction, float initialWeight) {    
    int max_num_point = int( random(10.0, 10 * initialWeight ));

    float max_twig_length = initialWeight; 
    PVector reference = new PVector(1.0, 0.0);
    float argument = PVector.angleBetween(direction, reference);
    if(direction.y < 0) {
      argument *= -1.0;
    }
 
  
    pointSum = max_num_point;
    
    pathPoints = new PVector[max_num_point];  
    pathPoints[0] = startPoint;
    
    float fArg = 0;    
    for (int j = 1; j < max_num_point; j++) {
      
      float magnitude = random(0.0, max_twig_length); 
      float  nArg= random(-QUARTER_PI, QUARTER_PI) + fArg;
      PVector nextPoint = new PVector(magnitude * cos(nArg + argument), magnitude * sin(nArg + argument));
//      nextPoint.rotate(nArg + argument);
      fArg = nArg*0.85;
      nextPoint.add(pathPoints[j-1]);
      pathPoints[j] = nextPoint;
    
    } // for (int j = 1; j < max_num_point; j++)
    
    weights = new float[max_num_point];
    if( initialWeight > 2) {
      for (int j = 0; j < max_num_point; j++) {
        weights[j] = map(j, 0, max_num_point-1, initialWeight, 2);
      }
    } else {
      for (int j = 0; j < max_num_point; j++) {
        weights[j] = 2;
      }
    } 

  } // Twig(PVector startPoint, PVector direction, int recursionLevel)
  
  void displayGND() {
    pushStyle();
    stroke(0, 0, 200);
    for (int j = 1; j < pointSum; j++) {    
      strokeWeight( weights[j] );
      line(pathPoints[j-1].x, pathPoints[j-1].y, pathPoints[j].x, pathPoints[j].y);
    }
    popStyle();
  } // void displayGND() {
  
  
  void displayBODY() {
    pushStyle();
    stroke(200, 200, 250);
    for (int j = 1; j < pointSum; j++) {    
      strokeWeight( weights[j] * 0.6 );
      line(pathPoints[j-1].x, pathPoints[j-1].y, pathPoints[j].x, pathPoints[j].y);
    }
    popStyle();
  } // void displayBODY() {
  
    
  PVector getPoint(int index) {
    return pathPoints[index];
  }
  
  int getPointSum() {
    return pointSum;
  }
  
  float getWeight(int index) {
    return weights[index];
  }
  
} // class Twig {


