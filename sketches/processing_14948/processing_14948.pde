

ArrayList trees;     //bloom array
PVector intersection;  // point of intersection
float stepLength=8; //length of each step

void setup() 
{
  size(1024, 768, P3D);
  trees= new ArrayList(); 
//  frameRate(200);
  background(20);
  bloom growth = new bloom(); //add first bloom
  trees.add(growth);
  growth.start();
}

void draw() 
{
  frameRate(200);
  noCursor();
  fill(20,100);      //diming effect for lightning trail as each bloom ends
  rect(-10,-10,width+15,height+15);
  bloom tree = (bloom) trees.get(0); 
  tree.draw();  
  if (tree.done==true) { //if the bloom says it's done...
    trees.remove(tree);   //remove it from the list
    bloom growth = new bloom();  //now add a new one
    trees.add(growth);
    growth.start();
  }
  
  if(mousePressed) {
    frameRate(1);
  }
}

//defining a bloom
class bloom {
  ArrayList Frac;      //branch Fractal array
  int numBranch;    //number of branches-Fractals
  boolean done;    //states if this bloom is finished
  float rangexx;   //range of growth for each branch Fractal
  float rangeyy;
  int rand;     //random branch from array
  float halfNumBranch;  //number of branches divided by 2
  bloom() {
    Frac= new ArrayList();
    numBranch=12;
  }

  void start() {

    halfNumBranch=numBranch/2;
    for(int i=0;i<numBranch;i++) {
      //gives a range of x and y coordinates for each branch 
      //determined by their number in array
      rangexx=stepLength*random(cos(i*PI/halfNumBranch)-.0625, cos(i*PI/halfNumBranch)+.0625);
      rangeyy=stepLength*random(sin(i*PI/halfNumBranch)-.0625, sin(i*PI/halfNumBranch)+.0625);
      branchFractal bran= new branchFractal(rangexx,rangeyy);
      Frac.add( bran);
      bran.beginBranch();
    }
  }

  void draw() {
    //pick random branch and pulse it
    rand=round(random(Frac.size()-1));
    branchFractal randBranch=(branchFractal) Frac.get(rand);
    randBranch.Add=true;  
    //one one branch reaches the maximum branch length, set the rest
    //of the branches length as their maximum length
    //allows for the "degedation" of the branches to happen in unison
    for(int i=0;i<numBranch;i++) {   
      for(int j=0;j<numBranch;j++) { 
//        if (j!=i) {
          branchFractal maX = (branchFractal) Frac.get(i);
          branchFractal rest = (branchFractal)  Frac.get(j);  
          for(int k=0;k<maX.Size;k++){   
            for(int l=0;l<rest.Size;l++){ 
//              if(l!=k){
                
                branch maXX=(branch) maX.fractal.get(k);
                branch restt=(branch) rest.fractal.get(l);
                if (maXX.num>=maXX.maxNum) { 
                  restt.maxNum=restt.num;
              }
//            }
          }
//          }
        }
      }
    }
    //finds the longest branch to determine if its array is empty
    //(because it will take the longest branch the longest to remove points
    //during degredation) in order to set the entire bloom status as "done"
    int longFrac=0;
    int longestNum=0;
    int longestBranch=0;
    for(int i=0;i<numBranch;i++) {
      branchFractal temp = (branchFractal) Frac.get(i);
      for(int j=0;j<temp.fractal.size();j++){
        branch tempp= (branch) temp.fractal.get(j);
        if (tempp.maxNum>longestNum) {
          longestNum=tempp.maxNum;
          longestBranch=j;
          longFrac=i;
        }
      }
    }
    branchFractal longestBr = (branchFractal) Frac.get(longFrac);
    branch longestBrr = (branch) longestBr.fractal.get(longestBranch);
    if (longestBrr.a.isEmpty()) {
      done=true;
      Frac.clear();
      return;
    }
    for(int i=0;i<numBranch;i++) { 
      branchFractal temp = (branchFractal) Frac.get(i);
      temp.drawFractal();
    }
    
  }
}

