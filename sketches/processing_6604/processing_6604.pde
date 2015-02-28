
  /*
  <p>This is a fusion of the Flocking(Daneil Shiffman), and Follow 3(Keith Peters) examples to create a 'worm' 
   that moves around at its own volition, and creates a neat design while doing so. +MTR</p>
   <b>0 _ Random!</b>
   <b>Up / Down</b> keys to increase / decrease speed of worm.<br />
   <b>Press PageUp / PageDown</b> keys to change the thickness of the worm. (default is 2)<br />
   <b>Press Home / End</b> keys to change individual segment length.<br />
     <li>This will increase the total length of the worm, so you might want to decrease the number of segments (left/right) for especially long lengths.<br /></li>
   <b>Press Left or Right</b> keys to increase / decrease the length of the worm (very subtle to notice at first)<br />
   <b>Press S</b> to save a screenshot. (for local use only.)<br />
   <b>Press C</b> to clear.<br />
   <b>Press Space</b> to pause.<br />
   <b>Press D</b> to show the worms' target and it's target.<br />
   <b>Press M</b> to toggle worm to follow mouse, or random target (default is random target)<br />
   <b>Press R</b> to toggle 'rainbow' mode. (default is on)<br />
   <b>Press F</b> to toggle fading. (default is off)<br />
   <b>Press keys 1-4</b> to toggle which worms to render. Will clear the screen each time.<br />
   <li>Worm 1 is the 'base' worm. 2 mirrors via the X,</li><br />
   <li>3 mirros via the Y, 4 mirrors via both X &amp; Y.</li><br />
   By default, worms 1 and 2 are shown.<br />
  */
  /* Code/Release Notes:
    *Final: Redid code in good ol' polymorphic fashion.
    *Please be sure to give credit where appropriate for utilization of code / classes. Thank you +MTR
  */
  //Global behaviors...
  float speedMult;
  boolean inLoop;
  boolean fade;
  int rndWeight;
  int rndLength;
  int rndNumOfSegs;
  float maxTotalLength; //max length the worm should be when the size is multiplied by the length
  //Worms...
  worm worm1, worm2, worm3, worm4;
  //Form Aesthetics...
  color bg;
  
  void setup(){
    //Behavior(s)...
    inLoop = true;
    //Form Aesthetics...
    bg = color(20, 20, 20, 100);
    background(bg);
    size(800, 600);
    //Worms...
    worm1 = new worm(75);
    worm1.segLength = 3;
    worm1.rainbow = true;
    worm1.wormWeight = 3;
    worm2 = new worm(worm1, 2);
    worm3 = new worm(worm1, 3);
    worm3.visible = false;
    worm4 = new worm(worm1, 4);
    worm4.visible = false;
    noFill();
    randomizeVals();
  }
  
  void randomizeVals(){
    background(bg);
    fade = rndBool();
    speedMult = random(1, 90);
    rndWeight = int(random(1, 15));
    rndLength = int(random(0, 15));
    if(rndLength > 0)
      rndLength *= 1;
    else
      rndLength = 1;
    maxTotalLength = (width+height)/4;
    rndNumOfSegs = int(random(1, maxTotalLength/rndLength));
    //Set randoms...
    worm1.wormWeight = rndWeight;
    worm2.wormWeight = rndWeight;
    worm3.wormWeight = rndWeight;
    worm4.wormWeight = rndWeight;
    worm1.segLength = rndLength;
    worm2.segLength = rndLength;
    worm3.segLength = rndLength;
    worm4.segLength = rndLength;
    worm1.segIniter(int(rndNumOfSegs));
    worm2.segIniter(int(rndNumOfSegs));
    worm3.segIniter(int(rndNumOfSegs));
    worm4.segIniter(int(rndNumOfSegs));
    worm1.visible = rndBool();
    worm2.visible = rndBool();
    worm3.visible = rndBool();
    worm4.visible = rndBool();
    if(!worm1.visible &&
        !worm2.visible &&
        !worm3.visible &&
        !worm4.visible){
          worm1.visible = true;
          worm3.visible = true;
        }
    
    println("Total_"+worm1.numOfSegs*worm1.segLength+
            "\tSegs_"+worm1.segments.size()+
            "\tLength_"+worm1.segLength);
  }
  
  boolean rndBool(){
    int rnd = int(random(1, 50));
    if(rnd > 25)
      return true;
    else
      return false;
  }
  
  void draw(){
    if(fade){
      fill(bg, 50);
      rect(0, 0, width, height);
      noFill();
    }
    //worm1.loc = new PVector(mouseX, mouseY);
    worm1.render();
    worm2.render();
    worm3.render();
    worm4.render();
    //display framerate...
    //println("worm2:\t" + frameRate);
  }
  
  void keyPressed(){
    if(key == ' '){
      if(inLoop){
        noLoop();
      } else {
        loop();
      }
      inLoop = !inLoop;
    }
    if (key == 'f'){
      fade = !fade;
    }
    if (key == 's'){
      saveShot();
    }
    if (key == 'd'){
      worm1.targ.visible = !worm1.targ.visible;
    }
    if (key == 'c'){
      background(bg);
    }
    if (key == 'm'){
      worm1.followMouse = !worm1.followMouse;
    }
    if (key == 'r'){
      worm1.rainbow = !worm1.rainbow;
      worm2.rainbow = worm1.rainbow;
      worm3.rainbow = worm1.rainbow;
      worm4.rainbow = worm1.rainbow;      
    }
    if (key == '0'){
      randomizeVals();
    }
    if (key == '1'){
      worm1.visible = !worm1.visible;
      if(!fade)background(bg);
    }
    if (key == '2'){
      worm2.visible = !worm2.visible;
      if(!fade)background(bg);
    }
    if (key == '3'){
      worm3.visible = !worm3.visible;
      if(!fade)background(bg);
    }
    if (key == '4'){
      worm4.visible = !worm4.visible;
      if(!fade)background(bg);
    }
    if(key == CODED){
      if (keyCode == UP){
        speedMult += .5;
        println("Speed:\t"+speedMult);
      }
      if (keyCode == DOWN){
        speedMult -= .5;
        if(speedMult <= .5){
          speedMult = .5;
        }
        println("Speed:\t"+speedMult);
      }
      if(keyCode == 33){//pgUp key
        worm1.wormWeight += 1;
        worm2.wormWeight = worm1.wormWeight;
        worm3.wormWeight = worm1.wormWeight;
        worm4.wormWeight = worm1.wormWeight;
      }
      if(keyCode == 34){//pgDown key
        worm1.wormWeight -= 1;
        if(worm1.wormWeight < 1)
          worm1.wormWeight = 1;
        worm2.wormWeight = worm1.wormWeight;
        worm3.wormWeight = worm1.wormWeight;
        worm4.wormWeight = worm1.wormWeight;
      }
      if(keyCode == 36){//home key
        worm1.segLength += 1;
        worm2.segLength = worm1.segLength;
        worm3.segLength = worm1.segLength;
        worm4.segLength = worm1.segLength;
      }
      if(keyCode == 35){//end key
        worm1.segLength -= 1;
        if(worm1.segLength < 1)
          worm1.segLength = 1;
        worm2.segLength = worm1.segLength;
        worm3.segLength = worm1.segLength;
        worm4.segLength = worm1.segLength;
      }
      if(keyCode == LEFT){
        worm1.subSeg();
        worm2.subSeg();
        worm3.subSeg();
        worm4.subSeg();
      }
      if(keyCode == RIGHT){
        worm1.addSeg();
        worm2.addSeg();
        worm3.addSeg();
        worm4.addSeg();
      }
    }
  }//endKeyPressed func
  
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

