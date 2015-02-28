
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////  Import_Dxf_V_1_0                                  ///////////////////////////////////////////////////
///////  .............................................     ///////////////////////////////////////////////////
///////  Diewald Thomas, iam.tugraz.at   Dezember 2008     ///////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////  Imports dxf-objects type of:   Layer      ("AcDbLayerTableRecord")    ///////////////////////////////
///////                                 PolyLine   ("AcDbPolyline")            ///////////////////////////////
///////                                 Line       ("AcDbLine")                ///////////////////////////////
///////                                 Circle     ("AcDbCircle")              ///////////////////////////////
///////                                 Ellipse    ("AcDbEllipse")             ///////////////////////////////
///////                                 Arc        ("AcDbArc")                 ///////////////////////////////
///////                                 Point      ("AcDbPoint")               ///////////////////////////////
///////                                 AutoCad Color Index ... ACI            ///////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*

___________________________________________________________________________________________________________
-------- ??? commands, functions ??? ----------------------------------------------------------------------


___________________________________________________________________________________________________________
--------------------------------- dxf -----------------------------------
functions: 
   dxf[].printValues                      ...... prints the values for all imported objects including all layers
   dxf[].drawAll( true/false )            ...... draws everything visible as in Autocad or Archicad etc.
                                          ...... true:  imported dxf-values are used for: strokeWeight(), stroke(), noFill()  
                                          ...... false: takes the default values of processing
   dxf[].drawPolyLines( true/false )      ...... draws all visible polyLines
   dxf[].drawSingleLines( true/false );   ...... draws all visible normal lines
   dxf[].drawCircles( true/false );       ...... draws all visible circles and arcs
   dxf[].drawEllipses( true/false );      ...... draws all visible ellipses
   dxf[].drawSinglePoints( true/false );  ...... draws all visible points   
___________________________________________________________________________________________________________
--------------------------------- layer -----------------------------------
variables: 
   dxf[].layer[].name                     ...... (String) name of the layer  
   dxf[].layer[].lineType                 ...... (String) lineType of the layer e.g. "points", "verdeckt", etc.
   dxf[].layer[].colorIndex               ...... (int) indexNumber to get the color from the ACI (Autocad-Color-Index)
   dxf[].layer[].lineWeight               ...... (float) strokeWeight value for the objects on the layer
   dxf[].layer[].visible                  ...... (boolean) layer is visible (true) or is not visible(false)

functions:
   dxf[].layer[].printValues()                 ...... prints out all values for this layers: name, linyType, ...
   dxf[].layer[].drawAll( true/false )         ...... draws all objects on this layer
   dxf[].layer[].drawPolyLines( true/false )   ...... draws all polyLines on this layer
   dxf[].layer[].drawSingleLines( true/false ) ...... draws all singleLines on this layer
   dxf[].layer[].drawCircles( true/false )     ...... draws all circles and arcs on this layer
   dxf[].layer[].drawEllipses( true/false )    ...... draws all ellipses on this layer
   dxf[].layer[].drawSinglePoints( true/false )...... draws all singlepoints on this layer  
___________________________________________________________________________________________________________
--------------------------------- polyLine -----------------------------------
variables:
   dxf[].polyLine[].layer                    ...... (String) name of the layer the polyLine is on 
   dxf[].polyLine[].lineType                 ...... (String) lineType of the layer e.g. "points", "verdeckt", etc.
   dxf[].polyLine[].colorIndex               ...... (int) indexNumber to get the color from the ACI (Autocad-Color-Index)
   dxf[].polyLine[].colorRGB                 ...... (color) color(r,g,b) for the polyLine, same as in autocad.
   dxf[].polyLine[].lineWeight               ...... (float) strokeWeight
   dxf[].polyLine[].visible                  ...... (boolean) depends on the layer status: visible is true or false
   dxf[].polyLine[].knots                    ...... (int) number of points of the polyLine 
   dxf[].polyLine[].segments                 ...... (int) number of segments of the polyLine 
   dxf[].polyLine[].closed                   ...... (boolean) true if closed, false if open
   dxf[].polyLine[].elevation                ...... (float) elevation in the z-axis
   dxf[].polyLine[].controlPoint[].x         ...... (float) x-position of the controlPoint of the PolyLine 
   dxf[].polyLine[].controlPoint[].y         ...... (float) y-position of the controlPoint of the PolyLine 
   dxf[].polyLine[].controlPoint[].z         ...... (float) z-position of the controlPoint of the PolyLine 

functions:
   dxf[].polyLine[].printValues()            ...... prints out all values for this polyLine
   dxf[].polyLine[].drawAll()                ...... draws this polyLine
___________________________________________________________________________________________________________
--------------------------------- singleLine -----------------------------------
variables:
   dxf[].singleLine[].layer                    ...... (String) name of the layer the singleLine is on 
   dxf[].singleLine[].lineType                 ...... (String) lineType of the layer e.g. "points", "verdeckt", etc.
   dxf[].singleLine[].colorIndex               ...... (int) indexNumber to get the color from the ACI (Autocad-Color-Index)
   dxf[].singleLine[].colorRGB                 ...... (color) color(r,g,b) for the singleLine, same as in autocad.
   dxf[].singleLine[].lineWeight               ...... (float) strokeWeight
   dxf[].singleLine[].visible                  ...... (boolean) depends on the layer status: visible is true or false
   dxf[].singleLine[].controlPoint[].x         ...... (float) x-position of the controlPoint of the singleLine 
   dxf[].singleLine[].controlPoint[].y         ...... (float) y-position of the controlPoint of the singleLine 
   dxf[].singleLine[].controlPoint[].z         ...... (float) z-position of the controlPoint of the singleLine 

functions:
   dxf[].singleLine[].printValues()            ...... prints out all values for this singleLine
   dxf[].singleLine[].drawAll()                ...... draws this singleLine
