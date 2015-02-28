
// This program draws a flower of life grid with superimposed Tree of Life Diagram
// written by The Playful Geometer

ArrayList theMatrix = new ArrayList();

//HELPER METHODS
//plots a point that extends line AB by aLength and rotates the extension it about B by angal (fraction of circle) 
PVector extendBendPoint(PVector pointA, PVector pointB, float aLength, float angal){  
    PVector relativeB = new PVector(pointB.x, pointB.y);
    relativeB.sub(pointA);
    float vectorAngle = atan2(relativeB.y,relativeB.x);
    PVector bentPoint =  new PVector(pointB.x+cos(vectorAngle+angal*TWO_PI)*aLength,pointB.y+sin(vectorAngle+angal*TWO_PI)*aLength);
    return bentPoint;
}

//helper methods for accessing variables in theMatrix, the storage array for all circle centers in FOL
ArrayList getArrayList(ArrayList theList, int index){
  if (index<0){return ((ArrayList)(theList.get(theList.size()+index)));}
  else{return ((ArrayList)(theList.get(index)));}
}
PVector getPVector(ArrayList theList, int index){
  if (index<0){return ((PVector)(theList.get(theList.size()+index)));}
  else{return ((PVector)(theList.get(index)));}
}
PVector pointInMatrix(int folLayer, int hexagonLayer, int side, int thePoint){
  return getPVector(getArrayList(getArrayList(getArrayList(theMatrix, folLayer), hexagonLayer), side), thePoint);
}

//chops line up into a # of equidistant sections (points) and returns list of points
ArrayList pointsAlongLine(PVector p1, PVector p2, int points) {
  ArrayList pointList = new ArrayList(); 
  int axOperator;
  int ayOperator;
  float xdiff, ydiff;
 
  xdiff = Math.abs(p1.x - p2.x);
  ydiff = Math.abs(p1.y - p2.y);
  if (p1.x < p2.x){axOperator = 1;}
  else {axOperator = -1;}
  
  if (p1.y < p2.y){ayOperator = 1;}
  else {ayOperator = -1;}
  
  for (int i = 0 ; i< points-1; i++){
      float fract = float(i)/(points-1);
      float xval = p1.x +  axOperator*fract*xdiff;
      float yval = p1.y + ayOperator*fract* ydiff;
      pointList.add(new PVector(xval, yval));
  }

  pointList.add(p2);
  return pointList;
}

//plots a polar point given a radius and fraction of circle, circles starts at "12 oclock" and increases clockwise 
PVector polarPoint(float r, float a){
  PVector avec = new PVector(sin(a*2*PI)*r, cos(a*2*PI)*r*-1);
  return avec;
}


//creates a data set representing a rectangle for a path between two points
PVector[] pathBox(PVector p1, PVector p2, float thickness){
  PVector[] box =  {extendBendPoint(p1, p2, thickness, 0.25), extendBendPoint(p1, p2, thickness, 0.75), extendBendPoint(p2, p1, thickness, 0.25), extendBendPoint(p2, p1, thickness, 0.75)};
  return box;
}
    
void setup(){
  size(500,500);
  noLoop();
  
}

