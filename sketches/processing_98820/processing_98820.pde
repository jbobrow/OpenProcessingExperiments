

int mthickness = 30; // menu thickness
int k ; // nearest neighbors
color[] ccolors = new color[]{#FF486D,#7248FF}; // class label colors
color[] bcolors = new color[]{#FFAFBA, #BDAFFF}; // boundary color for each class
int selectedClass = 0;
int patchsize = 7; // a patch size to draw int boundary drawing 

Dataset dataset=null;

void setup(){
  // initialize
  mthickness = 30; // menu thickness
  k = 1; // nearest neighbors
  ccolors = new color[]{#FF486D,#7248FF}; // class label colors
  bcolors = new color[]{#FFD6DE, #D6DEFF}; // boundary color for each class
  selectedClass = 0;
  patchsize = 10; // a patch size to draw int boundary drawing 
  dataset  = new Dataset();
    
  size(500, 400);
  background(255);
  fill(255);
  smooth();
  
  // draw menu at the top
  drawMenu();
}

void drawMenu(){
  
  noStroke();
  fill(#DBE7FF);
  rect(0, 0, width, mthickness);
  
  int basey = mthickness*2/3;
  // sample size
  textSize(14);
  fill(0);
  text("n = " + dataset.sampleSize() + " , ", 5, basey);
  
  // k (#nearest neighbours)
  // left arrow
  fill(#C9FFD6);
  rect(70, 0, 35, mthickness);
  fill(0);
  text(" -- ", 70, basey);
  // k
  fill(0);
  text(" k = "+k +" ", 110, basey);
  // right arrow
  fill(#C9FFD6);
  rect(170, 0, 35, mthickness);
  fill(0);
  text(" ++ ", 170, basey);
  
  // class label
  fill(0);
  text(" Class: ", 210, basey);
  fill(ccolors[0]);
  rect(270, 0, 50, mthickness);
  fill(ccolors[1]);
  rect(320, 0, 50, mthickness);
  
  // reset
  fill(#d8d8d8);
  rect(420, 0, 60, mthickness);
  fill(0);
  text("  Reset ", 420, basey);
  
}
void draw(){
  // we only update when there is a mouse event

}

void mouseReleased(){
  // choose class label
//  fill(0);
//  text(" Class: ", 210, basey);
//  fill(ccolors[0]);
//  rect(270, 0, 50, mthickness);
//  fill(ccolors[1]);
//  rect(320, 0, 50, mthickness);
  if(mouseY<= mthickness){
    if(mouseX >= 270 && mouseX<= 270+50){
      selectedClass = 0;
    }else if(mouseX >= 320 && mouseX <= 320+50){
      selectedClass = 1;
    }else if(mouseX >= 70 && mouseX <= 70+35){
      // decrese k
      k = constrain(k-1, 1, 2000);
    }else if(mouseX >= 170 && mouseX <= 170+35){
      k++;
    }else if(mouseX >= 420 && mouseX <= 420+60){
      //println("reset !");
      setup();
    }
     
  }else{
    // mouse coordinates are not affected by transformation matrix
    Point p = new Point(mouseX, mouseY - mthickness, selectedClass);
    dataset.addPoint(p);
  }
  
  // draw menu at the top
  drawMenu();
  fill(0);
  pushMatrix();
  translate(0, mthickness);
  drawKnnBoundary(dataset, k);
  dataset.draw();
  popMatrix();
  
}

color brighten(color co){
  float f = 1.7;
  return color( constrain(red(co)*f, 0, 255), constrain(green(co)*f, 0, 255), 
  constrain(blue(co)*f, 0, 255) ) ;  
}

void drawKnnBoundary(Dataset dataset, int k){
  
  int s = patchsize; // size of a square patch to draw
  int xstep = ceil(width/s);
  int ystep = ceil( (height-mthickness)/s);
  for(int i=0; i<ystep; i++){
    for(int j=0; j<xstep; j++){
      // center of i,j patch
      Point cen = new Point( s*j+s/2, s*i+s/2, -1 );
      int c = dataset.majorClasses(cen, k); //0 or 1
      //draw a patch
      fill(bcolors[c] );
      rect(s*j, s*i, s, s);
    }
  }
  
}
  
  
/////////////////////////////
class Point{
  int x, y;
  int label; // start from 0. -1 to denote unknown.
  Point(int x, int y, int label){
    this.x = x; this.y= y;
    this.label = label;
  }
  float distance(Point p){
    return sqrt( sq(p.x-x) + sq(p.y-y) );
  }
}

class Dataset{
  ArrayList<Point> points = new ArrayList<Point>();
  Dataset(){
  
  }
  
  int majorClasses(Point p, int k){
    ArrayList<Point> nns = nn(p); 
    int[] ccount = new int[]{0, 0}; // class count
    for(int i=0; i<min(nns.size(), k); i++ ){
      ccount[ nns.get(i).label ]++;
    }
    if(ccount[0] >= ccount[1]){
      return 0;
    }else{
      return 1;
    }
  }
  
  // Get nearest neighbours of Point p. Neighbours are sorted based on distance.
  ArrayList<Point> nn(Point p){
    // I won't do KD tree here. Just the simplest solution.
    int n = sampleSize();
    ArrayList<Point> nns = new ArrayList<Point>();
    for(int i=0; i<n; i++){
      Point pi = points.get(i);
      //Point[] pp= points.toArray(new Point[1]);
      float disti = p.distance(pi);
      int j=nns.size()-1;
      for( ; j>=0; j--){
        float distj = p.distance(nns.get(j));
        if(disti >= distj){
          break;
        }
      }
      nns.add(j+1, pi);
    }
    return nns;
  }
  void addPoint(Point p){
    points.add(p);
  }
  int sampleSize(){
    return points.size();
  }
  
  void draw(){
    int n = sampleSize();
    int pointsize = 7;
    for(int i=0; i<n; i++){
      Point pi = points.get(i);
      fill(ccolors[pi.label]);
      ellipse(pi.x, pi.y, pointsize, pointsize);
    }
  }
}






