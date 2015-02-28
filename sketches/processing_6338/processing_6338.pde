
// most basic branching test:
// Draw a straight line for a little while
// If chance of branching is exceeded, then add another branch
int i=0;
int totalBranches=10000; 
int numTrunks=10;
float  dimX=924,dimY=450; 
float branchOdds=.02;
float moveDistance=2;
int trunkWidth=20;
tree[] trees;
int branchesSoFar=-1;
float newBranchSpinAgleMax=PI;
float minAngle=PI*.0015,maxAngle=PI*1.1;

void setup(){
  size(int(dimX),int(dimY));
  trees = new tree[totalBranches]; 
  background(255,255,255); 
  for(i=0;i<numTrunks;i++){
    trees[i] = new tree(random(dimX),dimY,branchOdds,trunkWidth,moveDistance,minAngle,maxAngle,#000000,0);
    branchesSoFar++;
  }
  smooth();
  
}

void draw(){

    for(i=0;i<branchesSoFar;i++){
     // print(i);
    trees[i].draw();
  }
    fill(255,5);
   // rect(0,0,dimX,dimY);
}
int randomSign(){ //returns +1 or -1
  float num = random(1);
  if(num<.5)
    return -1;
  else
    return 1;
}

void mousePressed(){
  branchesSoFar=0;
  fill(255); 
  rect(0,0,dimX,dimY);

  for(i=0;i<numTrunks;i++){
    trees[i] = new tree(random(dimX),dimY,branchOdds,mouseX/20,moveDistance,minAngle*mouseY/50,maxAngle,#000000,0);
    branchesSoFar++;
  }
 
}

class tree{
  int bWidth; 
  float x1,x2,y1,y2=0; 
  float bOdds;
  float mDistance;
  color bColor; 
  float bSeg; 
  int bGeneration; 
  float mnAngle,mxAngle; 
  float currentAngle=PI;
  
  tree(float sx, float sy, float branchOdds, int branchWidth, float moveDistance, float minAngle, float maxAngle, color branchColor, int branchGeneration){
    bWidth=branchWidth; 
    x1=sx;
    y1=sy;    
    y2=y1;
    x2=x1;
    bOdds=branchOdds;
    mDistance=moveDistance;
    bColor=branchColor;
    bSeg=0;  
    bGeneration=branchGeneration;
    mnAngle=minAngle;
    mxAngle=random(minAngle) * randomSign();
}

 
  void draw(){
    if (x1>0 && y1>0){
     
      strokeWeight(bWidth);
      if (bWidth>=1) { 
        // Draw next segment 10 paces up. 
        currentAngle+=mxAngle;
        //print ('\n'+currentAngle+" ");
        x2=x2 + sin(currentAngle)*moveDistance;
        y2=y2 + cos(currentAngle)*moveDistance;;
        stroke(bColor);
        line(x1,y1,x2,y2); 
        x1=x2;
        y1=y2;
        if (random(1)<bOdds){
          branchesSoFar++;
          //print("added"); 
          color newColor=color(10*bGeneration,10*bGeneration,10*bGeneration,155);
          int newWidth=int(trunkWidth-bGeneration*2);
          float newAngle=mnAngle*1.35;
          trees[branchesSoFar] = new tree(x2,y2,bOdds,bWidth,moveDistance,newAngle,maxAngle,newColor,bGeneration+1);
        }
        bSeg++;
        if (bSeg/10==int(bSeg/10)){
          bWidth--;
        }
      }
    }
  }
}