//allows fractal property, starts with one branch and begins new branches at 
class branchFractal{
  int Size;  //number of branches in array
  float rangex;
  float rangey;
  boolean Add;   //add to end of existing branch or a new branch
  ArrayList fractal;        //fractal array
  PVector center;            //starting point of first branch in array
  int rando;          //random branch
  float scaler;        //random point to choose probability
  
  branchFractal(float rangex_, float rangey_){
    rangex=rangex_;
    rangey=rangey_;
    Size=0;
    fractal=new ArrayList();
    center=new PVector(width/2,height/2);
  }
  void beginBranch(){
    Size+=1;
    branch bran= new branch(rangex,rangey,center);
    fractal.add(bran);
    Add=false;
    bran.start();
  }
  void drawFractal(){
    
    if (Add==true){     //if the bloom is calling this branchfractal
      for (int i=0;i<fractal.size()-1;i++){
        branch bran = (branch) fractal.get(i);
        bran.flash=true;                   //make entire branch fractal white at once
      }
      rando=round(random(0,fractal.size()-1));   
      branch temp= (branch) fractal.get(rando);        //get random branch in fractal array
      scaler=random(0,10);                            //get random number for scaling probability
      if(Size>10){ scaler=10;}          //  if there are enough branches in array, don't add more
      if (scaler>=.5){                            //if random number is greater than a constant
        temp.pulse=true;                          //just add new PVector to the branch array
      }
      else{                                  //if random number is smaller....
        for (int i=0;i<fractal.size();i++){
          branch bran= (branch) fractal.get(i);
          if (bran.a.size()>2&&bran.num<bran.maxNum){
            iterate();                      
          }
        }
      }
    }
    Add=false;
    for (int i=0;i<fractal.size();i++){
        branch bran= (branch) fractal.get(i);
        bran.draw();
    }
  }

//find random point in a random branch array, and make that a starting point for a new branch
  void iterate(){
    Size+=1;
    int rando2=round(random(0,fractal.size()-1));
    branch temp = (branch) fractal.get(rando2);
    int randoPt=round(random(0,temp.a.size()-1));
    PVector tempp=(PVector) temp.a.get(randoPt);
    branch New=new branch(rangex,rangey,tempp);
    fractal.add(New);
    New.start();
    New.newWidthNum=rando/10;
  }
    
      
      
}
    

//defining a branch
class branch {
  int num;    //number of points
  int maxNum;  //maximum number of points a branch can grow
  float rangeX;    //variables for the range assigned to the branch
  float rangeY;

  boolean intersect_; //states whether this branch has intersected with another
  boolean DontLoop;  //preventing a for loop from continuing after
  boolean dontLoop;  //preventing a for loop from continuing after 
                     //intersect_ is found to be true
  ArrayList a;        //arraylist of points on one branch
  PVector begin;    //beginning point of each branch

  boolean pulse;    //whether to add another point to the branch
  boolean flash;
  
  color tempColor=color(255);  //the rate at which the color changes
  color col;                  //color of collapsing branch
  color white=color(255);      //branch starts at white

//intergers associated with a state of intersection between two lines
  int DONT_INTERSECT = 0;
  int COLLINEAR = 1;
  int DO_INTERSECT = 2;

  float x =0, y=0;  //intersection point

  ArrayList intersectInt; //list of the intersect intergers over one branch in the bloom
  
  int counter;    //counts times in a row an intersection has happened
  float newWidthNum;//so new branches fit in 
  
  branch(float rangeX_,float rangeY_,PVector begin_) {
    a=new ArrayList();
    rangeX=rangeX_;
    rangeY=rangeY_;
    begin=begin_;
    newWidthNum=0;
    //     rangeZ=rangeZ_;
  }


  void start() {  
      
    a.add(begin);
    num=0;
    maxNum=50;
    pulse=false;
    col=color(20);
    intersect_=false;
    DontLoop=false;
    dontLoop=false;
    intersectInt=new ArrayList();
    counter=0;
    flash=false;
  } 