___________________________________________________________________________________________________________
--------------------------------- circle (and arc) -----------------------------------
variables:
   dxf[].circle[].layer                    ...... (String) name of the layer the circle is on 
   dxf[].circle[].lineType                 ...... (String) lineType of the layer e.g. "points", "verdeckt", etc.
   dxf[].circle[].colorIndex               ...... (int) indexNumber to get the color from the ACI (Autocad-Color-Index)
   dxf[].circle[].colorRGB                 ...... (color) color(r,g,b) for the circle, same as in autocad.
   dxf[].circle[].lineWeight               ...... (float) strokeWeight
   dxf[].circle[].visible                  ...... (boolean) depends on the layer status: visible is true or false
   dxf[].circle[].axis1                    ...... (float) width of the circle (radius)
   dxf[].circle[].axis2                    ...... (float) heigth of the circle (radius)
   dxf[].circle[].startAngle               ...... (float) only if its an arc, if its an circle the value = 0 (0);
   dxf[].circle[].endAngle                 ...... (float) only if its an arc, if its an circle the value = 360 (TWO_PI);
   dxf[].circle[].centerX                  ...... (float) center (x-direction)
   dxf[].circle[].centerY                  ...... (float) center (y-direction)
   dxf[].circle[].centerZ                  ...... (float) center (z-direction)
   
functions:
   dxf[].circle[].printValues()            ...... prints out all values for this circle
   dxf[].circle[].drawAll()                ...... draws this circle
___________________________________________________________________________________________________________
--------------------------------- ellipse  -----------------------------------
variables:
   dxf[].ellipse[].layer                    ...... (String) name of the layer the ellipse is on 
   dxf[].ellipse[].lineType                 ...... (String) lineType of the layer e.g. "points", "verdeckt", etc.
   dxf[].ellipse[].colorIndex               ...... (int) indexNumber to get the color from the ACI (Autocad-Color-Index)
   dxf[].ellipse[].colorRGB                 ...... (color) color(r,g,b) for the ellipse, same as in autocad.
   dxf[].ellipse[].lineWeight               ...... (float) strokeWeight
   dxf[].ellipse[].visible                  ...... (boolean) depends on the layer status: visible is true or false
   dxf[].ellipse[].axis1                    ...... (float) width of the ellipse (radius)
   dxf[].ellipse[].axis2                    ...... (float) heigth of the ellipse (radius)
   dxf[].ellipse[].startAngle               ...... (float) if closed: this value is 0 (0);
   dxf[].ellipse[].endAngle                 ...... (float) if closed: this value is 360 (TWO_PI);
   dxf[].ellipse[].rotation                 ...... (float) rotation of the ellipse
   dxf[].ellipse[].centerX                  ...... (float) center (x-direction)
   dxf[].ellipse[].centerY                  ...... (float) center (y-direction)
   dxf[].ellipse[].centerZ                  ...... (float) center (z-direction)
   
functions:
   dxf[].ellipse[].printValues()            ...... prints out all values for this ellipse
   dxf[].ellipse[].drawAll()                ...... draws this ellipse
___________________________________________________________________________________________________________
--------------------------------- singlePoint  -----------------------------------
variables:
   dxf[].singlePoint[].layer                    ...... (String) name of the layer the point is on 
   dxf[].singlePoint[].lineType                 ...... (String) lineType of the layer e.g. "points", "verdeckt", etc.
   dxf[].singlePoint[].colorIndex               ...... (int) indexNumber to get the color from the ACI (Autocad-Color-Index)
   dxf[].singlePoint[].colorRGB                 ...... (color) color(r,g,b) for the point, same as in autocad.
   dxf[].singlePoint[].lineWeight               ...... (float) strokeWeight
   dxf[].singlePoint[].visible                  ...... (boolean) depends on the layer status: visible is true or false
   dxf[].singlePoint[].x                        ...... (float) x-position of the point
   dxf[].singlePoint[].y                        ...... (float) y-position of the point
   dxf[].singlePoint[].z                        ...... (float) z-position of the point
   
functions:
   dxf[].ellipse[].printValues()                ...... prints out all values for this point
   dxf[].ellipse[].drawAll()                    ...... draws this point

___________________________________________________________________________________________________________
--------------------------------- ACI - AutoCad Color index  -----------------------------------
variables:
   dxf[].aci.r[]                      .... (float) red value of the color
   dxf[].aci.g[]                      .... (float) green value of the color
   dxf[].aci.b[]                      .... (float) blue value of the color
   dxf[].aci.rgb[]                    .... (color) color(r,g,b)
functions:
   dxf[].aci.printValues()            ...... prints out all rgb Values
___________________________________________________________________________________________________________
*/


Dxf[] dxf;
void initializeDxfImport(String[] dxf_file_list, float scaleFactor, float shiftX, float shiftY, float shiftZ){
  dxf = new Dxf[dxf_file_list.length];
  for (int i = 0; i < dxf.length; i++){
    if( loadStrings(dxf_file_list[i]) != null){
       dxf[i] = new Dxf(dxf_file_list[i], i, scaleFactor, shiftX, shiftY, shiftZ); 
    }else{
      println ("__ ERROR__: Dxf_File: \""+dxf_file_list[i]+"\" is missing or inaccessible \n\n");
    } // end if
  }  // end for
} // end void initializeDxfImport();





class Dxf{ 
  Layers[] layer;		 // LAYER
  DxfObject[] polyLine, pl;      // LWPOLYLINE
  DxfObject[] singleLine, sl;    // LINE
  DxfObject[] singlePoint, sp;   // POINT
  DxfObject[] circle, c;         // CIRCLE, ARC
  DxfObject[] ellipse, e;        // ELLIPSE

  ACI aci;  // AutoCad Color Index
  
  String fileName;
  int dxfIndexNumber;
  float scaleFactor;
  float shiftX, shiftY, shiftZ;
  String[] contentOfLines;
  int indexNumberClassEnd = 100;
  String entityClassName     = "AcDbEntity";
  String entityClassLayer    = "ByBlock";
  String polyLineClassName   = "AcDbPolyline";
  String lineClassName       = "AcDbLine";
  String pointClassName      = "AcDbPoint";
  String circleClassName     = "AcDbCircle";
  String ellipseClassName    = "AcDbEllipse";
  String layerClassName      = "AcDbLayerTableRecord";
  String[] objects = { layerClassName,  polyLineClassName, lineClassName,  pointClassName, circleClassName, ellipseClassName};
  int[] objectIndexNumber = new int[objects.length];

  String[][] layerContent = new String[0][5]; //[layer][0:name, 1:lineType, 2:colorIndex, 3:lineWeight, 4:visible]
  color[] aciColor;
 
