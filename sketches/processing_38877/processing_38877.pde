



 int currentSegNum = 0; // this value controls the recursion depth. it needs to be outside the function to avoid infinite recursion i think.


void setup(){
  
 size(450, 450);
 background(0);
 
}

int theCounter = 0;

void draw(){
theCounter++; //universal animation counter
  
  fill(0);
  rect(0, 0, height, width); // erase previous drawing
  
  fTree(225, 450, 500, 1.4); //call tree drawing pattern
  
  
}


void fTree(int xPos, int yPos, float counterRange, float fScale){
  //xPos, yPos base of tree origin
  //counterRange is the speed at which it animates (higher = slower)
  //fScale is the size of the tree
  
  float theAngleScale = abs(((theCounter % counterRange)/(counterRange/2.0))-1.0); // this creates triangle shape oscillation from 0-1 
  
  stroke(255);
  pushMatrix();
  translate(xPos, yPos); //tree position
  line(0, 0, 0, -fScale*100); //trunk
   pushMatrix();
    translate(0, -fScale*100);
    fBranch(8, fScale, theAngleScale); //call recursive branch function
   popMatrix();
  popMatrix();
}

void fBranch(int segNum, float fScale, float theAngleScale){
  //segNum is the total number of segments
  //fScale is size of the tree
  //theAngleScale is the float from 0-1 which controls the angle and animates the tree
 
 //This does all the left turns
 pushMatrix();
 currentSegNum++; //go up a segment
 rotate((-PI)*theAngleScale); //left turn at specified angle
 line(0, 0, 0, -fScale*(100/(1+currentSegNum))); //this equations controls the shortening of each subsequent branch
 translate(0, -fScale*(100/(1+currentSegNum)));
 //recursion 
 if (currentSegNum < segNum) {
  fBranch(segNum, fScale, theAngleScale);
 }
 popMatrix();
 currentSegNum--; //go down a segment
 
 //This does all the right turns
 pushMatrix();
 currentSegNum++;
 rotate((PI)*theAngleScale);
 line(0, 0, 0, -fScale*(100/(1+currentSegNum)));
 translate(0, -fScale*(100/(1+currentSegNum)));
 //if not at the end it will call this function
 if (currentSegNum < segNum) {
  fBranch(segNum, fScale, theAngleScale);
 }
 popMatrix();
 currentSegNum--;
  
}