void draw(){  
  
  //STUFF TO PLAY WITH
  color backgroundColor = #000000;
  float folCircleRadius = 15;
  //NOTE: first variable in array changes least detailed FOL, last changes most detailed FOL
  int[] folLayerColors = {#7E00FF,#00FF3D,#FF9E00,#FF00C0}; 
  int[] numLayersInFol = {3,5, 9,17} ; //for each flower of life, determines how big (in radial layers) it will be
  boolean[] showFolLayer = {true, true, true, true};
  
  float folOutlineWidth = 1.4;
  
  float tolOutlineWidth = 1.4;
  color tolOutlineColor = #FFFFFF;
  
  color cScarlet = #FF0000;
  color cRedOrange = #FF5400;
  color cOrange = #FFA500;
  color cYellowOrange = #FFD100;
  color cYellow = #FFFF00;
  color cPaleYellow = #FEFFBF;
  color cYellowGreen =  #D3FF00;
  color cGreen = #228B22;
  color cPaleBlue = #C0D8F0;
  color cBlueGreen = #00FFFF;
  color cBlue = #0000FF;
  color cVioletBlue = #4B0082;
  color cViolet = #A020F0;
  color cVioletRed = #C71585;
  color cMalkuthUp = #E4D00A; //citrine
  color cMalkuthRight = #808000; //olive
  color cMalkuthDown = #000000; //black
  color cMalkuthLeft = #80461B; //russet
  
  color[] sphereFillColors = {#FFFFFF, #7F7F7F, #000000, #0000FF, #FF0000, #FFFF00, #228B22, #FFA500, #8A2BE2, #FFFFFF};
  float sphereRadius = 15;
  //spheres listed from 1-10
  boolean[] showSphere = {true, true, true, true, true, true, true, true, true, true};
  
  boolean showDaath = true;
  boolean daathDotted = false;
  color daathColor = color(255,255,255,150);
  
  //color scheme given corresponds to Paul Foster Case's Tarot attributions as now instructed by the B.O.T.A.
  color[] pathFillColors = {cPaleYellow, cYellow, cBlue, cGreen, cScarlet, cRedOrange, cOrange, cYellowOrange, cYellow, cYellowGreen, cViolet, cGreen, cPaleBlue, cBlueGreen, cBlue, cVioletBlue, cScarlet, cViolet, cVioletRed, cOrange, cScarlet, cVioletBlue};

  
  //calculate path thickness such that paths do not overlap at spheres
  PVector p1 = polarPoint(sphereRadius, 0);
  PVector p2 = polarPoint(sphereRadius, 1.0/12.0);
  float pathThickness = dist(p1.x, p1.y, p2.x, p2.y)/2;
  //float pathThickness = 5;
  boolean[] showPath = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true};
     
  translate(width/2, height/2);
  background(backgroundColor); 
  noFill();
 
  int grads=4;
  strokeWeight(folOutlineWidth);
  smooth();
  
  int[][][] circleCutoffHexad = { {{1,5},{1,7}}, {{3,7},{3,9}}, {{5,9},{5,11}}, {{7,11},{-5,1}}, {{-3,1},{-3,3}}, {{-1,3},{-1,5}}};
  int[][] circleCutoffSmall = {{3,5}, {5,7}, {7,9},{9,11}, {-1,1}, {1,3}};
  
  for (int h = grads; h>0 ; h--){
    if (showFolLayer[h-1]){
      //flowerGroup = new RGroup();
      theMatrix.add(new ArrayList());  //add whole flower of life layer 
      stroke(folLayerColors[grads-h]);
      ellipse(0,0,2*folCircleRadius, 2*folCircleRadius);
     
      // creates concentric hexagons upon which the circles are created
      for (int i = 0; i< numLayersInFol[h-1] ;i++){
        ArrayList hexagonFrame = new ArrayList();
        getArrayList(theMatrix, -1).add(new ArrayList());  //add concentric hexagon to flower of life
        //RGroup layerGroup = new RGroup();    
        //stroke(folLayerColors[i+1]);
        for (int j = 0; j<6;j++){
         hexagonFrame.add(polarPoint(i*folCircleRadius, float(j)/6)) ;
        }
         
         //each line of the invisible hexagon is equally divided into n points where n is the layer number
         //circles are plotted on these points
        for (int j=0; j<6;j++){
           
            ArrayList sidePoints = pointsAlongLine( ((PVector)(hexagonFrame.get(j))), ((PVector)(hexagonFrame.get((j+1)%6))), i+1);
            getArrayList(getArrayList(theMatrix,-1), -1).add(sidePoints);  //for each concentric hexagon, add a list of points for each side 
            for (int k=0 ;k< sidePoints.size()-1;k++) {
                PVector thisPoint = ((PVector)(sidePoints.get(k)));
                if (i== numLayersInFol[h-1] - 1){ //smaller outward facing arc
                  if (k != 0) {
                    
                    float startAngal = float(circleCutoffSmall[j][0])/12; 
                    //if (startAngal < 0){ startAngal = startAngal +1; } 
                    float endAngal = float(circleCutoffSmall[j][1])/12;
                    arc(thisPoint.x, thisPoint.y, 2*folCircleRadius, 2*folCircleRadius, startAngal*TWO_PI, endAngal*TWO_PI);
                  }
                    
                }
                else if (i==numLayersInFol[h-1] - 2){  // larger outward facing arc 
                  float startAngal = float(circleCutoffHexad[j][int(k!=0)][0])/12;
                  float endAngal = float(circleCutoffHexad[j][int(k!=0)][1])/12;
                  arc(thisPoint.x, thisPoint.y, 2*folCircleRadius, 2*folCircleRadius, startAngal*TWO_PI, endAngal*TWO_PI) ;
                }
                else{
                  ellipse(thisPoint.x, thisPoint.y, 2*folCircleRadius,2*folCircleRadius);
                }
            }             
        }
      }
         
    }
    folCircleRadius = folCircleRadius*2;
  }
 
  //draw TOL
  PVector[] spherePositions = {pointInMatrix(0,8,0,0), pointInMatrix(0,8,0,4),  pointInMatrix(0,8,5,4),  
  pointInMatrix(0,4,1,0), pointInMatrix(0,4,5,0), new PVector(0,0),  pointInMatrix(0,4,2,0), pointInMatrix(0,4,4,0), 
  pointInMatrix(0,4,3,0),pointInMatrix(0,8,3,0)  };//  pointInMatrix(0,4,0,0)}; // ;
  
  
    //ATU numbres            0      I      II    III    IV     V        VI    VII    VIII   IX      X      XI    XII    XIII  XIV     XV     XVI   XVII   XVIII  XIX     XX     XXI
  int[][] pathRelations = {{0,1}, {0,2}, {0,5}, {1,2}, {1,5}, {1, 3}, {5,2}, {2,4}, {3,4}, {5,3}, {3,6}, {4,5}, {4,7}, {5,6}, {5,8}, {5,7}, {6,7}, {6,8}, {6,9}, {7,8}, {7,9}, {8,9}};        
  
  stroke(tolOutlineColor);
  strokeWeight(tolOutlineWidth);
  for (int atu = 0; atu <22; atu++){
    if (showPath[atu]){
      PVector[] thisPathRect = pathBox(spherePositions[pathRelations[atu][0]], spherePositions[pathRelations[atu][1]], pathThickness);
      fill(pathFillColors[atu]);
      quad(thisPathRect[0].x,thisPathRect[0].y,thisPathRect[1].x,thisPathRect[1].y, thisPathRect[2].x,thisPathRect[2].y, thisPathRect[3].x,thisPathRect[3].y);   
    }
  }
  
  
  //DRAW SPHERES  
  
  //plot spheres 1-9
  stroke(tolOutlineColor);
  for (int i=0; i <9; i++){
    if(showSphere[i]){
      fill(sphereFillColors[i]);
      ellipse(spherePositions[i].x, spherePositions[i].y, 2*sphereRadius, 2*sphereRadius);
    }
  }
  
  //plot daath
  if (showDaath){
    PVector daathCenter = pointInMatrix(0,4,0,0);
    if (daathDotted){
      //no "dotted line" functionality in Processing, using a series of points 
      int numDots = 50;
      for (int i = 0; i < numDots; i++){
        PVector plotPoint = polarPoint(15, float(i)/numDots);
        point(plotPoint.x + daathCenter.x, plotPoint.y + daathCenter.y);
      }
      noStroke();
    }
    fill(daathColor);
    ellipse(daathCenter.x, daathCenter.y, 30, 30);
  }
  
  //plot Malkuth in quadrants
  if (showSphere[9]){
    stroke(tolOutlineColor);
    strokeWeight(tolOutlineWidth);
 
  
    // color definitions from wikipedia.org
    fill(cMalkuthUp); //citrine 
    arc(spherePositions[9].x, spherePositions[9].y, sphereRadius*2, sphereRadius*2, float(5)/8*TWO_PI, float(7)/8*TWO_PI);
    fill(	cMalkuthRight); //olive
    arc(spherePositions[9].x, spherePositions[9].y, sphereRadius*2, sphereRadius*2, float(-1)/8*TWO_PI, float(1)/8*TWO_PI);
    fill(cMalkuthDown); //black
    arc(spherePositions[9].x, spherePositions[9].y,sphereRadius*2, sphereRadius*2, float(1)/8*TWO_PI, float(3)/8*TWO_PI);
    fill(	cMalkuthLeft); //russet
    arc(spherePositions[9].x, spherePositions[9].y,sphereRadius*2, sphereRadius*2, float(3)/8*TWO_PI, float(5)/8*TWO_PI);
  }
}    