  Dxf(String file,int dxfNr, float scaleF, float sX, float sY, float sZ){
      fileName        = file;
      dxfIndexNumber  = dxfNr;
      scaleFactor     = scaleF;
      shiftX          = sX;
      shiftY          = sY;
      shiftZ          = sZ;
      contentOfLines  = loadStrings(fileName);
      polyLine        = pl = new DxfObject[0];
      singleLine      = sl = new DxfObject[0];
      singlePoint     = sp = new DxfObject[0];
      circle          = c  = new DxfObject[0];
      ellipse         = e  = new DxfObject[0];
      layer           = new Layers[0];
      aci             = new ACI();
      aciColor        = aci.getACI();
      checkFileContent(); 
  } 
  void checkFileContent(){
    for(int j = 0; j < objects.length; j++){  
      objectIndexNumber[j] = 0;
      if(j == 1 ) for(int i = 0; i < layerContent.length; i++) layerContent[i] = layer[i].returnValues();     
     
      for (int i = 0; i < contentOfLines.length; i++){
        boolean foundEntitiy = false;
        boolean foundObject = false;
        String[]tmpMatch = match(trim(contentOfLines[i]), objects[j]);  
        if(tmpMatch != null){
           foundObject = true; 
        } // end if
        if(foundObject == true){      
          ////////////////////////////////////////////////////////
          /////////////// for polyLines || Circle || singeLines || points || ellipse
          if(objects[j] != layerClassName ){
              int tmpLineNr = i - 1;      
              boolean stopSearchForObjectType = false;      
              while (stopSearchForObjectType == false){
                 tmpLineNr--;
                 String[]tmpMatchEntity = match(trim(contentOfLines[tmpLineNr]), entityClassName );               
                 String[]tmpMatchEntityClassLayer  = match(trim(contentOfLines[tmpLineNr]), entityClassLayer );
                 if (tmpMatchEntity != null)            {stopSearchForObjectType = true; foundEntitiy = true;}
                 if (tmpMatchEntityClassLayer != null)  {stopSearchForObjectType = true;}  // if this row is available , than its not an object
                 if (int(trim(contentOfLines[tmpLineNr])) == indexNumberClassEnd )  stopSearchForObjectType = true;
              } // end while
              int tmpEntityLineNr = tmpLineNr;
              int tmpObjectLineNr = i;
              if (foundEntitiy == true && objects[j] == polyLineClassName){    
                  polyLine = pl = (DxfObject[]) expand (polyLine, polyLine.length+1);
                  polyLine[polyLine.length-1] = pl[pl.length-1] = new DxfObject(fileName, dxfIndexNumber, j,  objectIndexNumber[j], scaleFactor, shiftX, shiftY, shiftZ, contentOfLines, tmpEntityLineNr, tmpObjectLineNr, entityClassName, objects[j], layerContent, aciColor);
                  objectIndexNumber[j]++;
              } // end if
              if (foundEntitiy == true && objects[j] == lineClassName){
                  singleLine = sl = (DxfObject[]) expand (singleLine, singleLine.length+1);
                  singleLine[singleLine.length-1] = sl[sl.length-1] = new DxfObject(fileName, dxfIndexNumber, j,  objectIndexNumber[j], scaleFactor, shiftX, shiftY, shiftZ, contentOfLines, tmpEntityLineNr, tmpObjectLineNr, entityClassName, objects[j], layerContent, aciColor);
                  objectIndexNumber[j]++;
              } // end if 
              if (foundEntitiy == true && objects[j] == pointClassName){
                  singlePoint = sp = (DxfObject[]) expand (singlePoint, singlePoint.length+1);
                  singlePoint[singlePoint.length-1] = sp[sp.length-1] = new DxfObject(fileName, dxfIndexNumber, j,  objectIndexNumber[j], scaleFactor, shiftX, shiftY, shiftZ, contentOfLines, tmpEntityLineNr, tmpObjectLineNr, entityClassName, objects[j], layerContent, aciColor);
                  objectIndexNumber[j]++;
              } // end if 
              if (foundEntitiy == true && objects[j] == circleClassName){
                  circle = c = (DxfObject[]) expand (circle, circle.length+1);
                  circle[circle.length-1] = c[c.length-1] = new DxfObject(fileName, dxfIndexNumber, j,  objectIndexNumber[j], scaleFactor, shiftX, shiftY, shiftZ, contentOfLines, tmpEntityLineNr, tmpObjectLineNr, entityClassName, objects[j], layerContent, aciColor); 
                  objectIndexNumber[j]++;  
              } // end if
              if (foundEntitiy == true && objects[j] == ellipseClassName){
                  ellipse = e = (DxfObject[]) expand (ellipse, ellipse.length+1);
                  ellipse[ellipse.length-1] = e[e.length-1] = new DxfObject(fileName, dxfIndexNumber, j,  objectIndexNumber[j], scaleFactor, shiftX, shiftY, shiftZ, contentOfLines, tmpEntityLineNr, tmpObjectLineNr, entityClassName, objects[j], layerContent, aciColor); 
                  objectIndexNumber[j]++;  
              } // end if
          }  // end if
          
          ////////////////////////////////////////////////////////
          /////////////// for Layers           
          if(objects[j] == layerClassName){
            int tmpObjectLineNr = i;
            layer = (Layers[]) expand (layer, layer.length+1);
            layerContent  = new String[layerContent.length+1][5];
            layer[layer.length-1] = new Layers(fileName, dxfIndexNumber, objectIndexNumber[j], tmpObjectLineNr, contentOfLines);
            objectIndexNumber[j]++;
          } // end if 
        } // end if
      } // end for i
    } // end for j
  } // end void checkFileContent()
   
