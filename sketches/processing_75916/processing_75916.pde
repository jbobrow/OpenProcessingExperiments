
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/42175*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */


class Branch  // this class handles an array of points, calculates growth and draws the actual branches.
{
  public int maxPoints;  // controls how long the branch is
  BranchPoint[] branchPoints;  // sets up the array of branchpoints used to store the points that will later be calculated by the grow method
  int count = 0; //counting variable to monitor how many points have already been calculated/stored in the array.
  float dir;     //direction of growth
  float speed;    //speed of growth
  float thickness; //thickness of the base of the branch
  float r = 105;
  float g = 139;
  float b = 34;


  Branch(int iniMaxLength, float startX, float startY, float direction, float baseThickness)
  {
    maxPoints = iniMaxLength;
    branchPoints = new BranchPoint[iniMaxLength]; //initializes the arra based on the values given in the constructor
    branchPoints[0] = new BranchPoint(startX, startY);  //sets up the first point in the array, also based on values from the constructor
    count=0; 
    speed=growthSpeed;
    dir = direction;
    thickness = baseThickness;
  }


  void grow(float ndir, float speed) // stores the next point in the array based on growth information given in the parameters (from the class Tree)
  {
    if (count < maxPoints-1)  //sets next point if array isn't full
    {
      float nX = this.returnLatestX()+cos(ndir)*1/frameRate*speed*50;
      float nY = this.returnLatestY()+sin(ndir)*1/frameRate*speed*50;
      branchPoints[count+1] = new BranchPoint(nX, nY);
      count++;
      dir = ndir;
    }
    else  // stops aging of all points in the array, so the branch won't grow thicker after it's finished growing.
    {
      for (int i= 0; i<maxPoints; i++)
      {
        branchPoints[i].beDone();
      }
    }
  }


  void drawBranch() //draws the branch with a parameter for transparency, controlled in the class Tree, based on time/age.
  {
    if (count>1) //doesn't draw if there are no two points to connect yet.
    {
      for (int i=0; i<count; i++) // goes through pairs of points and connects them with a line. The weight of said line is determined by the thickness value stored in the branchPoint class.
      {
        stroke(r, g, b);      
        branchPoints[i].setThickness(branchPoints[i].age*thickness);
        strokeWeight(branchPoints[i].thickness);    
        line(branchPoints[i].returnX(), branchPoints[i].returnY(), branchPoints[i+1].returnX(), branchPoints[i+1].returnY());

        branchPoints[i].age();  //ages the points after everything is done, also ensures for colouration.
        if (r < 139){
        r = r + 0.1;
        }
        if (g > 80){
        g = g - 0.1;
        }
        if (b > 43){
        b = b + 0.05;
        }
      }
    }
  }

  float returnLatestX(){
    return branchPoints[count].pX;
  }
  float returnLatestY(){
    return branchPoints[count].pY;
  }
  float returnLatestDir(){
    return dir;
  }
  int returnMaxPoints(){
    return maxPoints;
  }
  int returnCount(){
    return maxPoints;
  }
  void setDir(float newDir){  // method for changing the direction of growth
    dir = newDir;
  }
}