  void draw() {

    if(a.isEmpty()) {  //don't do anything if the array is empty
      return;
    }
    if(num<maxNum) {  //if the branch is growing...

      drawLines();
      if (intersect_==true) {    //if there is still an intersection check until there isn't
//        println("rechecking-again");
        intersection();
//        println(intersect_);
//        println("returning");
        return;
      }
      counter=0;
      if (counter>5){    //if there has been too many intersections in a row, give up
        pulse=false;
      }
      if (pulse) {   //if this branch was selected to pulse
//        tempColor=0;
        addPt();
      } 
      pulse=false;
    }
    
    if (num>=maxNum) {   //if the length of the branch reaches the maximum number
      num=maxNum;
      for (int i=0;i<a.size()-1;i++) {  
        PVector r = (PVector)a.get(i);
        PVector s = (PVector)a.get(i+1);
        col=color(100);
        stroke(col);
        float val = 3-(i/15);     // as branch lengthens, draw a thinner line      
        strokeWeight(val);
        strokeWeight(3);
        line(r.x, r.y, r.z, s.x, s.y, s.z);  
      }
      a.remove(0);    //clear the set in order starting from the first
    }
  }

  void drawLines() {
    //draw lines
    for(int i=1; i<num; i++) {    
      PVector r = (PVector)a.get(i-1);
      PVector s = (PVector)a.get(i);
      tempColor=color(255/500);
      white+=tempColor;
      if (flash) {
//        println("FLASH!!!");
        white=color(200);    //draw white if any of the attached branches are pulsed
        flash=false;
      }
      stroke(white);
      float val = random(2,5)-newWidthNum-(i/15);     // as branch lengthens, draw a thinner line      
      strokeWeight(val);
      strokeCap(ROUND);
      line(r.x, r.y, s.x, s.y);
//      branchRadius=PVector.sub(s,new PVector(width/2,height/2)).mag();
    }
  }

  void addPt() {
    // Put a new value at the end of the array & check for intersection
    num+=1;
    PVector f = (PVector) a.get(num-1);
    float tempX=f.x + rangeX+stepLength*random(-.9,.9);
    float tempY=f.y + rangeY+stepLength*random(-.9,.9);
    a.add(new PVector(tempX,tempY));
    bloom bloo= (bloom) trees.get(0);
    for (int z=0;z<bloo.Frac.size()-1;z++) {
      if(DontLoop==true){  //if intersect is found for a branch, do not check the others
        DontLoop=false;
        return;
      }
      branchFractal c=(branchFractal) bloo.Frac.get(z);
      for (int zz=0;zz<c.fractal.size()-1;zz++){
        branch cc=(branch) c.fractal.get(zz);
        if(a.size()>1&&a.size()<maxNum) {        
//          if(cc.a.size()>1) {
            if(!cc.equals(this)) {
              for (int i = 1;i<cc.a.size();i++) {
                int intersect;
                PVector n = (PVector) cc.a.get(i-1);          
                PVector s = (PVector) cc.a.get(i); 
  
                intersect = intersect(n.x, n.y, s.x, s.y, f.x, f.y, tempX, tempY);
                intersectInt.add(intersect);
                
              }
              print(intersectInt);
              // if the array of intersect intergers contains 2 (float DO_INTERSECT)
              if (intersectInt.contains(DO_INTERSECT)||intersectInt.contains(COLLINEAR)) {
                println("First-Intersect");
                fill(255,0,0);
                ellipse(x, y, 15, 15);       //draw intersection point
                intersection();
                counter+=1;
                DontLoop=true;
              }
              intersectInt.clear();  //clear intersect interger array for next time
            }
//          }
        }
      }
    }
  }




