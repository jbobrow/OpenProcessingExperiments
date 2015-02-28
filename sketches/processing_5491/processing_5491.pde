
int width  = 800;
int height = 600;

float theta;

int numTrees = 0;

color backgroundColor = color(200);
color treeColor       = color(100,63,1);
 
void setup() { 
    // Set-Up Canvas for Drawing
    smooth();
    size(width, height);
    
    frameRate(10);
    noFill();
}
 
void draw() {
    frameRate(1);
    numTrees++;

    noStroke(); 
    
    // Background
    color c1 = color(255, 255, 255);
    color c2 = color(100,63,1);
    setGradient(0, 0, width, height, c1, c2, 1);

  float a = (mouseX / (float) width) * 90f;
  theta = radians(a);  
   drawTree(random(width), height, -HALF_PI, 10, 
                   300, 30,
                   .3, .5,
                   PI/15, PI/6, 
                   .3, color(treeColor)); 
}

void blankScreen() { 
  fill(backgroundColor); 
  noStroke(); 
  rect(0,0,width,height); 
}
 
int randomSign() {
  return (round(random(1))*2)-1;
} 

//class tree { 

 
void drawTree(float xI, float yI, float thetaI, float branchWidth0I, 
      float totalBranchLengthI, int nBranchDivisionsI,  
      float percentBranchlessI, float branchSizeFractionI,  
      float dThetaGrowMaxI, float dThetaSplitMaxI, 
      float oddsOfBranchingI, color colorI) { 
    
  float x1,y1,x2,y2; //position 
  float theta; 
  float branchWidth; 
  float branchWidth0; 
  float totalBranchLength;//length this branch can be. 
  int   nBranchDivisions; //the length of each line segment 
  float percentBranchless; //it grows  at least this amount before branching more 
  float branchSizeFraction;  //the branches are this much of the size at the split 
  float dThetaGrowMax; 
  float dThetaSplitMax; 
  float oddsOfBranching; //the odds of branching at a given location. 
  color myColor;
  
  
  x1 = xI; 
  y1 = yI; 
  x2 = xI; 
  y2 = yI; 
  theta = thetaI; 
  branchWidth0 = branchWidth0I; 
  branchWidth = branchWidth0; 
  totalBranchLength = totalBranchLengthI; 
  nBranchDivisions = nBranchDivisionsI; 
  percentBranchless = percentBranchlessI; 
  branchSizeFraction = branchSizeFractionI; 
  dThetaGrowMax = dThetaGrowMaxI; 
  dThetaSplitMax = dThetaSplitMaxI; 
      oddsOfBranching = oddsOfBranchingI; 
  myColor = colorI; 
 
  //this does the drawing/growing! 
  float lengthSoFar = 0; 
  float nextSectionLength; 
    if(branchWidth<.5) //stop growing if it's too thin to render 
      lengthSoFar = totalBranchLength; 
      
    while(lengthSoFar<totalBranchLength) { 
      branchWidth =branchWidth0*(1-lengthSoFar/totalBranchLength); 
    
          //change directions, grow forward  
      nextSectionLength = totalBranchLength/nBranchDivisions; 
      lengthSoFar+=nextSectionLength; 
      theta += randomSign()*random(0,dThetaGrowMax); 
      x2 = x1+nextSectionLength*cos(theta); 
      y2 = y1+nextSectionLength*sin(theta); 
      
      //scale thickness by the distance it's traveled. 
      strokeWeight(abs(branchWidth)); 
      stroke(myColor);
      // rotate(theta);
      line(x1,y1,x2,y2); 
      
      //do I need to split? 
      if(lengthSoFar/totalBranchLength > percentBranchless) { //if i can branch 
        if(random(0,1) < oddsOfBranching) { //and i randomly choose to 
          stroke(myColor); 
          //make a new branch there! 
            drawTree(x1, y1, theta+randomSign()*dThetaSplitMax, branchWidth, 
                      totalBranchLength*branchSizeFraction, nBranchDivisions,  
                      percentBranchless, branchSizeFraction,  
                      dThetaGrowMax, dThetaSplitMax, 
                      oddsOfBranching, myColor); 
        } 
      } 
 

      
      x1 = x2; 
      y1 = y2; 
    } 
  } 
//} 



void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);

  // choose axis
  if(axis == 1){
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  }  
  else if(axis == 0){
    // column 
    for (int i=y; i<=(y+h); i++){
      // row
      for (int j = x; j<=(x+w); j++){
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)),
        (green(c1)+(j-x)*(deltaG/h)),
        (blue(c1)+(j-x)*(deltaB/h)) 
          );
        set(j, i, c);
      }
    }  
  }
}



