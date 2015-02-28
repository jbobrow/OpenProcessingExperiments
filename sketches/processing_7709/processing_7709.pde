
// This program draws a hexagon grid (like a honeycomb patterns)
// The radius of the hexagons, however, changes with respect to the mouseX
// producing interesting intersection patterns
// This code is easily modified to create SVG images useful for graphic design
//
// written by The Playful Geometer

import processing.xml.*;
import geomerative.*;

import java.util.Vector; 
import java.util.List;

import java.lang.Math;


import prosvg.*;

RPoint polarPoint(float r, float a){
  RPoint avec = new RPoint(Math.sin(a*2*Math.PI)*r  , Math.cos(a*2*Math.PI)*r);
  return avec;
}

Vector pointsAlongLine(RPoint p1, RPoint p2, int points) {
  Vector pointList = new Vector(); 
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
      pointList.add(new RPoint(xval, yval));
  }

  pointList.add(p2);
  return pointList;
}

RPath getHexagon(RPoint centre, float radius){
  
  RPoint[] hexPts = new RPoint[6];
  RPoint thisPoint = new RPoint();
  
  for (int i = 0 ; i<6;i++){
    thisPoint = polarPoint(radius, float(i)/6.0 + 1.0/12.0 );
    thisPoint.add(centre);
    hexPts[i] = thisPoint;
  }
  RPath hexPath = new RPath(hexPts);
  hexPath.addClose();
  return hexPath;
}
    

      
void setup(){
  RG.init(this);
  size(600,600);
  smooth();
  
}


float muxSpace;

void draw(){  
  RGroup docGroup;
  
  //centre display on 0,0
  translate(width/2, height/2);

  background(0);
  
   
  noFill();
    
  float distFromHex;
  int h;
  RGroup latticeGroup = new RGroup();
  RPath thisHexagon;
  
  
  // ### STUFF TO PLAY WITH ###
  float radius = 30;
  
  int level = 5;
  
  //Mouse animation
  muxSpace = ((float)mouseX)/width * 4;
  float drawRad = radius*muxSpace; 
  
  ////Use this for static image generation and remove mouse animation code above
  //float drawRad = radius; 
  //######################
  
    
  
  //GROUPING CODE REMOVED BECAUSE GROUPS ARE NOT PRESERVED ON SVG EXPORT
  //flowerGroup = new RGroup();
  
  //this ratio is used to calculate the radius of the "hexagon frame" with respect to the drawn hexagons radius
  distFromHex = ((float)(radius*Math.sin((0.5-1.0/6)*2*Math.PI)/Math.sin(1.0/12*2*Math.PI)));
    
   
  
  thisHexagon = getHexagon(new RPoint(0,0),drawRad);
  latticeGroup.addElement(thisHexagon);    
  
  for (int i = 0; i<level-1;i++){
    Vector hexagonFrame = new Vector();
    RGroup layerGroup = new RGroup();
    
    //stroke(colors[i+1]);
    
    //for each ring of hexagons surrounding the central hexagon
    //this generates a frame on which the surrounding hexagons are "hung"
    for (int j = 0; j<6;j++){
     hexagonFrame.add(polarPoint(i*distFromHex, float(j)/6.0)) ;
    }
     
     //each line of the hexagon frame is equally divided into n points where n is the layer number
     //hexagons are plotted on these points
    for (int j=0; j<6;j++){
        Vector sidePoints = pointsAlongLine( ((RPoint)(hexagonFrame.get(j))), ((RPoint)(hexagonFrame.get((j+1)%6))), i+1);
        for (int k=0 ;k< sidePoints.size()-1;k++){
            RPoint thisPoint = ((RPoint)(sidePoints.get(k)));
            thisHexagon = getHexagon(new RPoint(thisPoint.x,thisPoint.y), drawRad);
            //thisHexagon.draw();
            layerGroup.addElement(thisHexagon);
        }
    }
    
    
    latticeGroup.addGroup(layerGroup);
    //flowerGroup.draw();
   
   
  }
  
  radius = radius*2;
  level = level/2;
  
  fill(0,255,0,30);
  noStroke();
  latticeGroup.draw();
  strokeWeight(1);
  noFill();
  stroke(0);
  latticeGroup.draw();
  
  
  
    
    
    

  

  ////UNCOMMENT HERE TO EXPORT SVG
  ////TODO: find out best way to eliminate svg rendering duplication in draw()  
  //saveFrame("testHex.svg");
}    


  
  
  




