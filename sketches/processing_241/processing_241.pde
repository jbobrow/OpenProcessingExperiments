
/**
 * Color mode: 3-color or gradient.<br>
 * Loose angles: Let lines deviate from shape normals<br>
 * Curl: If loose angles are enabled, make them tend to curl in one direction<br>
 * <br>
 * 5/8/08: Removed options no one will care about, cleaned up the interface<br>
 * 5/7/08: Option to randomize child nodes, resulting in much bigger figures<br>
 * 5/2/08: Added overlap avoidance, increased size of figures to compensate, tweaked label layout<br>
 * <br>
 * Email srj 15 @t case.edu with questions. The code is barely commented.
 */

import java.util.*;
import processing.pdf.*;

boolean pdfDump = false;   //Dump 50 images to a PDF instead of using the interface
boolean isApplet = true;  //disables PDF saving

boolean constrainLoosely = true;   //allow wiggle room for polygon angles; affected by curlDirection
boolean varyLineWeight = true;     //thinner for children
boolean nodeColorMode = true;     //true = mutate children, false = use 3-color scheme
int curlDirection = 0;             //0 = none, 1 = ccw, 2 = cw

//Hidden options
boolean checkOverlap = true;       //do not create a node if it will overlap another
boolean lopsided = true;           //use different weights for each child branch of a node
boolean moreLopsided = true;       //use different line lengths for each child branch
boolean randomizeWeight = true;    //vary rate of decrease (sometimes increase) - makes things generally big and complicated
float weightDecrease = 0.16;       //size change for children
float baseDistance = 100;          //standard line length
int colorMutateRadius = 50;        //color variation (0-128)

//Internal stuff
Random rand = new Random();
color col[] = new color[3];
int[] shapeKinds = new int[3];
int numShapeKinds = 5;
boolean[] shapeEnabled;
String[] shapeName;
int shapesEnabled;
ArrayList shapes = new ArrayList();
int imageNumber = 0;
float leftBound, rightBound, topBound, bottomBound;
PFont font;
boolean regenerate = true; //notification to regenerate during draw loop
boolean recorded = false;  //current image has been saved to PDF

void setup()
{
  if(pdfDump)
    size(800,800,PDF,"Image Dump.pdf");
  else
    size(800,800,JAVA2D);
  smooth();
  font = createFont("FFScala", 10);
  shapeEnabled = new boolean[numShapeKinds];
  for(int i=0;i<numShapeKinds;i++)
    shapeEnabled[i] = true;
  shapeEnabled[3] = false;
  shapeEnabled[4] = false;

  shapeName = new String[numShapeKinds];
  shapeName[0] = "Circle";
  shapeName[1] = "Square";
  shapeName[2] = "Triangle";
  shapeName[3] = "Rotated Square";
  shapeName[4] = "Rotated Triangle";
  shapesEnabled = numShapeKinds;
}

void draw()
{
  noLoop();
  background(255);

  if(pdfDump)
    massDump();
  else {
    drawLabelBackground();
    if(regenerate)
    {
      regenerate = false;
      initColors();
      shapes.clear();
      grow(width/2,height/2,0,1.0,0,col[0]);
    }

    redrawFigure();
    drawLabels();
  }
}

void drawLabelBackground()
{
  noStroke();
  fill(230); 
  rect(0,height-numShapeKinds*15-15*6,200,15*4);
  fill(230); 
  rect(0,height-numShapeKinds*15-15,200,4+numShapeKinds*15+15);
}