  void drawAll(boolean dxfValues){
    drawPolyLines(dxfValues);
    drawSingleLines(dxfValues);
    drawCircles(dxfValues);
    drawEllipses(dxfValues);
    drawSinglePoints(dxfValues);

    
  } // end void drawAll() 
  void drawPolyLines(boolean dxfValues){
    for(int i = 0; i < polyLine.length; i++)    { polyLine[i].drawAll(dxfValues);} 
  } // end void drawPolyLines()
  void drawCircles(boolean dxfValues){
    for(int i = 0; i < circle.length; i++)      { circle[i].drawAll(dxfValues); } 
  } // end void drawCircles()
  void drawEllipses(boolean dxfValues){
    for(int i = 0; i < ellipse.length; i++)      { ellipse[i].drawAll(dxfValues); } 
  } // end void drawCircles()
  void drawSingleLines(boolean dxfValues){
    for(int i = 0; i < singleLine.length; i++)  {singleLine[i].drawAll(dxfValues);} 
  } // end void drawCircles()
  void drawSinglePoints(boolean dxfValues){
    for(int i = 0; i < singlePoint.length; i++)  {singlePoint[i].drawAll(dxfValues);} 
  } // end void drawCircles()
  void printValues(){
    for(int i = 0; i < layer.length; i++)       { layer[i].printValues();   } 
    for(int i = 0; i < polyLine.length; i++)    { polyLine[i].printValues();   } 
    for(int i = 0; i < singleLine.length; i++)  { singleLine[i].printValues(); } 
    for(int i = 0; i < singlePoint.length; i++) { singlePoint[i].printValues(); }
    for(int i = 0; i < circle.length; i++)      { circle[i].printValues();     } 
    for(int i = 0; i < ellipse.length; i++)     { ellipse[i].printValues();     }   
  }
} // end class Dxf















class DxfObject{
// GENERAL: indexVariables for "AcDbEntity" ...for dxf-file
  int indexNumberLineType    = 6;
  int indexNumberLayerName   = 8;
  int indexNumberColor       = 62;
  int indexNumberLineWeight  = 370;
  int indexNumberClassEnd    = 100; 

// GENERAL: Variables 
  String objectName;
  String fileName;
  int dxfIndexNumber;
  int objectIndexNumber;
  int objectType;
  float scaleFactor;
  float shiftX, shiftY, shiftZ;
  int lineNumberEntity;
  int lineNumberObject;
  String[] contentOfLines;
  String entityClassName;
  String objectClassName;
  String layer;  
  String lineType;
  int colorIndex;
  color colorRGB;
  float colR, colG, colB;
  float lineWeight;
  boolean visible = false;
  String[][] layerContent;
  color[] aciColor;
  
///////////////////////////////////////////////////////// 
  //GENERAL for: lines, PolyLines,
  ControlPoints[] controlPoint, cp;
  float[] tmpVerticesX, tmpVerticesY, tmpVerticesZ;
  
/////////////////////////////////////////////////////////
// indexVariables for "AcDbPolyline" ...for dxf-file 
  int indexNumberVertices      = 90;
  int indexNumberClosed        = 70;
  int indexNumberConstantWidth = 43;
  int indexNumberElevation     = 38;
  int indexNumberX             = 10;
  int indexNumberY             = 20;
//specific Variables
  int segments;
  int knots;
  float elevation;
  boolean closed;

/////////////////////////////////////////////////////////
// indexVariables for "AcDbLine" ...for dxf-file 
  int indexNumberXstart        = 10;
  int indexNumberYstart        = 20;
  int indexNumberZstart        = 30;
  int indexNumberXend          = 11;
  int indexNumberYend          = 21;
  int indexNumberZend          = 31;

/////////////////////////////////////////////////////////
// indexVariables for "AcDbLine" ...for dxf-file 
  int indexNumberXpos        = 10;
  int indexNumberYpos        = 20;
  int indexNumberZpos        = 30; 
  float x, y, z;
  
///////////////////////////////////////////////////////// 
//GENERAL for: circle, ellipse
  int indexNumberCenterX    = 10;
  int indexNumberCenterY    = 20;
  int indexNumberCenterZ    = 30; 
  float centerX, centerY, centerZ;
  float startAngle = 0;
  float endAngle   = TWO_PI;
  float axis1, axis2;
/////////////////////////////////////////////////////////
// indexVariables for "AcDbCircle" ...for dxf-file 
  int indexNumberRadius     = 40;
  int indexNumberStartAngle = 51;
  int indexNumberEndAngle   = 50;
  String arcClassName = "AcDbArc";

  
/////////////////////////////////////////////////////////
// indexVariables for "AcDbEllipse" ...for dxf-file 
  int indexNumberMainAxisEndX   = 11;
  int indexNumberMainAxisEndY   = 21;
  int indexNumberMainAxisEndZ   = 31;
  int indexNumberAxisRatio      = 40;
  int indexNumberStartParameter = 41;
  int indexNumberEndParameter   = 42;
  float rotation;


  DxfObject(String file, int dxfNr, int objType ,int objNummer, float scaleF, float sX, float sY, float  sZ, String[] content, int lineNrEntity, int lineNrObject, String entityClass, String objectClass, String[][] layer, color[] aciCol){
    fileName                = file;
    dxfIndexNumber          = dxfNr;
    objectIndexNumber       = objNummer;
    objectType              = objType;
    scaleFactor             = scaleF;
    shiftX                  = sX;
    shiftY                  = sY;
    shiftZ                  = sZ;
    contentOfLines          = content;
    lineNumberEntity        = lineNrEntity;
    lineNumberObject        = lineNrObject;
    entityClassName         = entityClass;
    objectClassName         = objectClass; 
    layerContent            = layer;
    aciColor                = aciCol;
    defineObjectValues();
  } 
  
