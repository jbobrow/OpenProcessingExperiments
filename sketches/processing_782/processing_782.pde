

  // Constants
 final float kRadius = 20.0f ;
 final float kTilt = 60.0f ;
 final float kPetalLength = 250.0f ;    // try 250 and 1024.0f as a starter
 final float kRo = 25.0f ;
 final float kStep = 10.0f ;
 final boolean kShowCP = false ;
 final float kRotationSpeed = 0.0625 ;     // Revs per second
 final boolean kAnimate = false ;
 final boolean kMovement = false ;
 final boolean kStemFlower = true ;
 final boolean kInterpColours = false ;
 final boolean kMotionBlur = true ;
 final boolean kHideInstructions = false ;
 final boolean kNoStrokeFlag = false ;
 
 // Auto Animation Constants
 final float kTiltPeriod = 10.0f ;
 final float kLowestTilt = 40.0f ;
 final float kHighestTilt = 96.0f ;
 
 final float kPetalPeriod = 30.0f ;
 final float kLowestPetals = 4.0f ;
 final float kHighestPetals = 40.0f ;
 
 
 
 
 // Flower Colour
 color flowerCol = color(255,0,0,40) ;
 color petalCol = color(200,200,25,40) ;
 color stemCol = color(255,255,0,40) ;
 

  // Screen Constants - initialised
  // in the 'setup' function
  
  int displayWidth,displayHeight ;
  float movementAmplitude ;
  
  String mode ;
  float CX,CY ;
  
  
  float radius,tilt,petalLength,ro,step ;
  float numpetals,tht,rotSpeed ;
  boolean showControlPoints = kShowCP ;
  boolean animation = kAnimate ;
  boolean movement = kMovement ;
  boolean stemFlower = kStemFlower ;
  boolean interpColours = kInterpColours ;
  boolean motionBlur = kMotionBlur ;
  boolean hideInstructions = kHideInstructions ;
  boolean noStrk = kNoStrokeFlag ;
  
  float  moveTime = 0 ;
  float animTime = 0 ;
  
  
  PFont font ;
  

  // Reset Parameters to Default Values
  
  void resetPetalParameters() 
  {
    radius = kRadius ;
    tilt =kTilt ;
    petalLength = kPetalLength ;
    ro = kRo ;
    step = kStep ;
    numpetals = 360.0f / kStep  ;
    rotSpeed = kRotationSpeed ;
    showControlPoints = kShowCP ;
    animation = kAnimate ;
    movement = kMovement ;
    stemFlower = kStemFlower ;
    interpColours = kInterpColours ;
    motionBlur = kMotionBlur ;
    hideInstructions = kHideInstructions ;
    noStrk = kNoStrokeFlag ;
    
    
   }
   
   // Set up font by picking
   // the 1st font we come to
   // from our Java-Run-Time fonts.
   
   void initFont() 
   {
    String[] fontList = PFont.list();
    // Pick the 1st font we have.
    font = createFont(fontList[0],22) ;     
   }
   
   
   // Support functions for Interpolating Colours 
   
   float interpolate(float startValue, float endValue, float nTime) {
     return (endValue - startValue)*nTime +startValue ;
   }
   
   
   color interpolateColour(color startcol, color endcol, float nTime) {
     float rCol = interpolate(red(startcol),red(endcol),nTime) ;
     float gCol = interpolate(green(startcol),green(endcol),nTime) ;
     float bCol = interpolate(blue(startcol),blue(endcol),nTime) ;
     float aCol = interpolate(alpha(startcol),alpha(endcol),nTime) ;
     return color(rCol,gCol,bCol,aCol) ;
     
     
   }
   
    // Support function 
    // which converts Degrees to
    // Radians - 
   float degreesToRadians(float th)
   {
     return PI * th /180.0f ;
   }



  // Display On-Screen Text instructions
  
   void drawInstructions() 
   {
     textFont(font, 24); 
     fill(0,0,0) ;
     int InstructionXPOS = 6 ;
     int InstructionYPOS = 30 ;
     int InstructionFontHeight = 24 ;
     if (!hideInstructions) {
       text("Number of Petals: '+' '-' keys",InstructionXPOS,InstructionYPOS+ 1*InstructionFontHeight) ;
       text("Petal Length: LEFT/RIGHT arrow keys",InstructionXPOS,InstructionYPOS + 2*InstructionFontHeight) ;
       text("Petal Tilt: UP/DOWN arrow keys",InstructionXPOS,InstructionYPOS + 3*InstructionFontHeight) ;
       text("Show/Hide Control Point Lines: 'C' key",InstructionXPOS,InstructionYPOS +4*InstructionFontHeight) ;
       text("Animate Petals and Tilt: 'A' key",InstructionXPOS,InstructionYPOS +5*InstructionFontHeight) ;
       text("Move Flower: 'M' key",InstructionXPOS,InstructionYPOS +6*InstructionFontHeight) ;
       text("Show/Hide Stem Flower: 'S' key",InstructionXPOS,InstructionYPOS +7*InstructionFontHeight) ;
       text("Toggle Interpolate Colours: 'I' key",InstructionXPOS,InstructionYPOS +8*InstructionFontHeight) ;
       text("Motion Blur: 'B' key",InstructionXPOS,InstructionYPOS +9*InstructionFontHeight) ;
       text("Stroke/NoStroke: 'N' key",InstructionXPOS,InstructionYPOS +10*InstructionFontHeight) ;
       
       text("Reset: 'R' key",InstructionXPOS,InstructionYPOS +11*InstructionFontHeight) ;
     }
     if (hideInstructions) {
       textFont(font,16) ;
     }
     
     text("Show/Hide HELP: 'H' key",InstructionXPOS,InstructionYPOS) ;

       
   }
   // Display On-Screen Parameter Values
   
   void drawInfoHud() 
   {
     textFont(font, 12); 
     fill(0,0,255) ;
     int InstructionXPOS = 16 ;
     int InstructionYPOS =  320 ;
     int InstructionFontHeight = 16 ;
     
     if (!hideInstructions) {
       text("Petals: "+numpetals,InstructionXPOS,InstructionYPOS) ;
       text("Length: "+petalLength,InstructionXPOS,InstructionYPOS + 1*InstructionFontHeight) ;
       text("Tilt: "+tilt,InstructionXPOS,InstructionYPOS + 2*InstructionFontHeight) ;
       text("Animation: "+animation,InstructionXPOS,InstructionYPOS + 4*InstructionFontHeight) ;
       text("Movement: "+movement,InstructionXPOS,InstructionYPOS + 5*InstructionFontHeight) ;
     }
     
   }
   
   // Draw a Cubic Bezier Petal from
   // four Vector points
   void drawPetal(PVector [] cps,color col)
   {
      fill(col) ;

      if (noStrk) {
        noStroke() ;
      } else {
        stroke(0,0,0) ;
      }
      
      bezier (cps [0].x,cps[0].y,cps[1].x,cps[1].y,cps[2].x,cps[2].y,cps[3].x,cps[3].y) ;
   }

  
  
   // Draw Control Point lines
   // from our four Vector points

   void drawControlPoints(PVector[] cps)
   {

     stroke(255,0,0) ;
     line(cps[0].x,cps[0].y,cps[1].x,cps[1].y) ;
     stroke(0,255,0) ;
     line(cps[2].x,cps[2].y,cps[3].x,cps[3].y) ;

   }


   PVector [] calcControlPoints(float angle,float ro,float  radius,float tilt,float petalLength)
   {

     PVector [] bezControlPoints = new PVector[4] ;

     float halfRo = ro / 2.0f ;

     PVector[] cPoints = calcPetalPointPair(angle- halfRo,tilt,petalLength) ;
     PVector startPt = cPoints[0] ;
     PVector fPoint = cPoints[1] ;


     bezControlPoints[0] = new PVector(startPt.x * radius,startPt.y *  radius) ;
     bezControlPoints[1] = new PVector(startPt.x * radius +  fPoint.x,startPt.y * radius + fPoint.y) ;



     PVector [] cPoints2 = calcPetalPointPair(angle+halfRo,- tilt,petalLength) ;
     startPt = cPoints2[0] ;
     fPoint = cPoints2[1] ;

     bezControlPoints[3] = new PVector(startPt.x * radius,startPt.y *  radius) ;
     bezControlPoints[2] = new PVector(startPt.x * radius +  fPoint.x,startPt.y * radius + fPoint.y) ;


     return bezControlPoints ;

   }


   // This function calculates the control point line (Pair of 2D Vectors)
   // 
   PVector[] calcPetalPointPair(float angle,float tilt,float petalLength)
   {


     PVector startPt = new PVector(sin(degreesToRadians(angle)),cos(degreesToRadians(angle)));

     PVector vert = new PVector(0,0,1.0f) ;      // Unit Vector Perp  to XY Plane
     PVector nCPc = startPt.cross(vert) ;        // Calculate Tangent to Circle at startPt.x,startPt.y


     PMatrix2D iMat = new PMatrix2D() ;

     iMat.rotate(degreesToRadians(tilt < 0 ? 180+tilt : tilt)) ;    //  Petal Tilt

     PMatrix2D cMat = new PMatrix2D(nCPc.x,startPt.x,0.0f,nCPc.y,startPt.y,0.0f) ;

   // Matrix
   // | nCPc.x  startx |
   // | nCPc.y  starty |


     cMat.preApply(iMat) ;      // Apply our othog axis to the  rotation matrix


     PVector fPoint = new PVector() ;
     PVector sPoint = new PVector(petalLength,0) ;    // Petal Length

     cMat.mult(sPoint,fPoint) ;            // Apply Full transformation to petal Vector

     PVector [] points = new PVector[2] ;
     points[0] = startPt ;
     points[1] = fPoint ;

     return points;

  }




  // The main part of our program starts
  // here - 1st Initialise Font and 
  // Parameter values - then
  // start the 'draw' loop
  

   void setup()
   {

     mode = JAVA2D ;
     initFont() ;
     resetPetalParameters() ;
     
     try {
        displayHeight = Integer.parseInt(getParameter("height")) ;
        displayWidth = Integer.parseInt(getParameter("width")) ;
  
     } catch (Exception e){     
     
       displayHeight = 3*screen.height/4 ;
       displayWidth = 3*screen.width/4 ;
     }
     
     CX = displayWidth / 2 ;
     CY = displayHeight / 2 ;

     // One off starting values
     animation = true ;
     movement = false ;
     interpColours = true ;
     motionBlur = false ;
     
     //petalLength = Math.max(displayWidth,displayHeight) ;
     
     movementAmplitude = petalLength / 4 ;     

     size(displayWidth, displayHeight,mode);
     loop() ;

   }
   
   // sinFunction,cosFunction - Helper functions for auto animation of Parameter values
   // Parameters are changed over a 'period' of time (in seconds) 
   // From startValue to endValue - optional phase
   // timeF is the current Time in seconds 
   
   float cosFunction(float startValue,float endValue,float timeF, float period, float phase) 
   {
         float yI = (startValue +endValue) / 2 ; 
         float freq = 1.0f / period ;
         float amp = endValue - yI ;
         return yI+amp*cos(TWO_PI*timeF*freq + phase) ;
     
   }
   
   float sinFunction(float startValue,float endValue,float timeF, float period, float phase) 
   {
         float yI = (startValue +endValue) / 2 ; 
         float freq = 1.0f / period ;
         float amp = endValue - yI ;
         return yI+amp*sin(TWO_PI*timeF*freq + phase) ;
   }
  
  
  
  
  void drawFlower(float stemRadius,float stepSize,float numPetals,float roAng,float tiltAng,float thtAng,float petalLen,color col)
  {
    
    //draw circle at 0,0 size stemRadius ;
    
    fill(stemCol) ;
    ellipseMode(RADIUS) ;

    if (noStrk) {
      noStroke() ;

    } else {
      stroke(0,0,0.40) ;
    }
    
    ellipse(0, 0, stemRadius,stemRadius) ;
 
    
    
    int petalNum = 0 ;
    
    for (float angle = 0.0f ; angle < stepSize*numPetals ; angle+=stepSize)
    {
      PVector [] cps =  
      calcControlPoints(angle+thtAng,roAng,stemRadius,tiltAng,petalLen) ;
      color iCol ;
      
      
      if (interpColours) {
        color endcol = color(blue(col),green(col),red(col),alpha(col)) ;
        iCol = interpolateColour(col, endcol,petalNum/numPetals) ;
      }else {
        iCol = col ;
      }
      
      drawPetal(cps,iCol) ;
      
      petalNum = petalNum + 1 ;
      
      if (showControlPoints) {   
         drawControlPoints(cps) ;
      }
    }
  
  }
  

  
  
  void draw() {

    smooth() ;
    fill( 255, 255, 255, motionBlur ? 40 : 255 ) ;
    rect( 0, 0, width, height ) ;
        
    float dt = 1/frameRate ;    // We should calculate dt - time  passed since last update-draw

    if (movement) {
      moveTime +=dt ;
    } else {
      moveTime = 0 ;
    }
  /*
    // Display Mini Random Background flowers
    randomSeed(0) ;
    for (int i = 0 ; i < 6 ; i++) {
      pushMatrix() ;
      float pLen = 60.0 ;
      float xpos = random(pLen,displayWidth - pLen) ;
      float ypos = random(pLen,displayHeight - pLen) ;
      translate(xpos, ypos) ;
      drawFlower(2.0,step,numpetals,ro,tilt,tht+i*20,pLen,flowerCol) ;
      popMatrix() ;
    }
    */
    
    pushMatrix() ;
    translate(CX+sinFunction(-movementAmplitude,movementAmplitude,moveTime,10.0f,0.0f), CY + sinFunction(movementAmplitude,-movementAmplitude,moveTime,20.0f,0.0f)) ;
    drawFlower(radius,step,numpetals,ro,tilt,tht,petalLength,flowerCol) ;
    if (stemFlower) {
      drawFlower(radius,720.0f/numpetals,numpetals/2,ro,tilt,tht+20.0,petalLength/4,petalCol) ;
    }
    popMatrix() ;

    tht = tht + dt*360*rotSpeed ;
     
    if (font != null) {
      drawInstructions() ;
      drawInfoHud() ;
    }
    
    if (animation) {
         animTime += dt;
         tilt = sinFunction(kLowestTilt,kHighestTilt,animTime,kTiltPeriod,0.0f) ;
         numpetals = sinFunction(kLowestPetals,kHighestPetals,animTime,kPetalPeriod,0.0f) ;
         numpetals = Math.max(1,numpetals) ;
         step = 360.0f / numpetals  ;
         //petalLength = sinFunction(40.0f,260.0f,animTime,kPetalPeriod,0.0f) ;
    }
    
                       
  }
  
  
    // Handle keyboard input which
    // allows the user to set 
    // various paramters
    // namely -
    // petalLength,petal Tilt
    // and number of petals
    //
    // We can also toggle the
    // display of control point lines
   
    
    void keyPressed() 
    {
      
      if (key == CODED)
      {
        if (keyCode == UP) {
           tilt = tilt + 2 ;
        } else if (keyCode == DOWN) {
          tilt = tilt - 2 ;
        } else if (keyCode == LEFT) {
          petalLength = petalLength - 8 ;  
        } else if (keyCode == RIGHT) {
          petalLength = petalLength + 8 ;  
        } 
        
      } else 
      {
         if ((key == '=') || (key == '+')) {
            numpetals = numpetals + 1 ;    
        } else if ((key == '-') || (key == '_')){
            numpetals = numpetals - 1 ;
        } else if ((key == 'c') || ( key == 'C')) {
            showControlPoints = !showControlPoints ;
        } else if ((key == 'r') || ( key == 'R')) {
            resetPetalParameters() ;
        } else if ((key == 'a') || ( key == 'A')) {
            animation = !animation ;
            if (!animation) {
               numpetals = (int)numpetals ;
            }
        } else if ((key == 'm') || ( key == 'M')) {
            movement = !movement ;
        }
        else if ((key == 's') || ( key == 'S')) {
            stemFlower = !stemFlower ;
            
        }
        else if ((key == 'i') || ( key == 'I')) {
            interpColours = !interpColours ;
        }
        else if ((key == 'b') || ( key == 'B')) {
            motionBlur = !motionBlur ;
        }
        else if ((key == 'n') || ( key == 'N')) {
            noStrk = !noStrk ;
        }
        else if ((key == 'h') || ( key == 'H')) {
            hideInstructions = !hideInstructions ;
        }
        
      }
      numpetals = Math.max(1,numpetals) ;
      step = 360.0f / numpetals  ;
     
  }
    