void drawLabels()
{
  textFont(font); 
  fill(0);
  for(int i=numShapeKinds-1;i>=0;i--)
  {
    String s3 = "off";
    if(shapeEnabled[i]) s3 = "on";
    text((i+1)+": "+s3+" ("+shapeName[i]+")",3,height-4-(numShapeKinds-i-1)*15);
  }
  text("Numbers: Toggle shapes",3,height-4-numShapeKinds*15);

  String s1 = ""; 
  if(recorded) s1 = "(image"+imageNumber+")";
  String s2 = "off"; 
  if(lopsided) s2 = "on";
  String s4 = "off"; 
  if(moreLopsided) s4 = "on";
  String s6 = "off"; 
  if(constrainLoosely) s6 = "on";
  String s11 = "off"; 
  if(randomizeWeight) s11 = "on";
  String s9 = "3-color";
  if(nodeColorMode) s9 = "gradient";
  String s10 = "off"; 
  if(checkOverlap) s10 = "on";
  String s7 = "No curl";
  if(curlDirection == 1) s7 = "CCW curl";
  if(curlDirection == 2) s7 = "CW curl";
  String s8 = "off"; 
  if(varyLineWeight) s8 = "on";
  
  if(!isApplet) text("R: Save current image "+s1,3,height-4-numShapeKinds*15-15*7);
  text("Space: Generate new image",3,height-4-numShapeKinds*15-15*6);
  text("C: Color mode ("+s9+")",3,height-4-numShapeKinds*15-15*5);
  text("L: Loose angles ("+s6+")",3,height-4-numShapeKinds*15-15*4);
  text("Q, W, E: Set curl for loose constraints",3,height-4-numShapeKinds*15-15*3);
  text("Current direction: "+s7,3,height-4-numShapeKinds*15-15*2);

  
  //text("Z: Randomize size ("+s11+")",3,height-4-numShapeKinds*15-15*9);
  //text("O: Overlap avoidance ("+s10+")",3,height-4-numShapeKinds*15-15*8);
  //text("D: Line variation ("+s8+")",3,height-4-numShapeKinds*15-15*3);
  //text("S: Line asymmetry ("+s4+")",3,height-4-numShapeKinds*15-15*2);
  //text("A: Shape asymmetry ("+s2+")",3,height-4-numShapeKinds*15-15*1);
}

void keyPressed()
{
  if(!isApplet && key == 'r')
  {
    beginRecord(PDF,"image"+(++imageNumber)+".pdf");
    redrawFigure();
    endRecord();
    recorded = true;
  }
  //if(key == 'o') checkOverlap = !checkOverlap;
  //if(key == 'a') lopsided = !lopsided;
  //if(key == 's') moreLopsided = !moreLopsided;
  //if(key == 'z') randomizeWeight = !randomizeWeight;
  if(key == 'l') constrainLoosely = !constrainLoosely;
  if(key == 'c') nodeColorMode = !nodeColorMode;
  if(key == 'd') varyLineWeight = !varyLineWeight;
  if(key == 'q') curlDirection = 1;
  if(key == 'w') curlDirection = 0;
  if(key == 'e') curlDirection = 2;
  if(key == ' ')
  {
    regenerate = true;
    recorded = false;
  }
  for(int i=0;i<numShapeKinds;i++)
  {
    String temp = Integer.toString(i);
    if(key == 49+i)
      if(shapeEnabled[i] == false)
      {
        shapeEnabled[i] = true;
        shapesEnabled++;
      }
      else
        if(shapesEnabled > 1)
        {
          shapeEnabled[i] = false;
          shapesEnabled--;
        }
  }
  loop();
}

void massDump()
{
  PGraphicsPDF pdf = (PGraphicsPDF) g;
  for(int i=0;i<50;i++)
  {
    initColors();
    shapes.clear();
    if(i != 0) pdf.nextPage();
    grow(width/2,height/2,0,1.0,0,0);
    redrawFigure();
  }
  exit();
}

void redrawFigure()
{
  float centerX = (leftBound + rightBound)/2;
  float centerY = (topBound + bottomBound)/2;
  float magnification = (width)/(rightBound-leftBound);
  if((height)/(bottomBound-topBound) < magnification) magnification = (height)/(bottomBound-topBound);
  pushMatrix();
  scale(magnification);
  translate(-leftBound+(width-(rightBound-leftBound)*magnification)/2,-topBound+(height-(bottomBound-topBound)*magnification)/2);
  for(int i=0;i<shapes.size();i++)
  {
    Shape s = (Shape)shapes.get(i);
    s.draw();
  }
  popMatrix();
}