  void defineObjectValues(){
  //// GENERAL: values of the "AcDbEntity"-section
    int tmpLineNr = lineNumberEntity;
    tmpLineNr++;
    boolean gotLineType = false, gotColor = false, gotLineWeight = false;
    while(  int(trim(contentOfLines[tmpLineNr])) != indexNumberClassEnd ){
      int curLineContent = int(trim(contentOfLines[tmpLineNr]));
      tmpLineNr++;     
      String nextLineContent = trim(contentOfLines[tmpLineNr]);    
      if( curLineContent == indexNumberLineType )   { lineType   = nextLineContent; gotLineType = true;}
      if( curLineContent == indexNumberLayerName )  { layer      = nextLineContent; }
      if( curLineContent == indexNumberColor )      { colorIndex = int(nextLineContent)-1; gotColor = true;}
      if( curLineContent == indexNumberLineWeight ) { lineWeight = float(nextLineContent)/10; gotLineWeight = true;}
      tmpLineNr ++;
    } // end while

    int layerIndexNumber = 0;
    for(int i = 0; i < layerContent.length; i++){
        String[]tmpMatch = match(layerContent[i][0], layer);
        if(tmpMatch != null) {layerIndexNumber = i;}
    } // end for

    if( gotLineType == false)   {lineType    = layerContent[layerIndexNumber][1]; }
    if( gotColor == false)      {colorIndex  = int(layerContent[layerIndexNumber][2]); }
    if( gotLineWeight == false) {lineWeight  = float(layerContent[layerIndexNumber][3])/10; }
    visible = boolean(layerContent[layerIndexNumber][4]);  
    if(lineWeight < 0) {lineWeight  = 0.5;}
    colorRGB = aciColor[colorIndex];
    colR = red(colorRGB);
    colG = green(colorRGB);
    colB = blue(colorRGB);
  
   int tmpCountX = 0; int tmpCountY = 0; int tmpCountZ = 0;
   tmpLineNr = lineNumberObject;
   tmpLineNr++;  
   
   //// values of the "AcDbPolyline"-section   
   if( match(objectClassName, "AcDbPolyline") != null){ 
      objectName = "polyLine";
      controlPoint = cp = new ControlPoints[0];
      while(  int(trim(contentOfLines[tmpLineNr])) != indexNumberClassEnd ){
        int curLineContent = int(trim(contentOfLines[tmpLineNr]));
        tmpLineNr++;     
        String nextLineContent = trim(contentOfLines[tmpLineNr]);   
        if( curLineContent == indexNumberVertices )   knots     = int(nextLineContent);
        if( curLineContent == indexNumberVertices )   segments  = int(nextLineContent)-1;
        if( curLineContent == indexNumberElevation )  elevation = float(nextLineContent);
        if( curLineContent == indexNumberClosed ) {
            int tmpClosed = int(nextLineContent);
            if(tmpClosed == 0) closed = false; else if(tmpClosed == 1) closed = true; else if(tmpClosed > 1)  closed = false;
            if(closed == true){knots ++;  segments ++; }
            tmpVerticesX = new float[knots]; tmpVerticesY = new float[knots]; tmpVerticesZ = new float[knots];    
            controlPoint = cp = new ControlPoints[knots];
        } // end if
        if( curLineContent == indexNumberX ){ tmpVerticesX[tmpCountX] = scaleFactor * shiftX + scaleFactor * 1 *float(nextLineContent); tmpCountX++;  } // end if
        if( curLineContent == indexNumberY ){ 
          tmpVerticesY[tmpCountY] = scaleFactor * shiftY + scaleFactor * -1 * float(nextLineContent);
          tmpVerticesZ[tmpCountY] = scaleFactor * shiftZ + scaleFactor * 1 *elevation;   
          tmpCountY++;  
        } // end if
        tmpLineNr ++;
      } // end while   
      if(closed == true){
        tmpVerticesX[tmpVerticesX.length-1] = tmpVerticesX[0]; 
        tmpVerticesY[tmpVerticesY.length-1] = tmpVerticesY[0];
        tmpVerticesZ[tmpVerticesY.length-1] = tmpVerticesZ[0];
      }     
    for(int i = 0; i < knots; i++){  controlPoint[i] = cp[i] = new ControlPoints(tmpVerticesX[i], tmpVerticesY[i], tmpVerticesZ[i] ); } // end for i   
  } // end if(match(objectClassName, "AcDbPolyline") != null)
  
  
  //// values of the "AcDbLine"-section   
  if( match(objectClassName, "AcDbLine") != null ){
    objectName = "singleLine";
    knots = 2;
    tmpVerticesX = new float[knots]; tmpVerticesY = new float[knots]; tmpVerticesZ = new float[knots];  
    while(  int(trim(contentOfLines[tmpLineNr])) != indexNumberClassEnd ){
      int curLineContent = int(trim(contentOfLines[tmpLineNr]));
      tmpLineNr++;     
      String nextLineContent = trim(contentOfLines[tmpLineNr]);
      if( curLineContent == indexNumberXstart ){ tmpVerticesX[tmpCountX] = scaleFactor * shiftX + scaleFactor * 1 *float(nextLineContent);   tmpCountX++; } // end if
      if( curLineContent == indexNumberYstart ){ tmpVerticesY[tmpCountY] = scaleFactor * shiftY + scaleFactor * -1 * float(nextLineContent); tmpCountY++; } // end if
      if( curLineContent == indexNumberZstart ){ tmpVerticesZ[tmpCountZ] = scaleFactor * shiftZ + scaleFactor * 1 * float(nextLineContent);  tmpCountZ++; } // end if   
      if( curLineContent == indexNumberXend ){ tmpVerticesX[tmpCountX] = scaleFactor * shiftX + scaleFactor * 1 *float(nextLineContent);   tmpCountX++; } // end if
      if( curLineContent == indexNumberYend ){ tmpVerticesY[tmpCountY] = scaleFactor * shiftY + scaleFactor * -1 * float(nextLineContent); tmpCountY++; } // end if
      if( curLineContent == indexNumberZend ){ tmpVerticesZ[tmpCountZ] = scaleFactor * shiftZ + scaleFactor * 1 * float(nextLineContent);  tmpCountZ++; } // end if
      tmpLineNr ++;
    } // end while   
    controlPoint = cp = new ControlPoints[knots];
    for(int i = 0; i < tmpVerticesX.length; i++){ controlPoint[i] = cp[i] = new ControlPoints(tmpVerticesX[i], tmpVerticesY[i], tmpVerticesZ[i] ); } // end for i     
  } // end if(match(objectClassName, "AcDbLine") != null )
  
  //// values of the "AcDbPoint"-section   
  if( match(objectClassName, "AcDbPoint") != null ){
    objectName = "singlePoint"; 
    while(  int(trim(contentOfLines[tmpLineNr])) != indexNumberClassEnd ){
      int curLineContent = int(trim(contentOfLines[tmpLineNr]));
      tmpLineNr++;     
      String nextLineContent = trim(contentOfLines[tmpLineNr]);
      if( curLineContent == indexNumberXpos ){ x = scaleFactor * shiftX + scaleFactor * 1 *float(nextLineContent);   tmpCountX++; } // end if
      if( curLineContent == indexNumberYpos ){ y = scaleFactor * shiftY + scaleFactor * -1 * float(nextLineContent); tmpCountY++; } // end if
      if( curLineContent == indexNumberZpos ){ z = scaleFactor * shiftZ + scaleFactor * 1 * float(nextLineContent);  tmpCountZ++; } // end if
      tmpLineNr ++;
    } // end while      
  } // end if(match(objectClassName, "AcDbPoint") != null ) 
  
//// values of the "AcDbCircle"-section   
  if( match(objectClassName, "AcDbCircle") != null ){
     objectName = "circle";
     while(  int(trim(contentOfLines[tmpLineNr])) != indexNumberClassEnd ){
      int curLineContent = int(trim(contentOfLines[tmpLineNr]));
      tmpLineNr++;     
      String nextLineContent = trim(contentOfLines[tmpLineNr]);     
      if( curLineContent == indexNumberCenterX )   centerX = scaleFactor * shiftX + scaleFactor * 1 * float(nextLineContent);
      if( curLineContent == indexNumberCenterY )   centerY = scaleFactor * shiftY + scaleFactor * -1 * float(nextLineContent);
      if( curLineContent == indexNumberCenterZ )   centerZ = scaleFactor * shiftZ + scaleFactor * 1 * float(nextLineContent);
      if( curLineContent == indexNumberRadius )    axis1   = axis2 = scaleFactor * 1 * float(nextLineContent);
      if( curLineContent == indexNumberStartAngle) {startAngle = -radians(float(nextLineContent));}
      if( curLineContent == indexNumberEndAngle)   {endAngle   = -radians(float(nextLineContent));}
      tmpLineNr ++;
    } // end while  
  //// values of the "AcDbArc"-section    
    startAngle = 0;
    endAngle = TWO_PI;
    if (match(trim(contentOfLines[tmpLineNr+1]), arcClassName ) != null){
      tmpLineNr+= 2; 
      while(  int(trim(contentOfLines[tmpLineNr])) != indexNumberClassEnd ){
        int curLineContent = int(trim(contentOfLines[tmpLineNr]));
        tmpLineNr++;     
        String nextLineContent = trim(contentOfLines[tmpLineNr]);   
        if( curLineContent == indexNumberStartAngle) {startAngle = -radians(float(nextLineContent));}
        if( curLineContent == indexNumberEndAngle)   {endAngle   = -radians(float(nextLineContent));}
        tmpLineNr ++;
      } // end while   
    } // end if     
  } // end if( match(objectClassName, "AcDbCircle") != null )
//// values of the "AcDbCircle"-section   

  if( match(objectClassName, "AcDbEllipse") != null ){
     objectName = "ellipse";
     float tmpAxisRatio = 0;
     float tmpMainAxisEndX = 0, tmpMainAxisEndY = 0, tmpMainAxisEndZ = 0;
     while(  int(trim(contentOfLines[tmpLineNr])) != indexNumberClassEnd ){
      int curLineContent = int(trim(contentOfLines[tmpLineNr]));
      tmpLineNr++;     
      String nextLineContent = trim(contentOfLines[tmpLineNr]);     
      if( curLineContent == indexNumberCenterX )   centerX = scaleFactor * shiftX + scaleFactor * 1 * float(nextLineContent);
      if( curLineContent == indexNumberCenterY )   centerY = scaleFactor * shiftY + scaleFactor * -1 * float(nextLineContent);
      if( curLineContent == indexNumberCenterZ )   centerZ = scaleFactor * shiftZ + scaleFactor * 1 * float(nextLineContent);   
      if( curLineContent == indexNumberMainAxisEndX )   tmpMainAxisEndX   = scaleFactor * 1 * float(nextLineContent);
      if( curLineContent == indexNumberMainAxisEndY )   tmpMainAxisEndY   = scaleFactor * 1 * float(nextLineContent);
      if( curLineContent == indexNumberMainAxisEndZ )   tmpMainAxisEndZ   = scaleFactor * 1 * float(nextLineContent);
      if( curLineContent == indexNumberAxisRatio )      tmpAxisRatio      =  float(nextLineContent);
      if( curLineContent == indexNumberStartParameter)  endAngle        =  -float(nextLineContent);
      if( curLineContent == indexNumberEndParameter)    startAngle          =  -float(nextLineContent);
      tmpLineNr ++;
    } // end while    
    axis1 = sqrt(pow(tmpMainAxisEndX,2) + pow(tmpMainAxisEndY,2));
    axis2 = axis1 * tmpAxisRatio;
    rotation = atan2( -tmpMainAxisEndY, tmpMainAxisEndX);   
  } // end if( match(objectClassName, "AcDbEllipse") != null ){  
 
   //printValues();   
 }// end void defineObjectValues()  
  
  
  void printValues(){
      String path = ("dxf["+dxfIndexNumber+"]."+objectName+"["+objectIndexNumber+"]");
      println("_____  dxf["+dxfIndexNumber+"]."+objectName+"["+objectIndexNumber+"] _______________________________________________________________________________________________________\n");
      println("  >> in file: \"" +fileName+"\", "+objectClassName+" starts at Line: "+ lineNumberEntity+" <<\n");     
      println("     "+path+".layer       =  \""+layer+"\"");
      println("     "+path+".visibile    =  "+visible);
      println("     "+path+".lineType    =  "+lineType);
      println("     "+path+".colorIndex  =  "+colorIndex);
      println("     "+path+".colorRGB    =  color( "+colR+",  "+colG+",  "+colB+" )");
      println("     "+path+".lineWeight  =  "+lineWeight);
    if( match(objectClassName, "AcDbPolyline") != null ){ 
      println("     "+path+".knots       =  "+knots);
      println("     "+path+".segments    =  "+segments);
      println("     "+path+".closed      =  "+closed);
      println("     "+path+".elevation   =  "+elevation);
    }// end if()
    if((match(objectClassName, "AcDbPolyline") != null)  || (match(objectClassName, "AcDbLine") != null )){ 
      println("\n   ControlPoints: "+path+".controlPoint[0:"+(knots-1)+"].x/y/z");
      for(int i = 0; i < knots; i++){
        println("     Vertex " + i+ ": X  = "+tmpVerticesX[i] +"  ,    Y  = "   + tmpVerticesY[i]+"  ,     Z  = "   + tmpVerticesZ[i]);
      } // end for i
    }// end if()
    if((match(objectClassName, "AcDbPoint") != null) ){ 
      println("\n   PointPosition: "+path+".x/y/z");
      println("     Point : X  = "+x+"  ,    Y  = "   +y+"  ,     Z  = "+z);
    }// end if()
    if( (match(objectClassName, "AcDbCircle") != null) ||  (match(objectClassName, "AcDbEllipse") != null) ){
      println("     "+path+".axis1       =  "+ axis1); 
      println("     "+path+".axis2       =  "+ axis2); 
      println("     "+path+".startAngle  =  "+degrees(startAngle)+" degrees");
      println("     "+path+".endAngle    =  "+degrees(endAngle)+" degrees"); 
      if( match(objectClassName, "AcDbEllipse") != null ){
        println("     "+path+".rotation    =  "+degrees(rotation)+" degrees");       
      }
          println("\n   ControlPoints: "+path+".centerX/centerY/centerZ");
      println("\n     CENTER: X  = "+centerX +"  ,    Y  = "   + centerY+"  ,     Z  = "   + centerZ);          
    }// end if()
      println("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ");
      println("\n\n");
  } // end void printValues()


