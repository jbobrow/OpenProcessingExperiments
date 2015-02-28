
// This program draws a flower of life grid of specified depth
// written by The Playful Geometer

import processing.xml.*;
import geomerative.*;

import java.util.Vector; 
import java.lang.Math;


import prosvg.*;


//returns a point given a radius and an angle expressed as a fraction (of distance around a circle starting at "12 oclock")
RPoint polarPoint(float r, float a){
  RPoint avec = new RPoint(Math.sin(a*2*Math.PI)*r  , Math.cos(a*2*Math.PI)*r);
  return avec;
}

//chops line up into a # of equidistant sections (points) and returns dividing points and p2 (but not p1)  
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
      
void setup(){
  RG.init(this);
//  //For SVG generation
//  size(500,500,"prosvg.SVGKdl");
  size(500,500,P3D);
  
}

void draw(){  
  RGroup docGroup;
      
  
  
  // Initilaize the sketch
  //int[] colors = {#00006F,#FF00FF,#0000FF,#00FF00,#FFFF00,#FF8A00,#FF0000};
  int[] colors = {#7E00FF,#00FF3D,#FF9E00,#FF00C0  };
    
  translate(width/2, height/2);
  
  //camera animation by mouse
  float eyeY = mouseY/1.5;
  float eyeZ = mouseX*1.5;
  camera(0,eyeY ,eyeZ , // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
    
  frameRate( 100 );
  background(0); 
  noFill();
  int h;
  //docGroup = new RGroup();
    
  //STUFF TO PLAY WITH
  int grads=4;
  float radius = 15;
  //float strWeight = grads;
  strokeWeight(1);
  smooth();
  int level=(int )Math.pow(2,grads);
  
  
  //GROUPINGS REMOVED DUE TO LACK OF SVG EXPORT SUPPORT
  //RGroup flowerGroup = new RGroup();
  RShape thisCircle;
  for (h = grads; h>0 ; h--){
    //flowerGroup = new RGroup();
       
    //stroke(colors[0]);
    stroke(colors[grads-h]);
    
    thisCircle = RShape.createCircle(0,0,2*radius);
    thisCircle.draw();
    //flowerGroup.addElement(thisCircle);
    
    // creates concentric hexagons upon which the circles are created
    for (int i = 0; i<level-1;i++){
      Vector hexagonFrame = new Vector();
      //RGroup layerGroup = new RGroup();    
      //stroke(colors[i+1]);
      for (int j = 0; j<6;j++){
       hexagonFrame.add(polarPoint(i*radius, float(j)/6)) ;
      }
       
       //each line of the invisible hexagon is equally divided into n points where n is the layer number
       //circles are plotted on these points
      for (int j=0; j<6;j++){
          Vector sidePoints = pointsAlongLine( ((RPoint)(hexagonFrame.get(j))), ((RPoint)(hexagonFrame.get((j+1)%6))), i+1);
          for (int k=0 ;k< sidePoints.size()-1;k++){
              RPoint thisPoint = ((RPoint)(sidePoints.get(k)));
              thisCircle = RShape.createCircle(thisPoint.x,thisPoint.y, 2*radius);
              thisCircle.draw();
              //layerGroup.addElement(thisCircle);
          }
              
              
              
      }
      //flowerGroup.addGroup(layerGroup);
      //flowerGroup.draw();
     
     
    }
    
    radius = radius*2;
    level = level/2;
    
    
    
  }
   
  ////uncomment for SVG export   
  //saveFrame("testFlower.svg");
}    
  
  




