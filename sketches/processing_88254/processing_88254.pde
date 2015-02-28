
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
PinkNoise pn;*/

//ALL MINIM CODE (Like 97% of it) stolen recklessly from the Minim examples: http://code.compartmental.net/minim/examples/AudioOutput/PinkNoiseSignal/PinkNoiseSignal.pde 
//The Minim code was making the web compiler nervous, so I cut it. Sorry, bro!

//Defineables to change the tree
int trunkWidth;
int trunkHeight;
int trunkCrook; //Chance that the trunk will be crooked (made of joined quads)
int numBranches; //How many branches on the tree?
int numLeaves; //How many leaves on the tree? Leaves can spawn on any main trunk branch
int branchVariation; //The likelihood a branch has sub-branches
int maxBranchLength;
int minBranchLength;
 
int trunkLeft;
int trunkRight;
int trunkTop;
int trunkBottom;
 
//Palettte definitions
color p1;
color p2;
color p3;
color p4;
color p5;
color[] palette = new color[5];
int colorIndex;
//For drawing the branch
int branchY; //temp, before it hits the array.
int branchLength;
int branchHeight;
int branchStep; //min y-distance between branches
int maxBranchHeight; // w/r to the step
int trunkSide;
int leftMod; //if its drawing off the left side of the tree, we need a neg x
int curBranchStep;
int[] branchLowX = new int[5];
int[] branchHighX = new int[5];
int[] branchLowY;
int[] branchHighY;
 
int scWidth = 700;
int scHeight = 700;
 
int cellHeight;
int cellWidth;
int rows;
int cols;
int totalCells;
 
void setup(){
  size(700,700);
  rows = 10;
  cols = 10;
  totalCells = rows * cols;
   
  cellHeight = height / cols;
  cellWidth = width / rows;
   
  colorIndex = 0;
  noStroke();
 //This palette utterly robbed from Kuler user shell_77345: https://kuler.adobe.com/#themes/search?term=userId:865692
    p1= color(23,76,79);
    p2= color(32,113,120);
    p3= color(255,150,102);
    p4= color(255,225,130);
    p5= color(245,233,190);
     
    palette[0] = p1;
    palette[1] = p2;
    palette[2] = p3;
    palette[3] = p4;
    palette[4] = p5;
    //Minim set up
//    minim = new Minim(this);
//  out = minim.getLineOut();
  // make a pink noise signal with an amplitude of 0.5
//  pn = new PinkNoise(0.05);
  // add the pink noise signal to the output
 // out.addSignal(pn); Uncomment if you want hideous whitenoise in your art!

  drawGrid();
}
 
void draw(){
}

void drawGrid(){
for (int x=0; x<rows; x++ ){
      colorIndex++;
       if(colorIndex > 4){colorIndex = 0;}
    for (int y=0; y<cols; y++ ){
       colorIndex++;
       if(colorIndex > 4){colorIndex = 0;}
       fill(palette[colorIndex]);
       rect(x * cellWidth, y * cellHeight, cellHeight, cellWidth);
       imagineTree(x * cellWidth, y * cellHeight + cellHeight);    
      }
    }
}
 
void imagineTree(int tX, int tY) { //where tX and tY are the co-ords of the cell
  fill(255);
    numBranches = int(random(1,6));
    trunkCrook = 0;
    trunkWidth = int(random(12,30));
    trunkHeight = int(random(30,60));
    minBranchLength = 5;
    maxBranchLength = 20;
     
    trunkLeft = tX + cellWidth / 2 - trunkWidth / 2; //The left side of the trunk ( with a Centered x origin)
    trunkRight = trunkLeft + trunkWidth;
 
    trunkTop = tY - trunkHeight ;
    trunkBottom = trunkTop + trunkHeight;
    curBranchStep = trunkBottom; //cast it now.
  branchY = trunkBottom;
  rect(trunkLeft, trunkTop, trunkWidth, trunkHeight); //center the x origin. consider quads for tree bend
  drawBranches();
}
 
void drawBranches() {
  branchStep = floor(trunkHeight / numBranches);
  
  for (int i = 0; i < numBranches; i++) {
    curBranchStep -= branchStep;
    branchLength = floor(random(minBranchLength,maxBranchLength));
    branchHeight = floor(random(2,8));
    if(int(random(1,3)) == 1){ //not really a smart way to do this!
      trunkSide = trunkLeft;
      leftMod = -1;
    }
    else{
      trunkSide = trunkRight;
      leftMod = 1;
    }
    branchY = int(random(curBranchStep, curBranchStep - branchStep)); //get a y pos btw here and the next step up
    if(branchY < trunkTop){branchY = trunkTop;}
    colorIndex = int(random(1,4));
    fill(palette[colorIndex]);
    rect(trunkSide, branchY, branchLength * leftMod, branchHeight);
     
    if(trunkSide == trunkRight){branchLowX[i] = trunkRight; branchHighX[i] = trunkRight + branchLength;}
    else{branchLowX[i] = trunkLeft - branchLength; branchHighX[i] = trunkLeft;}
     
    colorIndex = int(random(1,5));
    fill(palette[colorIndex]);
    drawSubbranch(branchLowX[i],branchHighX[i],branchY,branchHeight);
  }
}
 
void drawSubbranch(int lowX, int highX, int bY, int bH){
  for(int i = 0; i < int(random(1,3)); i++){
    int subX = int(random(lowX,highX));
    int subYLen = int(random(1,branchStep));
    int rX = int(random(5,10)); //width of up or down facing branches
    if(int(random(0,10)) < 5){rect(subX,bY,rX,subYLen * -1);}
    else {rect(subX,bY + bH ,rX,subYLen);}
  }
}
 
void mouseClicked(){
  drawGrid();
   print("clickin");
}
/* NO MINIM FOR YOU, WEB COMPILER
void mouseMoved()
{
  float amp = map(mouseY, 0, height, 1, 0);
  float pan = map(mouseX, 0, width, -1, 1);
  pn.setAmp(amp);
  pn.setPan(pan);
}
*/