  void drawAll(boolean dxfValues){
    for(int i = 0; i < dxf[dxfIndexNumber].layer.length; i++){
      if (match(dxf[dxfIndexNumber].layer[i].name, layer ) != null){ visible = dxf[dxfIndexNumber].layer[i].visible;} // end if
    } // end for i
    if( dxfValues == true ){ strokeWeight(lineWeight); stroke(dxf[dxfIndexNumber].aci.rgb[colorIndex]); noFill(); } // end if if( dxfValues == true )
    if((match(objectClassName, "AcDbPolyline") != null)  || (match(objectClassName, "AcDbLine") != null )){
      if(visible == true){
        for(int i = 0; i < knots-1; i++){
          float sx = controlPoint[i].x;
          float sy = controlPoint[i].y ;
          float ex = controlPoint[i+1].x ;
          float ey = controlPoint[i+1].y ;
          line(sx, sy, ex, ey);
        } // end for i
      } // end if (visible = true)
    } // end if((match(objectClassName, "AcDbPolyline") != null)  || (match(objectClassName, "AcDbLine") != null ))
    if( match(objectClassName, "AcDbCircle") != null ){
      if(visible == true) arc(centerX, centerY, axis1*2, axis2*2, startAngle, endAngle); 
    } // end if( match(objectClassName, "AcDbCircle") != null ) 
    if( match(objectClassName, "AcDbEllipse") != null ){
      if(visible == true){
          pushMatrix(); 
           translate(centerX, centerY); 
           rotate(rotation);
           arc(0, 0, axis1*2, axis2*2, startAngle, endAngle);
          popMatrix(); 
      }
    } // end if( match(objectClassName, "AcDbCircle") != null ) 
    if( match(objectClassName, "AcDbPoint") != null ){
      if(visible == true) point(x, y); 
    } // end if( match(objectClassName, "AcDbCircle") != null )       
  } // end void drawAll() 
  
} // end class DxfObject






