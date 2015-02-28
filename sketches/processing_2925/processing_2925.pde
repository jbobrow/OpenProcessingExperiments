
class tree{
  float x1,y1,x2,y2; //position
  float theta;
  float branchWidth;
  float branchWidth0;
  float totalBranchLength;//length this branch can be.
  int nBranchDivisions; //the length of each line segment
  float percentBranchless; //it grows  at least this amount before branching more
  float branchSizeFraction;  //the branches are this much of the size at the split
  float dThetaGrowMax;
  float dThetaSplitMax;
  float oddsOfBranching; //the odds of branching at a given location.
  color myColor;

//constructor
  tree(float xI, float yI, float thetaI, float branchWidth0I,
  float totalBranchLengthI, int nBranchDivisionsI, 
  float percentBranchlessI, float branchSizeFractionI, 
  float dThetaGrowMaxI, float dThetaSplitMaxI,
  float oddsOfBranchingI, color colorI){
    x1 = xI;
    y1 = yI;
    x2 = xI;
    y2 = yI;
    theta = thetaI;
    branchWidth0 = branchWidth0I;
    branchWidth = branchWidth0;
    totalBranchLength =totalBranchLengthI;
    nBranchDivisions =nBranchDivisionsI;
    percentBranchless = percentBranchlessI;
    branchSizeFraction = branchSizeFractionI;
    dThetaGrowMax = dThetaGrowMaxI;
    dThetaSplitMax = dThetaSplitMaxI;
    oddsOfBranching = oddsOfBranchingI;
    myColor = colorI;
  }

//this does the drawing/growing!
  float lengthSoFar = 0;
  float nextSectionLength;
  void draw(){
    if(branchWidth<.5)//stop growing if it's too thin to render
      lengthSoFar = totalBranchLength;
    while(lengthSoFar<totalBranchLength){
      branchWidth = branchWidth0*(1-lengthSoFar/totalBranchLength);
      //do I need to split?
      if(lengthSoFar/totalBranchLength > percentBranchless){//if i can branch
        if(random(0,1)<oddsOfBranching){//and i randomly choose to
          stroke(myColor);
          //make a new branch there!
            (new tree(x1, y1, theta+randomSign()*dThetaSplitMax, branchWidth,
                      totalBranchLength*branchSizeFraction, nBranchDivisions, 
                      percentBranchless, branchSizeFraction, 
                      dThetaGrowMax, dThetaSplitMax,
                      oddsOfBranching, myColor)).draw();
        }
      }

      //change directions, grow forward 
      nextSectionLength = totalBranchLength/nBranchDivisions;
      lengthSoFar+=nextSectionLength;
      theta += randomSign()*random(0,dThetaGrowMax);
      x2 = x1+nextSectionLength*cos(theta);
      y2 = y1+nextSectionLength*sin(theta);
      //scale thickness by the distance it's traveled.
      strokeWeight(abs(branchWidth));
      stroke(myColor);
      line(x1,y1,x2,y2);
      if(addSnow){
        //initially, just a line on the upper half
        stroke(255);

        float dx =0;
        float dy =0;
        float overlapScaling = 1.2;
        if(theta <-PI/2){
          if(abs(PI+theta)<maxSnowTheta){
//            stroke(255,0,0);
            float snowThickness = constrain(abs(branchWidth)/2*(1-abs(theta+PI)/HALF_PI),0,abs(branchWidth)/2);
            if(snowThickness>0){
              strokeWeight(snowThickness);
              dx = (abs(branchWidth)-snowThickness)/2*cos(theta+PI/2)*overlapScaling;
              dy = (abs(branchWidth)-snowThickness)/2*sin(theta+PI/2)*overlapScaling;
              line(x1+dx-abs(branchWidth)*cos(theta)/4,y1+dy-abs(branchWidth)*sin(theta)/4,
                              x2+dx,y2+dy);
            }
          }
        }
        if(theta >-PI/2){
          if(abs(theta)<maxSnowTheta){
//            stroke(0,255,0);
            float snowThickness = constrain(abs(branchWidth)/2*(1-abs(theta)/HALF_PI),0,abs(branchWidth)/2);
            if(snowThickness>0){
              strokeWeight(snowThickness);
              dx = (abs(branchWidth)-snowThickness)/2*cos(theta-PI/2)*overlapScaling;
              dy = (abs(branchWidth)-snowThickness)/2*sin(theta-PI/2)*overlapScaling;
              line(x1+dx-abs(branchWidth)*cos(theta)/4,y1+dy-abs(branchWidth)*sin(theta)/4,
                              x2+dx,y2+dy);
            }
          }
        }
      }
      x1 = x2;
      y1 = y2;
    }
  }
}