  //repick point,check for intersection of new point, set state of intersect
  void intersection() {
//    println("rechecking");
    PVector g = (PVector) a.get(num-1);
    float tempXa=g.x + rangeX+stepLength*random(-.9,.9);
    float tempYa=g.y + rangeY+stepLength*random(-.9,.9);
    PVector temp_ =new PVector (tempXa,tempYa);
    a.set(num,temp_);                      //reset latest point
    bloom bloo= (bloom) trees.get(0);
    for (int z=0;z<bloo.Frac.size()-1;z++) {
//      println(bloo.Frac.size());
      if(dontLoop==true){  //if intersect is found for a branch, do not check the others
        dontLoop=false;
        return;
      }
      branchFractal c=(branchFractal) bloo.Frac.get(z);      //getting the branch array for the bloom
      for (int zz=0;zz<c.fractal.size()-1;zz++){
        branch cc=(branch) c.fractal.get(zz);
        if(a.size()>1&&a.size()<maxNum){
          if(!cc.equals(this)) {              //don't check for intersection with self
            for (int i = 1;i<cc.a.size();i++) {
              int intersectTemp;
              PVector n = (PVector) cc.a.get(i-1);          
              PVector s = (PVector) cc.a.get(i);  
              intersectTemp = intersect(n.x, n.y, s.x, s.y, g.x, g.y, tempXa,tempYa);
              intersectInt.add(intersectTemp);
            }
            intersect_=false;
            if (intersectInt.contains( DO_INTERSECT)) {
              intersect_=true;
              fill(200);
              ellipse(x, y, 15, 15);
//              println("intersect"+" "+intersect_);
              dontLoop=true;
              counter+=1;
            }
          intersectInt.clear();
          }
        }
      }
    }
  }

 
    //generate a interger representing each state of intersection
  int intersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

    float a1, a2, b1, b2, c1, c2;
    float r1, r2, r3, r4;
    float denom, offset, num;

    // Compute a1, b1, c1, where line joining points 1 and 2
    // is "a1 x + b1 y + c1 = 0".
    a1 = y2 - y1;
    b1 = x1 - x2;
    c1 = (x2 * y1) - (x1 * y2);

    // Compute r3 and r4.
    r3 = ((a1 * x3) + (b1 * y3) + c1);
    r4 = ((a1 * x4) + (b1 * y4) + c1);

    // Check signs of r3 and r4. If both point 3 and point 4 lie on
    // same side of line 1, the line segments do not intersect.
    if ((r3 != 0) && (r4 != 0) && same_sign(r3, r4)) {
      return DONT_INTERSECT;
    }

    // Compute a2, b2, c2
    a2 = y4 - y3;
    b2 = x3 - x4;
    c2 = (x4 * y3) - (x3 * y4);

    // Compute r1 and r2
    r1 = (a2 * x1) + (b2 * y1) + c2;
    r2 = (a2 * x2) + (b2 * y2) + c2;

    // Check signs of r1 and r2. If both point 1 and point 2 lie
    // on same side of second line segment, the line segments do
    // not intersect.
    if ((r1 != 0) && (r2 != 0) && (same_sign(r1, r2))) {
      return DONT_INTERSECT;
    }

    //Line segments intersect: compute intersection point.
    denom = (a1 * b2) - (a2 * b1);

    if (denom == 0) {
      return COLLINEAR;
    }

    if (denom < 0) { 
      offset = -denom / 2;
    } 
    else {
      offset = denom / 2 ;
    }

    // The denom/2 is to get rounding instead of truncating. It
    // is added or subtracted to the numerator, depending upon the
    // sign of the numerator.
    num = (b1 * c2) - (b2 * c1);
    if (num < 0) {
      x = (num - offset) / denom;
    } 
    else {
      x = (num + offset) / denom;
    }

    num = (a2 * c1) - (a1 * c2);
    if (num < 0) {
      y = ( num - offset) / denom;
    } 
    else {
      y = (num + offset) / denom;
    }

    // lines_intersect
    return DO_INTERSECT;
  }


  boolean same_sign(float a, float b) {

    return (( a * b) >= 0);
  }
}