class ControlPoints{
  float xValue, x;
  float yValue, y;
  float zValue, z;
  ControlPoints(float xPos, float yPos, float zPos){
    xValue = x = xPos;
    yValue = y = yPos;
    zValue = z = zPos;
  } 
} // end class ControlPoints{}











class Layers{
  int indexNumberlayerName   = 2;
  int indexNumberLineType    = 6;
  int indexNumberColor       = 62;
  int indexNumberLayerStatus = 70;
  int indexNumberLineWeight  = 370;
  String indexNumberClassEnd = "100"; 
 
  int dxfIndexNumber;
  int layerIndexNumber; 
  String fileName;
  int lineNumberObject;
  String[] contentOfLines; 
  String name;
  String lineType;
  int colorIndex;
  color colorRGB;
  float colR, colG, colB;
  float lineWeight;
  boolean visible = true;
  
  Layers(String file, int dxfNr, int layerNr, int lineNrObject, String[] content){
    fileName = file;
    dxfIndexNumber = dxfNr;
    layerIndexNumber = layerNr;
    lineNumberObject = lineNrObject;
    contentOfLines = content;  
    getLayerValues();
  }
  
  void getLayerValues(){  
    int tmpLineNr = lineNumberObject;
    tmpLineNr++;
    while(  match(trim(contentOfLines[tmpLineNr]), indexNumberClassEnd) == null ){
      int curLineContent = int(trim(contentOfLines[tmpLineNr]));
      tmpLineNr++;     
      String nextLineContent = trim(contentOfLines[tmpLineNr]);     
      if( curLineContent == indexNumberlayerName  )   name       = nextLineContent;
      if( curLineContent == indexNumberLineType )     lineType   = nextLineContent;
      if( curLineContent == indexNumberColor )        colorIndex = int(nextLineContent)-1;
      if( curLineContent == indexNumberLineWeight )   lineWeight = float(nextLineContent);
      tmpLineNr ++;
    } // end while
    if(colorIndex < 0) {visible = false; colorIndex = abs(colorIndex)-1;}   
    //printValues();
  } // end void getLayerValues() 
 
  void printValues(){
    println("\n_____  layer "+layerIndexNumber+" _____ \n");
    println(" >> in file: \"" +fileName+"\", \"AcDbLayerTableRecord\"  starts at line: "+lineNumberObject+"\n");
    println("    name        = \""+name+"\"");
    println("    lineType    = "+lineType);
    println("    colorIndex  = "+colorIndex);
    println("    lineWeight  = "+lineWeight);
    println("    visible     = "+visible);
    println("_______________________________________________________________________\n");
  } // end void printValues()
  
  String[] returnValues(){
     String[] tmpValues = {name, lineType, str(colorIndex), str(lineWeight), str(visible)};
     return tmpValues;
  } // end String[] returnValues()
  
  void drawAll( boolean dxfValues ){
   println("layer :\""+dxf[dxfIndexNumber].layer[layerIndexNumber].name+"\" ................. visibility:  "+visible);
   drawPolyLines(dxfValues);
   drawSingleLines(dxfValues);
   drawCircles(dxfValues);
   drawEllipses(dxfValues);
   drawSinglePoints(dxfValues);
  } // end void drawAll()
  
