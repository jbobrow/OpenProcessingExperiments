
//Program to draw tree
int maxlevels = 14;// the number of levels in the tree
int maxbranches = 10000;// the maximum amount of branches
int maxpnts = maxbranches + 1;
float inner_rad = 30;
float outer_rad = 300;
float[] rad = new float[maxlevels];

color c = color(246, 123, 160);

Branch[] b = new Branch[maxbranches];
BranchRange[] BranchesAtLevel = new BranchRange[maxbranches];

float ang = radians(30.0);
float motherang = radians(45.0);
float length = 100.0;
float th=5.0;
int nb=0;
int motherbranch;

void setup() {
  // usual stuff
  size(1200, 1200);
  smooth();

  for( int j=0; j < maxlevels; j++){
    rad[j] = inner_rad + j*(outer_rad - inner_rad)/(maxlevels-1);
  }
  
  // read tree branches file
  nb = 0;
  String[] lines = loadStrings("testtree.txt");
  for (int i = 1; i < lines.length; i++) {
    String[] pieces = split(lines[i], ',');
    println(pieces[0]); 
    println(pieces[1]);
    b[i-1] = new Branch(pieces[0], pieces[1], length, radians(90.), th, 0.0, 0.0, c);
    nb++;
  }  

  // Find the root of the tree 
  // this should be the first point on the first branch
  // else exit with error message
  String root = b[0]. branchStart;
  for ( int i = 0; i < nb; i++ ) {
    if ( root == b[i]. branchEnd ) {
      println("FATAL ERROR: FIRST ENTRY IN TREE INPUT FILE IS NOT THE ROOT"); 
      exit();
    }
  }
  // at this stage nb = # branches
  
  println("THE ROOT OF THE TREE IS");
  println(root);
  
  // find level 1 branches
  // note that the root node is at level 0
  // branches connected to the root is at branch level 1
  // next level of points are at level 1
  
  for( int i = 0; i < nb; i++) {
    if( root.equals( b[i].branchStart )) {
      println("Branch is connected to the root"); 
      println(b[i].branchStart + " ------- " + b[i].branchEnd); 
      b[i].level = 1;
    }
  } 

  for( int level=2; level < maxlevels; level++ ){
    for( int i = 0; i < nb; i++){
      println(" at branch " + i);
      println(" level = " + b[i].level);
      if( b[i].level == level-1 ){
        println("  branch " + i + " is of right level=" + (level-1));
        // now find all branches not yet seen and attached to b[i]
        for( int j = 1; j < nb; j++){
          println( "    .....  branch # j = " + j);
          if( b[j].level == -1 && i!=j ){
            println(" is branch "+i+" attached to branch " + j + " ?");
            println( b[i].branchEnd + " -- " + b[j].branchStart);
            if( isAttached( b[i], b[j] )) {
               b[j].level = level;
            };
          };
        };
      };
    };
  };
 
  // build trunk
  float x = width/2.0;  
  float y = height/4.0;
  color c = color(246, 123, 160);
  color grey = color(200, 200, 200);
  ellipse(x, y, 10, 10);
  nb = 0;
  b[nb] = new Branch("", "", length, radians(90.), th, x, y, c);
  b[nb].draw();
  nb = 1;
  BranchesAtLevel[0] = new BranchRange();
  BranchesAtLevel[0].start=0;
  BranchesAtLevel[0].end=0;
  // now build branches level by level
  for ( int level = 1; level < maxlevels; level++) {
    // starting new level 
    length = length*0.75; // shorten branch length for this level
    // make branches thinner
    if ( level > 3 ) { 
      th = 3;
    }
    if ( level > 5 ) { 
      th = 1;
    }
    c = blendColor(c, grey, MULTIPLY); // blend a new color
    // now go through each motherbranch at previous level
    int start = BranchesAtLevel[level - 1].start;
    int end = BranchesAtLevel[level - 1].end;
    // motherbranches has numbers from start to end
    BranchesAtLevel[level] = new BranchRange(); 
    BranchesAtLevel[level].start = nb;

    // loop through all motherbranches
    for ( motherbranch = start; motherbranch <= end; motherbranch++) {
      x = b[motherbranch].x2;
      y = b[motherbranch].y2;
      motherang = b[motherbranch].ang;

      b[nb] = new Branch("", "", length, motherang - ang, th, x, y, c);
      b[nb].draw();
      nb++;
      b[nb] = new Branch("", "", length, motherang + ang, th, x, y, c);
      b[nb].draw();
      nb++;
    }
    // done with this level
    BranchesAtLevel[level].end=nb-1;
  }
}



class Branch {
  String branchStart, branchEnd;
  float len, ang, th, x1, y1, x2, y2;
  color bc;
  int level = 0; //unless changed

  // constructor
  Branch(String brStart, String brEnd, 
  float length, 
  float angle, 
  float thickness, 
  float xstart, float ystart, 
  color bcolor) {
    level = -1; //implies not set
    branchStart = brStart;
    branchEnd = brEnd;
    len = length;
    ang = angle; 
    th = thickness;
    x1 = xstart;
    y1 = ystart;
    x2 = x1 + len*cos(ang);
    y2 = y1 + len*sin(ang); 

    bc = bcolor;
  }
  void draw () {
    pushMatrix();
    fill(bc);
    beginShape();
    translate(x1, y1); 
    rotate(ang);
    vertex(0.0, -0.5*th);
    vertex(len, -0.5*th);
    vertex(len, 0.5*th);
    vertex(0.0, 0.5*th);
    endShape(CLOSE);
    fill(100);
    popMatrix();
  }
} 


class BranchRange {
  int start, end;
}


boolean isAttached( Branch b1, Branch b2){
  // check if b1 and b2 are connected
  if( b1.branchEnd == b2.branchStart || b1.branchStart == b2.branchEnd){
    return true;
  }
  else{
    return false;
  }
}

boolean branchesAreDifferent( Branch b1, Branch b2){
  // check if b1 & b2 are different branches
  if( b1.branchEnd != b2.branchEnd || b1.branchStart != b2.branchStart){
    return true;
  }
  else{
    return false;
  }
}
