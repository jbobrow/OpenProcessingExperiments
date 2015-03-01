
/*composite branches*/
int MAX_DEPTH = 5;  
ArrayList<Branch> branchList = new ArrayList<Branch>(); 

//color leafColor = color(113, 200, 100, 50); 
color leafColor = color(116, 188, 187, 50); 
//color leafColor = color(200, 90, 90, 50); 
color bkgdColor = color(0); 
color treeColor = color(230, 209, 126); 
//color treeColor = color(196, 142, 75);
Branch trunk;

void setup() {
  size(1000, 700); 
  noLoop(); 
}

void draw() {
    background(bkgdColor); 
    generate(); 
    
}

void mouseReleased() {
    redraw(); 
}

void generate() {  
  branchList = new ArrayList<Branch>(); 
  Vertex bot = new Vertex(500, 700, 0); 
  Vertex top = new Vertex(500, 500, 1); 
  trunk = new Branch(bot, top); 
  
  //println("branches : " + branchList.size()); 
  
  
  for (int i=0; i<branchList.size(); i++) {
    branchList.get(i).display(); 
  }
}


class Branch {
  //self
  Line line_; 
  Leaf leaf; 
  float angle; 
  int lengt; 
  //children
  Branch[] branches;   
  
  //used only for first branch
  Branch(Vertex bot, Vertex top) {
    branchList.add(this); 
    line_ = new Line(bot, top, getStrokeWeight(0)); 
    int children = (int)random(5,8);
    branches = new Branch[children]; 
    for (int i=0; i<children; i++) {
      branches[i] = new Branch(); 
      branches[i] = branches[i].makeBranch(top, PI + HALF_PI, 0); 
    }
  }
  
  //used for all subsequent branches
  Branch() {
  }
  
  Branch makeBranch(Vertex start, float angle, int deepness) {
    //define this branch: 
    //get parameters
    int lengthPivot = getLengthPivot(deepness); 
    float angleVariation = getAngleVariation(deepness); 
    //compute dependent, semi-randomized parameters
    angle += random(-angleVariation, angleVariation);     
    lengt = (int)random(lengthPivot*.4, lengthPivot*1.5);  
    //define this branch based on parameters
    Vertex end = new Vertex(start.x + cos(angle)*lengt, start.y + sin(angle)*lengt, getVertexTag(deepness)); 
   
    line_ = new Line(start, end, getStrokeWeight(deepness));  
    
    branchList.add(this); 
    
    //define child branches: 
    if (deepness < MAX_DEPTH) {          
      //make new branches
      int children = (int)random(1, getMaxChildren(deepness)); 
      branches = new Branch[children]; 
      for (int i=0; i<children; i++) {
        branches[i] = new Branch(); 
        branches[i] = branches[i].makeBranch(end, angle, deepness+1); 
      }
    }
    
    //add a leaf to branch, if appropriate
    if (deepness > 3) {
      leaf = new Leaf(start, (int)random(7, 13), (int)random(7, 13)); 
    }
    
    return this; 
  }
  
  int getVertexTag(int deepness) {
    return deepness+2; 
  }
 
  float getStrokeWeight(int depth) {
    float strokeWeight = getShallowness(depth)*1.4-7; 
    if (strokeWeight > .5) {
      return strokeWeight; 
    } else {
      return .5; 
    }
  }
  
  int getShallowness(int depth) {
    return 8 - depth; 
  }
  
  int getMaxChildren(int depth) {
    return 7 - depth; 
  }
  
  int getLengthPivot(int depth) {
    int lengthPivot = 200; 
    for (int i=0; i<depth; i++) {
      lengthPivot *= .5; 
    }
    return lengthPivot; 
  }
  
  float getAngleVariation(int depth) {
    return .8-depth*.05; 
  } 
  
  void display() {
    //display self
    Vertex a = line_.a; 
    Vertex b = line_.b; 
    strokeWeight(line_.strokeWeight); 
    stroke(treeColor); 
    line(a.x, a.y, b.x, b.y);
    if (leaf != null) {
      fill(leafColor); 
      noStroke(); 
      leaf.display(); 
    }
  }
  
  void spinBranch(float dRotation) {
    Vertex anchorPt = getAnchorVertex(); 
    Vertex movingPt = null; 
    if (anchorPt == line_.a) {
      movingPt = line_.b; 
    } else {
      movingPt = line_.a; 
    }
    angle += dRotation; 
    movingPt.x = anchorPt.x + cos(angle) * lengt; 
    movingPt.y = anchorPt.y + sin(angle) * lengt; 
 }
  
  Vertex getAnchorVertex() {        
    Vertex a = line_.a; 
    Vertex b = line_.b; 
    if (a.tag < b.tag) {     
      return a; 
    } else {
      return b; 
    }
  }
}

class Leaf {
  Vertex center; 
  int w, h;   
  
  Leaf(Vertex center, int w, int h) {
    this.center = center; 
    this.w = w; 
    this.h = h;
  }
  
  void display() {
    ellipse(center.x, center.y, w, h); 
  }  
}

class Line {
  Vertex a, b; 
  float strokeWeight; 
  
  Line(Vertex a, Vertex b, float strokeWeight) {
    this.a = a; 
    this.b = b; 
    this.strokeWeight = strokeWeight; 
  }
}

class Vertex {
  float x, y; 
  int tag; 
  
  Vertex(float x, float y, int tag) {
    this.x = x; 
    this.y = y; 
    this.tag = tag; 
  }
}