  void drawPolyLines(boolean dxfValues){
    for(int i = 0; i < dxf[dxfIndexNumber].polyLine.length; i++){
      if (match(dxf[dxfIndexNumber].polyLine[i].layer, name ) != null){dxf[dxfIndexNumber].polyLine[i].drawAll(dxfValues); }// end if
    } // end for i
  } // end void drawPolyLines()
  void drawSingleLines(boolean dxfValues){
    for(int i = 0; i < dxf[dxfIndexNumber].singleLine.length; i++){
      if (match(dxf[dxfIndexNumber].singleLine[i].layer, name ) != null){dxf[dxfIndexNumber].singleLine[i].drawAll(dxfValues); }// end if
    } // end for i
  } // end void SingleLines()
  void drawCircles(boolean dxfValues){
    for(int i = 0; i < dxf[dxfIndexNumber].circle.length; i++){
      if (match(dxf[dxfIndexNumber].circle[i].layer, name ) != null){dxf[dxfIndexNumber].circle[i].drawAll(dxfValues); }// end if
    } // end for i
  } // end void drawCircles()
  void drawEllipses(boolean dxfValues){
    for(int i = 0; i < dxf[dxfIndexNumber].ellipse.length; i++){
      if (match(dxf[dxfIndexNumber].ellipse[i].layer, name ) != null){dxf[dxfIndexNumber].ellipse[i].drawAll(dxfValues); }// end if
    } // end for i
  } // end void drawEllipses()
  void drawSinglePoints(boolean dxfValues){
    for(int i = 0; i < dxf[dxfIndexNumber].singlePoint.length; i++){
      if (match(dxf[dxfIndexNumber].singlePoint[i].layer, name ) != null){dxf[dxfIndexNumber].singlePoint[i].drawAll(dxfValues); }// end if
    } // end for i
  } // end void drawEllipses()
} // end class Layers










class ACI{
    int[] rgb_list = {4, 4, 4, 4, 4, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 4, 4, 4,};
    float[] darken = {0.65, 0.5, 0.3, 0.15,}; // autocad
    //float[] darken = {0.75, 0.6, 0.40, 0.25,}; // brighter  ... and better
    //float[] darken = {0.8, 0.6, 0.5, 0.3,}; //  measured 
    float colFac = 255;
    int listL = rgb_list.length*10 +9;
    int colorSize = listL+6;  
    float r[] = new float[colorSize];
    float g[] = new float[colorSize];
    float b[] = new float[colorSize];
    
    color[] rgb = new color[colorSize];
    int indexR = 0;   int indexG = 16;  int indexB = 8;
    float rTmp = 0, gTmp = 0, bTmp = 0;
    float r2  = 0, g2  = 0, b2  = 0; 
    float r1  = 0, g1  = 0, b1  = 0; 
    int tmpDarkenIndex = 0;
      
  ACI(){
    r[0] = 255; g[0] = 0;   b[0] = 0;
    r[1] = 255; g[1] = 255; b[1] = 0;
    r[2] = 0;   g[2] = 255; b[2] = 0;
    r[3] = 0;   g[3] = 255; b[3] = 255;
    r[4] = 0;   g[4] = 0;   b[4] = 255;
    r[5] = 255; g[5] = 0;   b[5] = 255;
    r[6] = 0;   g[6] = 0;   b[6] = 0;
    r[7] = 128; g[7] = 128; b[7] = 128;
    r[8] = 192; g[8] = 192; b[8] = 192;   
    r[249] = 0;   g[249] = 0;   b[249] = 0;
    r[250] = 45;  g[250] = 45;  b[250] = 45;
    r[251] = 91;  g[251] = 91;  b[251] = 91;
    r[252] = 137; g[252] = 137; b[252] = 137;
    r[253] = 183; g[253] = 183; b[253] = 183;
    r[254] = 179; g[254] = 179; b[254] = 179;
  } 
   
  color[] getACI(){ 
    for(int i = 10; i < listL+1; i++){
       if((i%10 == 0) || ((i-1)%10 == 0)){
        if(i%10 == 0){
          rTmp = r2 = rgb_list[indexR] * 0.25 * colFac; 
          gTmp = g2 = rgb_list[indexG] * 0.25 * colFac; 
          bTmp = b2 = rgb_list[indexB] * 0.25 * colFac; 
          tmpDarkenIndex = 0;
        } // end if
        if((i-1)%10 == 0){
          int indexRu1 = indexR-12; if(indexRu1 < 0) indexRu1 = 24 + indexRu1;
          int indexGu1 = indexG-12; if(indexGu1 < 0) indexGu1 = 24 + indexGu1;
          int indexBu1 = indexB-12; if(indexBu1 < 0) indexBu1 = 24 + indexBu1;
          rTmp = r1 = (rgb_list[indexR] * 0.25 + rgb_list[indexRu1] * 0.125) * colFac; 
          gTmp = g1 = (rgb_list[indexG] * 0.25 + rgb_list[indexGu1] * 0.125) * colFac; 
          bTmp = b1 = (rgb_list[indexB] * 0.25 + rgb_list[indexBu1] * 0.125) * colFac;     
          indexR++; if(indexR > rgb_list.length-1) indexR = 0;
          indexG++; if(indexG > rgb_list.length-1) indexG = 0;
          indexB++; if(indexB > rgb_list.length-1) indexB = 0;
        } // end if
      }else if(i%2 == 0){
          rTmp = r2 * darken[tmpDarkenIndex];  
          gTmp = g2 * darken[tmpDarkenIndex];  
          bTmp = b2 * darken[tmpDarkenIndex];  
      }else if(i%1 == 0){
          rTmp = r1 * darken[tmpDarkenIndex];
          gTmp = g1 * darken[tmpDarkenIndex];
          bTmp = b1 * darken[tmpDarkenIndex];
          tmpDarkenIndex++;   
      } // end if
      r[i-1] = rTmp;
      g[i-1] = gTmp;
      b[i-1] = bTmp; 
      //rgb[i-1] = color( r[i-1], g[i-1], b[i-1]);
    }// end for
    for( int i = 0; i < colorSize; i++){
       rgb[i] = color( r[i], g[i], b[i]);
    } // end for i   
    //printValues();
    return rgb;
  } // end void getACI() 
  void printValues(){
    for( int i = 0; i < colorSize; i++){ println("RGB "+(i)+":    color("+ r[i] + ", " + g[i] + ", "+ b[i]+")"); } // end for i
  } // end void void printValues()
} // end ACI

