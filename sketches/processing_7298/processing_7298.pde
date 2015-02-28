
  /*
  <p>This is a fusion of the Flocking(Daneil Shiffman), and Follow 3(Keith Peters) examples to create a 'worm' 
   that moves around at its own volition, and creates a neat design while doing so. +MTR</p>
   <li>Worm 1 is the 'base' worm. 2 mirrors via the X,</li><br />
   <li>3 mirros via the Y, 4 mirrors via both X &amp; Y.</li><br />
   By default, worms 1 and 2 are shown.<br />
  */
  /* Code/Release Notes:
    *OrganicTapestry1.0: Added control panel & new fade type. TODO:
      Add in previous fade types, customize CP, include fade types in CP, add in background shift.
    *Final: Redid code in good ol' polymorphic fashion.
    *Please be sure to give credit where appropriate for utilization of code / classes. Thank you +MTR
  */
  //Global behaviors...
  float speedMult;
  boolean isAnyFade, isPixelShift, isSlowFade, isRectFade, targVisible;
  boolean pause, debug = true;
  int rndWeight;
  int rndLength;
  int rndNumOfSegs;
  float bgFadeOpacity;
  float maxTotalLength; //max length the worm should be when the size is multiplied by the length
  //Worms...
  worm[] wormM;
  //Form Aesthetics...
  color bg;
  
  void setup(){
    //Behavior(s)...
    pause = false;
    //Form Aesthetics...
    bg = color(0, 0, 0, 100);
    background(bg);
    size(470, 350);
    speedMult = 8;
    isSlowFade = true;
    isAnyFade = true;
    bgFadeOpacity = 70;
    pixelz = new int[width+height*width];
    //Worms... Possible to have up to 8 worms that the CPanel can appropriately display.
    wormM = new worm[8];
    println("mark w1");
    wormM[0] = new worm(175);
    wormM[0].segLength = 1;
    wormM[0].rainbow = true;
    wormM[0].wormWeight = 1;
    for(int i = 1; i < wormM.length; i++){
      println("mark w"+(1+i));
      wormM[i] = new worm(wormM[0], (i+1)%5);
    }
    
    noFill();
    //Add button to access the control panel...
    cPanel = new ControlP5(this);
    cPanel.addButton("cPanelConst", 0, 5, 5, 22, 10);
    cPanel.controller("cPanelConst").setLabel("CP5");
    //Create thecontrol panel
    cPanelConst();
    //randomizeVals();
  }
  
  void draw(){
    if(!pause){
      if(isAnyFade){
        fill(bg, bgFadeOpacity);
        noStroke();
        if(isSlowFade){
          for(int i = 0; i < width; i++){
            ellipse(random(0, width), random(0, height), random(2, 17), random(3, 19));
          }}
        if(isPixelShift){
          pixelShift();
        }
        if(isRectFade){
          rect(-1, -1, width+1, height+1);
        }
        
        noFill();
      }
      for(int i = 0; i < wormM.length; i++){
        wormM[i].render();
      }
      //display framerate...
      //if(debug)println("worm2:\t" + frameRate);
    }
  }
  
  //TODO: For worm-specific values, create function to allow worm to handle its own
  // randomness, allowing for non-mirrored worms.
  void randomizeVals(){
    pause = false;
    rndWeight = int(random(1, 15));
    rndLength = int(random(1, 15));
    maxTotalLength = (width+height)/4;
    rndNumOfSegs = int(random(2, maxTotalLength/rndLength));
    //Set randoms...
    cPanel.controller("bg").setValue(random(0, 255));
    isAnyFade = rndBool();
    println("AnyFade?\t"+isAnyFade);
    //cPanel.controller("fade").setValue(int(rndBool()));
    if(debug)println("marker1");
    if(isAnyFade){
      cPanel.controller("isRectFade").setValue(int(rndBool()));
      if(isRectFade){
        cPanel.controller("isSlowFade").setValue(int(false));
      } else {
        cPanel.controller("isSlowFade").setValue(int(rndBool()));}
      cPanel.controller("bgFadeOpacity").setValue(random(10, 100));
      cPanel.controller("isPixelShift").setValue(int(rndBool()));
    } else {
      cPanel.controller("isPixelShift").setValue(int(false));
      cPanel.controller("isSlowFade").setValue(int(false));
      cPanel.controller("isRectFade").setValue(int(false));
    }
    if(debug)println("marker2");
    if(isPixelShift){
      psMode = int(random(0, 5));
    }
    println("rect:\t"+isRectFade+"\tisSlow:\t"+isSlowFade+"\tisPixel:\t"+isPixelShift);
    if(!isRectFade && !isSlowFade && !isPixelShift){
      isAnyFade = false;
      println("noFades!");
    }
    fadeParts(); //Make sure that all 'parts' coordinate / are visible if they are needed.
    if(debug)println("marker3");
    cPanel.controller("speed").setValue(random(1, 19));
    cPanel.controller("worm_Weight").setValue(rndWeight);
    cPanel.controller("worm_Segments").setValue(rndNumOfSegs);
    cPanel.controller("segment_Length").setValue(rndLength);
    
    if(debug)println("marker4");
    //Set all values for worms... Personal programmer preference; even if worms are not mirrored, 
    // having them all set with the same length, weight, etc. keeps some order to the chaos.
    boolean noVisible = true;
    for(int i = 0; i < wormM.length; i++){
      //Randomize visibility
      wormM[i].visible = rndBool();
      cPanel.controller("worm_"+i).setValue(int(wormM[i].visible));
      
      //Randomize colors
      wormM[i].rndColors();
      
      //Check to make sure they're not all invisible.
      if(wormM[i].visible)
        noVisible = false; //If nothing hits this, they're all invisible.
        
      //Set all values to their parents.
      wormM[i].mirrorVals();
    }
    
    if(debug)println("marker5");
    //Set at least 2 visible.
    if(noVisible){
      if(debug)println("allInvisible!");
      cPanel.controller("worm_1").setValue(1);
      cPanel.controller("worm_3").setValue(1);
    }
    
    if(debug)println("marker6");
    //Out put the total 'size' of the worm.
    if(debug)println("Total_"+wormM[0].segments.size()*wormM[0].segLength+
            "\tSegs_"+wormM[0].segments.size()+
            "\tLength_"+wormM[0].segLength);
    background(bg);
  }
  
  void keyPressed(){
    if(key == 'r'){
      randomizeVals();
    }
    if(key == 'm'){
      for(int i = 1; i < wormM.length; i++){
        wormM[i].mirrorLoc = !wormM[i].mirrorLoc;
        wormM[i].rndColors();
      }
    }
    if(key == 'f'){
      for(int i = 0; i < wormM.length; i++){
        wormM[i].followMouse = !wormM[i].followMouse;
      }
    }
  }
  
  boolean rndBool(){
    int rnd = int(random(1, 50));
    if(rnd > 25)
      return true;
    else
      return false;
  }
  
  void saveShot(){
    noLoop();
    saveFrame(timeStamp() + ".png");
    loop();
  }
  
  String timeStamp() {
    String timestamp;
    int d = day();    // Values from 1 - 31
    int m = month();  // Values from 1 - 12
    int y = year();   // 2003, 2004, 2005, etc.
    int s = second();  // Values from 0 - 59
    int n = minute();  // Values from 0 - 59
    int h = hour();    // Values from 0 - 23
    //ie: 2009-12-07_8.14.56.png
    timestamp = String.valueOf(y) + "-" + 
                String.valueOf(m)+ "-" + 
                String.valueOf(d)+ "_" + 
                String.valueOf(h) + "." + 
                String.valueOf(n) + "." + 
                String.valueOf(s);
    
    return timestamp;
  }

