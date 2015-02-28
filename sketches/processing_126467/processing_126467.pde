
 /* @pjs
    globalKeyEvents=true;
    pauseOnBlur=false;
    */   
         
    ////////////////////////qdiiibp 2013////////////////////////qdiiibp 2013////////////////////////qdiiibp 2013////////////////////////qdiiibp 2013
 
 
 
 
 
    ///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER
    ///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER
    ///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER///////////////////////THE ANIMATION HANDLER
 
 
    int currentAnimation;// the number of completed Animations
    class AnimationHandler {
      Animation mAnimation; // the animation object
      String StringBuffer; // to store and restore text
    AnimationHandler() {currentAnimation=0;mAnimation = new StartAnimation();// create the first animation
    StringBuffer = mainText; mStringHandler=new StringHandler("This is animated text in HTML5...");//.setDest(/*w/2,-100*/mAnimation.x,mAnimation.y).randomize(02);//create the StringHandler, animate and randomize letter positions
 
    }
    void draw() {
    mAnimation.draw();//draw the animation
    changeAnimation();//change the animation
    if (frameCount % 400 == 0) {
    if (random(1)<0.5) {    }    //TODO Special Event a
    else {}     //TODO Special Event b
    }  }
 
    //check if a Animation should be changed
    void changeAnimation() {  if (mAnimation.changeStatus == Animation.CHANGE_FORCED) {   mAnimation = pickAnimation();    }
    else if (mAnimation.changeStatus == Animation.CHANGE_SUGGESTED && random(1) < 0.02) {   mAnimation = pickAnimation();  }
    }
    Animation pickAnimation() {//textFont(mStringHandler.mFont);
      textSize(letterSize);
       
       
        if(currentAnimation<12 ){  //The intro is passed Animation by Animation
          switch(currentAnimation) {
      // case 1:   return new HorizontalIntroAnimation () ;    
      case 1:    mStringHandler=new StringHandler("This is animated text in HTML5...\n");  return new ShiftJumpIntroAnimation();
      case 2: mStringHandler=new StringHandler("You can drag the text with your mouse...\n")/*.randomize(50)*/;     return new HorizontalAnimation();
      case 3:   mStringHandler=new StringHandler("You can edit the text with your keyboard...\n")/*.randomize(50)*/; return new LaOlaAnimation();
      case 4:     return new RandomPositionsSortingAnimation();
      case 5:   return new MainAnimation(40);
      case 6:   /*mStringHandler.randomize(10); */return new MainAnimation(40);
      case 7:   return new CornerFlipAnimation();
      case 8:   mStringHandler=new StringHandler("The AnimationHandler class is for easy scripting animations...\n"); return new LaOlaJumpAnimation();
      case 9:    mStringHandler=new StringHandler("The StringHandler class is for automatic handling text and providing functions for easy animating...\n");   return new FlyByAnimation();
      case 10:    mStringHandler=new StringHandler(StringBuffer);  return new HorizontalAnimation();
      case 11:    return new JumpAroundAnimation();
      case 12:    return new ShiftJumpAnimation(); 
      default:   return new MainAnimation();
          }}
        else{   int type =  (int) (random(0, 12));
    switch(type) {  //after the intro return a random Animation
    case 1:    return new StartAnimation();
    case 2:    return new CornerFlipAnimation();
    case 3:    return new LaOlaAnimation();
    case 4:    return new FlyByAnimation();
    case 5:    return new HorizontalAnimation();
    case 6:    return new VerticalAnimation();
    case 7:    return new LaOlaJumpAnimation();
    case 8:    return new JumpAroundAnimation();
    case 9:    return new ShiftJumpAnimation(); 
    case 10:    return new RandomPositionsSortingAnimation();
    case 11:    return new MainAnimation();
    default:   setup(); currentAnimation=0; return new StartAnimation();
    }}
    }  
    }
 
    ///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS
    ///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS
    ///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS///////////////////////THE ANIMATIONS
 
    //generic Animation class
    abstract class Animation {//boolean withFireWorks;
    int age = 0,lifeTime=500; //<-- maybe move this into the subclasses which actually use this
    float x,y, px,py, vx,vy;//Animation coordinates, previous coordinates and movement speed
    final static int CHANGE_NOT = 0, CHANGE_SUGGESTED = 1, CHANGE_FORCED = 2;
    int changeStatus = CHANGE_NOT;
    Animation() { age = 0; lifeTime=500; x=width/2; y=height/2;px=x;py=y;vx=0;vy=0; changeStatus = CHANGE_NOT; currentAnimation++;  mFireWorker.creationMode=random(2)>1;
    }
    abstract void update();
    abstract void render();
    void draw() {   textSize(letterSize);  //TODO font size does not change correctly from the stringHandlers setText
    age++; mFireWorker.draw();
     update();
    render();  // draw the animation
    vx=x-px;vy=y-py; px=x;py=y;//Update movement speed and previous coordinates
      }
    }
 
    class EmptyAnimation extends Animation {//short lived empty animation
    EmptyAnimation() {  super();  changeStatus = CHANGE_SUGGESTED;  } void update(){  } void render() {  }}
 
    class StartAnimation extends Animation {    int speed=10; StartAnimation() {  super();  textAlign(CENTER,CENTER); changeStatus = CHANGE_NOT; lifeTime=w/speed; }
        void update(){ mStringHandler.update();if (age >= lifeTime) {      changeStatus = CHANGE_FORCED;   textAlign(LEFT,CENTER);  }  }
        void render() {      // tint(255,255,255,10); image(bg, w/2,w/2,w,w); tint(255,255,255,255);
            textFill();//fill(255,255,255,255);
        pushMatrix();  translate(w/2,h/2);  rotate(radians(-lifeTime+age)*4);
        image(mImage, 0,0,(w*age)/lifeTime,(h*age)/lifeTime);
          text(mainText,0,mStringHandler.yDist/2);popMatrix();
          float stength=5.2f;
        particleSystem.emitter(age*speed, 20,stength,0,3,3);     particleSystem.emitter(w-age*speed, 20,-stength,0,3,3);       particleSystem.emitter( 20,age*speed,0,stength,3,3);     particleSystem.emitter( 20,h-age*speed,0,-stength,3,3);
        particleSystem.emitter(age*speed, h-20,stength,0,3,3);     particleSystem.emitter(w-age*speed, h-20,-stength,0,3,3);       particleSystem.emitter( w-20,age*speed,0,stength,3,3);     particleSystem.emitter( w-20,h-age*speed,0,-stength,3,3);
       
        particleSystem.updateAndDraw();}}
 
    class MainAnimation extends Animation {  MainAnimation(int inLlifeTime) {super();lifeTime=inLlifeTime;} MainAnimation() {   mStringHandler.setDest(x,y).randomize(10); changeStatus = CHANGE_NOT; lifeTime=150;  }
        void update(){ if (age >= lifeTime) {      changeStatus = CHANGE_FORCED;   }      }
        void render() {   image(mImage,w/2,h/2,w,h);    particleSystem.updateAndDraw();  mStringHandler.draw();  }}
 
    class FlyByAnimation extends Animation {    FlyByAnimation() {   super();  textAlign(CENTER,CENTER); /*stringHandlerBuffer = new stringHandler(); stringHandlerBuffer = mStringHandler;*/ changeStatus = CHANGE_NOT; lifeTime=(int) (w+w*.2f); x = -130;  y = (int)(w*.9f); }
        void update(){// if (age >= lifeTime) {   /*mStringHandler =  new stringHandler(); */  changeStatus = CHANGE_FORCED;   }   
           if (x < w+w*.2f)  {    x +=6;    y-= 2;  }  else  { changeStatus = CHANGE_FORCED;  textAlign(LEFT,CENTER); } }
        void render() {  //    image(mImage,w/2,w/2,w,h);
          particleSystem.updateAndDraw();
         if(age>2) particleSystem.emitter(x, y,vx,vy,9,(int) (w*.2f));   
          textFill();
          pushMatrix();  translate(x,y);   rotate((float)heading2D(vx,vy)/*+radians(180)*/);
          image(mImage, 0, 0,w*.7f,h*.7f);
          text(mainText,0,mStringHandler.yDist/2);popMatrix();  }}
 
    class CornerFlipAnimation extends Animation {
      CornerFlipAnimation() {   super(); /*stringHandlerBuffer = new stringHandler(); stringHandlerBuffer = mStringHandler;*/ changeStatus = CHANGE_NOT; lifeTime=120; x = -130;  y = (int)(w*.9f); }
        void update(){ if (age >= lifeTime) {   /*mStringHandler =  new stringHandler(); */  changeStatus = CHANGE_FORCED;   }  
        if (age == 10) {  mStringHandler.moveOri((float)(+w*.25),(float)(+h*.25));  }    
        if (age == 30) {  mStringHandler.moveOri((float)(+w*.00),(float)(-h*.50));  }    
        if (age == 50) {  mStringHandler.moveOri((float)(-w*.50),(float)(+h*.00));  }    
        if (age == 70) {  mStringHandler.moveOri((float)(+w*.00),(float)(+h*.50));  }    
        if (age == 90) {  mStringHandler.moveOri((float)(+w*.25),(float)(-h*.25));  }    
        }    void render() {      particleSystem.updateAndDraw();   mStringHandler.draw();    }  }
 
 
    class VerticalAnimation extends Animation {int overrideAge=0, loopCounter=0, loopMax=4; int jumpSize=100;int waitAfterAnimation=5;float particleAcceleration=.01f;
    VerticalAnimation() {   super(); jumpSize=w; changeStatus = CHANGE_NOT; lifeTime=(mStringHandler.xChars.length);
    mStringHandler.moveOri(0,-w);mStringHandler.moveDest(0,-w);}
        void update(){ age=overrideAge;   loopCounter++;if(loopCounter>=loopMax){loopCounter   =0;overrideAge++;}if (age >= lifeTime+waitAfterAnimation) {/*mStringHandler =  new stringHandler(); */  changeStatus = CHANGE_FORCED;   }  
    if(lifeTime<=(mStringHandler.xChars.length))  {
    if(age < lifeTime &&!mStringHandler.xChars[age].isSpace)  {  mStringHandler.xChars[age].moveOri( 0, jumpSize/loopMax);mStringHandler.xChars[age].moveDest( 0, jumpSize/loopMax+5);image(mImage,mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,letterSize*2,letterSize*2);//fill(255,255,255,60);noStroke();ellipse(mStringHandler.xChars[age].dest.x,mStringHandler.xChars[age].dest.y,letterSize,letterSize);
    particleSystem.emitter(mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,mStringHandler.xChars[age].v.x*particleAcceleration,mStringHandler.xChars[age].v.y*particleAcceleration,6,(int) letterSize);
    }} }    void render() {     particleSystem.updateAndDraw();    mStringHandler.draw();  }  }
 
    class HorizontalAnimation extends Animation {int overrideAge=0, loopCounter=0, loopMax=4; int jumpSize=100;int waitAfterAnimation=5;float particleAcceleration=.01f;
    HorizontalAnimation() {   super(); jumpSize=w; changeStatus = CHANGE_NOT; lifeTime=(mStringHandler.xChars.length);
    mStringHandler.moveOri(w,0);mStringHandler.moveDest(w,0);   }
        void update(){ age=overrideAge;   loopCounter++;if(loopCounter>=loopMax){loopCounter   =0;overrideAge++;}if (age >= lifeTime+waitAfterAnimation) {/*mStringHandler =  new stringHandler(); */  changeStatus = CHANGE_FORCED;   }  
    if(lifeTime<=(mStringHandler.xChars.length))  {
    if(age < lifeTime &&!mStringHandler.xChars[age].isSpace)  {
       
      mStringHandler.xChars[age].moveOri( - jumpSize/loopMax,0);mStringHandler.xChars[age].moveDest( - jumpSize/loopMax,5);image(mImage,mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,letterSize*2,letterSize*2);//fill(255,255,255,60);noStroke();ellipse(mStringHandler.xChars[age].dest.x,mStringHandler.xChars[age].dest.y,letterSize,letterSize);
    particleSystem.emitter(mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,mStringHandler.xChars[age].v.x*particleAcceleration,mStringHandler.xChars[age].v.y*particleAcceleration,6,(int) letterSize);
    }} } void render() {     particleSystem.updateAndDraw(); 
    mStringHandler.draw();  }  }
 
 
    // class HorizontalIntroAnimation extends HorizontalAnimation {HorizontalIntroAnimation() {   super(); }
        // void update(){ image(mImage,w/2,w/2,w,h); super.update();}  void render() {   super.render();  }  }
         
 
    class LaOlaAnimation extends Animation {int overrideAge=0, loopCounter=0, loopMax=4;
    LaOlaAnimation() {   super();  changeStatus = CHANGE_NOT; lifeTime=(mStringHandler.xChars.length);    }
        void update(){ age=overrideAge;   loopCounter++;if(loopCounter>=loopMax){loopCounter   =0;overrideAge++;}if (age >= lifeTime) {/*mStringHandler =  new stringHandler(); */  changeStatus = CHANGE_FORCED;   }  
    if(lifeTime<=(mStringHandler.xChars.length))  {
    if(age < lifeTime &&!mStringHandler.xChars[age].isSpace)  {  mStringHandler.xChars[age].moveDest( 0, -3);image(mImage,mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,letterSize*2,letterSize*2);//ellipse(mStringHandler.xChars[age].dest.x,mStringHandler.xChars[age].dest.y,letterSize,letterSize);
    particleSystem.emitter(mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,mStringHandler.xChars[age].v.x,mStringHandler.xChars[age].v.y,6,(int) letterSize);
    }} }    void render() {     particleSystem.updateAndDraw();    mStringHandler.draw();  }  }
         
    class LaOlaJumpAnimation extends Animation {int overrideAge=0, loopCounter=0, loopMax=4;int jumpX=0,jumpY=50/loopMax;
    LaOlaJumpAnimation() {   super();  changeStatus = CHANGE_NOT; lifeTime=(mStringHandler.xChars.length);   jumpY=(w/4)/loopMax; }
        void update(){ age=overrideAge;   loopCounter++;if(loopCounter>=loopMax){loopCounter   =0;overrideAge++;}if (age >= lifeTime*2) {/*mStringHandler =  new stringHandler(); */  changeStatus = CHANGE_FORCED;   }  
    if(lifeTime<=(mStringHandler.xChars.length))  {
    if(age < lifeTime &&!mStringHandler.xChars[age].isSpace)  {  mStringHandler.xChars[age].moveOri( -jumpX,-jumpY);image(mImage,mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,letterSize*2,letterSize*2);//ellipse(mStringHandler.xChars[age].dest.x,mStringHandler.xChars[age].dest.y,letterSize,letterSize);
    particleSystem.emitter(mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,mStringHandler.xChars[age].v.x,mStringHandler.xChars[age].v.y,6,(int) letterSize);
    }else if(age >=lifeTime&&age-lifeTime < lifeTime &&!mStringHandler.xChars[age-lifeTime].isSpace)  {  mStringHandler.xChars[age-lifeTime].moveOri( jumpX,jumpY);image(mImage,mStringHandler.xChars[age-lifeTime].dest.x+mStringHandler.xChars[age-lifeTime].midShiftx,mStringHandler.xChars[age-lifeTime].dest.y,letterSize*2,letterSize*2);//ellipse(mStringHandler.xChars[age-lifeTime].dest.x,mStringHandler.xChars[age-lifeTime].dest.y,letterSize,letterSize);
    particleSystem.emitter(mStringHandler.xChars[age-lifeTime].dest.x+mStringHandler.xChars[age-lifeTime].midShiftx,mStringHandler.xChars[age-lifeTime].dest.y,mStringHandler.xChars[age-lifeTime].v.x,mStringHandler.xChars[age-lifeTime].v.y,6,(int) letterSize);
    }} }    void render() {     particleSystem.updateAndDraw();    mStringHandler.draw();  }  }
 
    class RandomPositionsSortingAnimation extends Animation {int overrideAge=0, loopCounter=0, loopMax=4, randomAmmount=width/5;PVector[] oriBuffer;
    RandomPositionsSortingAnimation() {   super();  changeStatus = CHANGE_NOT; lifeTime=(mStringHandler.xChars.length); oriBuffer=new PVector[lifeTime]; }
        void update(){ age=overrideAge;   loopCounter++;if(loopCounter>=loopMax){loopCounter   =0;overrideAge++;}if (age >= lifeTime*2) {/*mStringHandler =  new stringHandler(); */  changeStatus = CHANGE_FORCED;   }  
    if(lifeTime<=(mStringHandler.xChars.length))  {if(age < lifeTime /*&&!mStringHandler.xChars[age].isSpace*/)  { 
      if(age==2&&loopCounter==0){for(int i=0;i<mStringHandler.xChars.length;i++){
        oriBuffer[i]=new PVector(mStringHandler.xChars[i].ori.x,mStringHandler.xChars[i].ori.y,0);
          mStringHandler.xChars[i].moveOri( random(-randomAmmount,randomAmmount),random(-randomAmmount,randomAmmount));
          age=lifeTime-1;overrideAge=lifeTime-1;loopCounter=loopMax-1;  }}
      image(mImage,mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,letterSize*2,letterSize*2);//ellipse(mStringHandler.xChars[age].dest.x,mStringHandler.xChars[age].dest.y,letterSize,letterSize);
    particleSystem.emitter(mStringHandler.xChars[age].dest.x+mStringHandler.xChars[age].midShiftx,mStringHandler.xChars[age].dest.y,mStringHandler.xChars[age].v.x,mStringHandler.xChars[age].v.y,6,(int) letterSize);
    }else if(age >=lifeTime&&age-lifeTime < lifeTime /*&&!mStringHandler.xChars[age-lifeTime].isSpace*/)  { //  if(age-lifeTime>1){ 
      mStringHandler.xChars[age-lifeTime].ori.x=oriBuffer[age-lifeTime].x;mStringHandler.xChars[age-lifeTime].ori.y=oriBuffer[age-lifeTime].y;
      textStroke();
        line(  mStringHandler.xChars[age-lifeTime].dest.x,mStringHandler.xChars[age-lifeTime].dest.y,
            mStringHandler.xChars[age-lifeTime].ori.x,mStringHandler.xChars[age-lifeTime].ori.y);//}
      image(mImage,mStringHandler.xChars[age-lifeTime].dest.x+mStringHandler.xChars[age-lifeTime].midShiftx,mStringHandler.xChars[age-lifeTime].dest.y,letterSize*2,letterSize*2);//ellipse(mStringHandler.xChars[age-lifeTime].dest.x,mStringHandler.xChars[age-lifeTime].dest.y,letterSize,letterSize);
    particleSystem.emitter(mStringHandler.xChars[age-lifeTime].dest.x+mStringHandler.xChars[age-lifeTime].midShiftx,mStringHandler.xChars[age-lifeTime].dest.y,mStringHandler.xChars[age-lifeTime].v.x,mStringHandler.xChars[age-lifeTime].v.y,6,(int) letterSize);
    }} }    void render() {     particleSystem.updateAndDraw();    mStringHandler.draw();  }  }
 
 
    class JumpAroundAnimation extends Animation {int overrideAge=0, loopCounter=0, loopMax=2;
    JumpAroundAnimation() {   super();  changeStatus = CHANGE_NOT; lifeTime=(mStringHandler.xChars.length);    }
      int jumpLength=15;  int jumpTime=2;
    void update(){       age=overrideAge;   loopCounter++;if(loopCounter>=loopMax){loopCounter   =0;overrideAge++;}if (age >= lifeTime+jumpTime*3) {/*mStringHandler =  new stringHandler(); */  changeStatus = CHANGE_FORCED;   }  
          jump(jumpTime*0,-jumpLength,-jumpLength,false);
          jump(jumpTime*1,jumpLength*2,0,true);
          jump(jumpTime*2,0,jumpLength*2,false);
          jump(jumpTime*3,-jumpLength,-jumpLength,false);
    }   
    float  mvx,   mvy,  mpx,   mpy;
        void jump(int jTime,int jumpX,int jumpY,boolean withImage){  if(age>jTime&&age < lifeTime+jTime &&!mStringHandler.xChars[age-jTime].isSpace){
          mStringHandler.xChars[age-jTime].moveOri( jumpX,jumpY);
          if(withImage){          mvx=mStringHandler.xChars[age-jTime].dest.x-mpx;       mvy=mStringHandler.xChars[age-jTime].dest.y-mpy;
          mpx=mStringHandler.xChars[age-jTime].dest.x;         mpy=mStringHandler.xChars[age-jTime].dest.y; 
          if(loopCounter!=1){        image(mImage,mStringHandler.xChars[age-jTime].dest.x+mStringHandler.xChars[age-jTime].midShiftx,mStringHandler.xChars[age-jTime].dest.y,letterSize*2,letterSize*2);//ellipse(mStringHandler.xChars[age].dest.x,mStringHandler.xChars[age].dest.y,letterSize,letterSize);
          particleSystem.emitter(mStringHandler.xChars[age-jTime].dest.x+mStringHandler.xChars[age-jTime].midShiftx,mStringHandler.xChars[age-jTime].dest.y,mvx,mvy,6,(int) letterSize);  }   }}}
        void render() {     particleSystem.updateAndDraw();      mStringHandler.draw();  }  }
 
 
 
 
        class ShiftJumpAnimation extends Animation {int overrideAge=0, loopCounter=0, loopMax=6; int jumpX=0, jumpY=-50;
    ShiftJumpAnimation() {   super();  changeStatus = CHANGE_NOT; lifeTime=(mStringHandler.xChars.length);    }
      int jumpLength=15;
    void update(){  // age=overrideAge;   loopCounter++;if(loopCounter>=loopMax){loopCounter   =0;overrideAge++;}
                if (age >= lifeTime) {/*mStringHandler =  new stringHandler(); */  changeStatus = CHANGE_FORCED;   }  
    for (int i=0;i<mStringHandler.xChars.length;i++) {mStringHandler.xChars[i].update();
    if( i==age&&!mStringHandler.xChars[age].isSpace ){    image(mImage,mStringHandler.xChars[i].dest.x+mStringHandler.xChars[i].midShiftx,mStringHandler.xChars[i].dest.y,letterSize*2,letterSize*2);
           mStringHandler.xChars[i].moveOri(jumpX,jumpY);      mStringHandler.xChars[i].draw2D(mainText.charAt(i),(float) (radians((float) (loopCounter*Math.PI)*20)),1+loopCounter*.5f);
     particleSystem.emitter(mStringHandler.xChars[i].dest.x+mStringHandler.xChars[i].midShiftx,mStringHandler.xChars[i].dest.y,mStringHandler.xChars[i].v.x,mStringHandler.xChars[i].v.y,6,(int) letterSize);
    } else {     mStringHandler.xChars[i].moveOri(-((float)(jumpX)/(float)(mStringHandler.xChars.length)),-((float)(jumpY)/(float)(mStringHandler.xChars.length)));
        mStringHandler.xChars[i].draw0D(mainText.charAt(i));}} 
             mStringHandler.draw();
    }    void render() {     particleSystem.updateAndDraw();    }  }
 
 
 
     
        class ShiftJumpIntroAnimation extends ShiftJumpAnimation {ShiftJumpIntroAnimation() {   super(); }
        void update(){ image(mImage,w/2,w/2,w,h); super.update();}  void render() {   super.render();  }  }
 
 
 
 
    ////////////////////////SETTINGS/////////////////////////////////////SETTINGS/////////////////////////////////////SETTINGS/////////////
    ////////////////////////main/////
    int w=480,h=w;// w and h is used for setting sketch width and hight
     int backgroundRed=35*2,backgroundGreen=30*2,backgroundBlue=50*2,backgroundAlpha=150;  // the color for the background
    // int backgroundRed=0,backgroundGreen=0,backgroundBlue=0,backgroundAlpha=120;
    int textRed=255,textGreen=255,textBlue=255,textAlpha=255;  // the color for the text
    public void textFill() {  fill(textRed-sinAbsColor*2,textGreen-sinAbsColor*3,textBlue,textAlpha);}  // called to set the text color
    public void textTint() {  tint(textRed-sinAbsColor*2,textGreen-sinAbsColor*3,textBlue,textAlpha);}  // called to set the text color
    public void textStroke() {  stroke(textRed-sinAbsColor*2,textGreen-sinAbsColor*3,textBlue,textAlpha);}  // called to set the text color
    ////////////////////////text/////
    String mainText;
    ////////////////////////textPhysics/////
    int mouseradius=(int)(w*.2f), mouseForce=6;
    ////////////////////////particlePhysics/////
    int maxParticles = 300, particlesRenderSize=6; float particlesLifeFactor = (float)(0.95), particlesGravity = (float)(.1);
    ////////////////////////SETTINGS/////////////////////////////////////SETTINGS/////////////////////////////////////SETTINGS/////////////
  
    StringHandler mStringHandler;//the StringHandler
    AnimationHandler mAnimationHandler;//the AnimationHandler
    ParticleSystem particleSystem;//...
    PImage mImage;// the image
    FireWorker mFireWorker;
 
 
    String messages_text="Now it´s your " +
            "text!\n \nEdit it with your keyboard \nor drag it with your mouse.\n \nLong lines will be auto-wrapped at " +
            "spaces.\n";
             
 
     
    public void setup(){
      setSize();
       // isJava();
    mImage = loadImage("sketchflower.png");
    //textSize(letterSize);//textFont(createFont("fantasy Bold",letterSize,false));//online standard fonts: sans-serif serif monospace fantasy cursive
    textFont(createFont("arial Bold",letterSize,false));//create the font only once. size could be changed later
     textMode(MODEL); textAlign(LEFT,CENTER);
    rectMode(CENTER);  imageMode(CENTER);
    smooth();
    frameRate(20);
 
    getText();
    if(mainText.length()==0)mainText="This message is empty.";
    // if(!isChar(mainText.length()-2,"\n")){mainText=mainText+"\n";}
    // mainText=mainText+"\n";
    mFireWorker=new FireWorker ();
    mAnimationHandler=new AnimationHandler();//create the AnimationHandler
    mStringHandler=new StringHandler(mainText).setDest(/*w/2,-100*/mAnimationHandler.mAnimation.x,mAnimationHandler.mAnimation.y).randomize(100);//create the StringHandler, animate and randomize letter positions
    particleSystem = new ParticleSystem();//create the ParticleSystem
    }
 
    public void draw() {   if(mousePressed) { vmMouseX=mouseX-mMouseX;  vmMouseY=mouseY-mMouseY;   mMouseX=mouseX;mMouseY=mouseY;  ;mMousePressed=true;   }//handle the mouse events
     fill(backgroundRed,backgroundGreen,backgroundBlue,backgroundAlpha); noStroke();rect(width/2,height/2,width,height);//draw a background with motion blur
 
    mAnimationHandler.draw();//The animation Handler does the rest
 
     info();
    //  selectedThumbnail.src=externals.canvas.toDataURL("image/jpeg",0.7);// take a screenshot from the sketch and place it in the imgElement
      mMousePressed=false;}//make the mouse unpressed for next draw loop
 
 // HTMLElement selectedThumbnail=parent.document.body.getElementsByClassName('visThumbnail50 selected')[0].children[0];// get the right HTMLElement
// selectedThumbnail.style.width="50px";
  





 
 
 
    boolean mMousePressed=false; float mMouseX=(float)(w/2); float mMouseY=(float)(h/2);float vmMouseX=0; float vmMouseY=0;// triggered from mouse and multitouch
 
    float[] pTx= new float[99], pTy= new float[99], pTvx= new float[99], pTvy= new float[99];
 
 
 
    ////////////////////////JAVA-MODE////////////////////////JAVA-MODE////////////////////////JAVA-MODE////////////////////////JAVA-MODE////////////////////////JAVA-MODE
    ////////////////////////Uncomment this block to run in JAVA-MODE////////////////////////Uncomment this block to run in JAVA-MODE////////////////////////Uncomment this block to run in JAVA-MODE
//   String wrapLongLinesAtSpaces(String intxt, int wrapwidth){StringBuilder sb = new StringBuilder(intxt);int i = 0;while (i + wrapwidth < sb.length() && (i = sb.lastIndexOf(" ", i + wrapwidth)) != -1) { sb.replace(i, i + 1, "\n");} return sb.toString();}
//   String getKey(char rkey){return String.valueOf(rkey).toString();}
//   boolean isChar(int inx,String matcher){return String.valueOf(mainText.charAt(inx)).equals(matcher);}
//   void getText(){mainText=messages_text;}
//   void setSize(){size(w, h,  P2D);  }//set the size and rendermode
//   String compatibleName(Object inObj){return inObj.getClass().getSimpleName();}
//   boolean isJava=true;
    ////////////////////////Uncomment this block to run in JAVA-MODE////////////////////////Uncomment this block to run in JAVA-MODE////////////////////////Uncomment this block to run in JAVA-MODE
    ////////////////////////JAVA-MODE////////////////////////JAVA-MODE////////////////////////JAVA-MODE////////////////////////JAVA-MODE////////////////////////JAVA-MODE
 
    /////////////- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - /////////////
 
    ////////////////////////javaSCRIPT-MODE////////////////////////javaSCRIPT-MODE////////////////////////javaSCRIPT-MODE////////////////////////javaSCRIPT-MODE////////////////////////javaSCRIPT-MODE
    ////////////////////////Uncomment this block to run in javaSCRIPT-MODE////////////////////////Uncomment this block to run in javaSCRIPT-MODE////////////////////////Uncomment this block to run in javaSCRIPT-MODE
    public String wrapLongLinesAtSpaces(String text, int wrapwidth){
    ///////////////////////This line works in browser but not in Processing javaSCRIPT-MODE// Uncomment to run from processing, will disable line-wrapping
    var wrapw=wrapwidth; var brk = '\n'; var cut = false; var regex = '.{1,' +wrapw+ '}(\\s|$)' + (cut ? '|.{' +wrapw+ '}|.+$' : '|\\S+?(\\s|$)');text= text.match( RegExp(regex, 'g') ).join( brk ); return text.replace(/\n\n/g , "\n");
    ///////////////////////This line works in browser but not in Processing javaSCRIPT-MODE// Uncomment to run from processing, will disable line-wrapping
    return text;}
    var isChar(int inx,var matcher){return mainText.charAt(inx).match(matcher);}
    String getKey(char rkey){return rkey.toString();}
    void touchStart(t) {  for (int i = 0; i < t.touches.length; i++) {   mMouseX=t.touches[i].offsetX;mMouseY=t.touches[i].offsetY;  ;mMousePressed=true;pTvx[i]=0;   pTvy[i]=0;   pTx[i]=t.touches[i].offsetX;     pTy[i]=t.touches[i].offsetY;     particleSystem.emitter(pTx[i], pTy[i], -pTvx[i], -pTvy[i], 6,6); }  }
    void touchMove(t) {    for (int i = 0; i < t.touches.length; i++) {
    if(i==0){  float moveX=pTx[i]-t.touches[i].offsetX;
    float moveY=pTy[i]-t.touches[i].offsetY;
     window.scrollBy(moveX/2,moveY/2);
    window.scrollBy(moveX*.75f,moveY*.75f);}
         mMouseX=t.touches[i].offsetX;mMouseY=t.touches[i].offsetY;  ;mMousePressed=true;  pTvx[i]=pTx[i]-t.touches[i].offsetX;     pTvy[i]=pTy[i]-t.touches[i].offsetY;          pTx[i]=t.touches[i].offsetX;     pTy[i]=t.touches[i].offsetY;     particleSystem.emitter(pTx[i], pTy[i], -pTvx[i], -pTvy[i], 6,6);    }  }
    void getText(){mainText=messages_text.replace(/qdiibp_Js_LinEbraKeqdiibp_Js_LinEbraKe/g , "qdiibp_Js_LinEbraKe"); mainText=mainText.replace(/qdiibp_Js_LinEbraKeqdiibp_Js_LinEbraKe/g , "qdiibp_Js_LinEbraKe"); mainText=mainText.replace(/qdiibp_Js_LinEbraKe/g , "\n");}
    void setSize(){
        // var $body = $(this.ie6 ? document.body : document); /* using document in ie6 causes a crash*/int mWidth =  $body.width();int mHeight =  $body.height();  width= mWidth >= mHeight ? (mHeight/50)*45 : (mWidth/50)*45; height=width;  if(width>630){width=630;} w=width;h=w;// width=(screen.width/50)*45;    // if(width>630){width=630;}if(screen.width==540){width=300;}if(screen.width==480){width=260;} if(screen.width==960){width=480;}  if(screen.width==800){width=760;} height=width;w=width;h=w;
    size(w, h,  P2D); }//set the size and rendermode
    String compatibleName(Object inObj){return inObj.constructor.name;}
    boolean isJava=false;
    ////////////////////////Uncomment this block to run in javaSCRIPT-MODE////////////////////////Uncomment this block to run in javaSCRIPT-MODE////////////////////////Uncomment this block to run in javaSCRIPT-MODE
    ////////////////////////javaSCRIPT-MODE////////////////////////javaSCRIPT-MODE////////////////////////javaSCRIPT-MODE////////////////////////javaSCRIPT-MODE////////////////////////javaSCRIPT-MODE
 
 
 
 
 
 
 
    public void keyReleased() { if(key!=BACKSPACE)mStringHandler.handleKeyRelease(key); }// send key to the StringHandler. BACKSPACE should be triggered if pressed, other letters only should be pressed once per release
    public void keyPressed() { if(key==BACKSPACE)mStringHandler.handleKeyRelease(key); }// send key to the StringHandler
 
    void windowResized() {if(currentAnimation>1){// var $body = $(this.ie6 ? document.body : document);  int mWidth =  $body.width(); int mHeight =  $body.height();   int mtestwidth= mWidth >= mHeight ? (mHeight/50)*45 : (mWidth/50)*45; //int mtestheight=mtestwidth; if(mtestwidth=w)return;
    size(100, 100,  P2D); setSize();getText();
    if(mainText.length()==0)mainText="This message is empty.";
    mainText=mainText+"\n";
    mAnimationHandler=new AnimationHandler();
    mStringHandler=new StringHandler();}
    }
 
 
 
    boolean showInfo=false, pButtonClicked=false;
    int step=20,lastpos=step;
    private void info() {  int  pos=step;
     noStroke();fill(255,255,255,30);
     ellipse(step*1.5f,step*1.5f,step,step);
     fill(0);  ellipse(step*1.5f,step*1.2f,step/4,step/4);  ellipse(step*1.5f,step*1.65f,step/4,step/2);  pos+=step*2;
      
      if(mMousePressed&&mdist(mMouseX,mMouseY,step*1.5f,step*1.5f)<step/2){ if(!pButtonClicked)showInfo=!showInfo; }   pButtonClicked=mMousePressed;
     if(showInfo){  PGraphics infoG= createGraphics(width/2,lastpos,JAVA2D);
     infoG.beginDraw();  infoG.background(0,0,0,60);
     infoG.textSize(8);
     infoG.text("Animation: "+compatibleName(mAnimationHandler.mAnimation),step,pos);pos+=step;//javaScript
     infoG.text("Animations completed: "+(currentAnimation-1),step,pos);pos+=step;
     infoG.text("isJAVA: "+isJava,step,pos);pos+=step;
     infoG.text("Letter Count: "+mainText.length(),step,pos);pos+=step;
     infoG.text("FrameRate: "+(int)(frameRate*10f)/10,step,pos);pos+=step;
     infoG.endDraw();
     image(infoG,infoG.width/2,infoG.height/2);}
     lastpos=pos; 
     }
    ////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler
    ////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler
    ////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler////////////////////////THE stringHandler
 
 
    float sinAbsColor=0;// to store the last text color
    float letterSize=28;// yes the letterÂ´s size
    class StringHandler {   xChar[] xChars; // the letters
    int wrapWidth=15; int xDist=16, yDist=32;
 
    public StringHandler() {this(mainText);}
    public StringHandler(String htxt) {mainText=htxt;   settext("");}
 
    void settext(String inKey){ float tw=0;
    while(isChar(0," ")||isChar(0,"\n"))mainText=mainText.substring(1);
    if(isChar(mainText.length()-1," ")||isChar(mainText.length()-2," "))mainText=mainText.substring(0,mainText.length()-2);
    String stringAttatchment=isJava?" \n":" \n";
    mainText=" "+mainText+inKey+stringAttatchment;
    mainText=mainText.replace("qdiibp_Js_LinEbraKeqdiibp_Js_LinEbraKe", "\n ");
    int mainTextLength=mainText.length();
    if(mainTextLength<30){ wrapWidth=15; letterSize=28; xDist=16; yDist=36;}
    else if(mainTextLength<60){ wrapWidth=20; letterSize=18; xDist=11; yDist=28;}
    else { wrapWidth=30; letterSize=16; xDist=9; yDist=20;}
    mainText=wrapLongLinesAtSpaces(mainText,wrapWidth);
    textSize(letterSize);
    float currentLineWidth=0;
    int y=0; xChars=new xChar[mainTextLength];
    for (int ix=0;ix<mainTextLength;ix++) { xChars[ix] = new xChar(width/2+ix*40-mainTextLength*20,height/2,ix);
    String[] txtLines=mainText.split("\n");
    if(isChar(ix,"\n")){/* x=0;*/y++; if(y==1)currentLineWidth=tw-letterSize/2;else currentLineWidth=tw-letterSize;tw=0;}
    xChars[ix] = new xChar(width/2  +tw  ,height/2+y*yDist-txtLines.length*(yDist/2),ix); 
      float xCharWidth=textWidth(mainText.charAt(ix));
      xChars[ix].midShiftx=xCharWidth*.5f;   tw+=xCharWidth;
      if(isChar(ix,"\n")){  for (int lix=ix;lix>ix-txtLines[y-1].length()-1;lix--) {  xChars[lix].move(-currentLineWidth/2-xDist/2-letterSize/8,yDist);
      }} }}
    StringHandler randomize(int val) {for (int i=0;i<xChars.length;i++) {xChars[i].randomize(val); }return this;}
    StringHandler setDest(float x, float y) {for (int i=0;i<xChars.length;i++) {xChars[i].setDest( x, y); }return this;}
    StringHandler move(float x, float y) {for (int i=0;i<xChars.length;i++) {xChars[i].move( x, y); }return this;}
    StringHandler moveDest(float x, float y) {for (int i=0;i<xChars.length;i++) {xChars[i].moveDest( x, y); }return this;}
    StringHandler moveOri(float x, float y) {for (int i=0;i<xChars.length;i++) {xChars[i].moveOri( x, y); }return this;}
 
 
    void draw(){ int fxChooser= (int)(Math.round(Math.random()*xChars.length));
    for (int i=0;i<xChars.length;i++) {xChars[i].update();  xChars[i].draw2D(mainText.charAt(i));
    if(fxChooser==i && !xChars[i].isSpace){particleSystem.emitter(xChars[i].dest.x+xChars[i].midShiftx,xChars[i].dest.y,xChars[i].v.x,xChars[i].v.y,3,(int) letterSize); }}}
 
 
    void update(){for (int i=0;i<xChars.length;i++) {xChars[i].update();} }
 
    public void handleKeyRelease(char rkey) {
      if ((rkey == BACKSPACE)&&mainText.length()>2) {
        mainText = mainText.substring(0, mainText.length() - 3);
            settext("");}
    else if(rkey == SHIFT){}  else if(rkey == ENTER){settext("qdiibp_Js_LinEbraKeqdiibp_Js_LinEbraKe");   randomize(10);} else {
      settext(getKey(rkey));      xChars[mainText.length() - 2].moveDest( w/2, 0);  }   }
 
 
 
 
 
 
    public class xChar {//This class provides an advanced letter with a little physics to the stringHandler class
        PVector ori=new PVector(0, 0, 0), dest=new PVector(0, 0, 0),prev=new PVector(0, 0, 0),v=new PVector(0, 0, 0);boolean isSpace;
        float midShiftx=0;   
 
    xChar(float tx,float ty,int i) { ori.x=tx; ori.y=ty; dest.x=tx; dest.y=ty;isSpace=(isChar(i," ")|| isChar(i,"\t")|| isChar(i,"\r")|| isChar(i,"\n"));}
 
    float tresh=.8f;
    void draw0D(char utxt) {sinAbsColor=100f*(sin((abs(ori.z)*abs(dest.z))));//textFill();text(utxt,dest.x,dest.y);
      if(random(5)<1){if(Math.abs(v.x)>tresh||Math.abs(v.x)>tresh)  particleSystem.emitter(dest.x+midShiftx,dest.y,v.x,v.y,1,(int) letterSize); }}
    void draw2D(char utxt) {  draw0D( utxt);textFill();text(utxt,dest.x,dest.y);}
    void draw2D(char utxt,float angle,float scale) {//update();
      sinAbsColor=100f*(sin((abs(ori.z)*abs(dest.z))));
      textFill();  pushMatrix();  translate(dest.x+midShiftx,dest.y);  // scale(scale);
      text(utxt,0,0);popMatrix();
        if(random(5)<1){if(Math.abs(v.x)>tresh||Math.abs(v.x)>tresh)  particleSystem.emitter(dest.x+midShiftx,dest.y,v.x,v.y,1,(int) letterSize); }}
       
    void randomize(int i) { dest.x+=random(-i,i); dest.y+=random(-i,i); }
    void setDest(float x, float y) { dest.x=x; dest.y=y; }
    void moveDest(float x, float y) { dest.x+=x; dest.y+=y; }
    void moveOri(float x, float y) { ori.x+=x; ori.y+=y; }
    void move(float x, float y) { ori.x+=x; ori.y+=y; dest.x+=x; dest.y+=y;}
    float rotZ=0;
 
 
    xChar update() {ori.z+=0.02f*(ori.x-dest.x); dest.z+=(float)(0.02)*(ori.y-dest.y);
    if (mMousePressed) { float D=(float)(0.002)*mouseForce*(mouseradius/mdist(mMouseX, mMouseY, dest.x, dest.y));
    if (mouseButton==RIGHT) { ori.z+=-D*(mMouseX-dest.x); dest.z+=-D*(mMouseY-dest.y); } else
    { ori.z+=D*(mMouseX-dest.x); dest.z+=D*(mMouseY-dest.y); } }
    ori.z*=.95; dest.z*=.95;dest.x+=ori.z; dest.y+=dest.z;
    v.x=dest.x-prev.x;v.y=dest.y-prev.y;
    prev.x=dest.x;prev.y=dest.y;return this; }
}}
 
 
 
    ///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem
    ///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem
    ///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem///////////////////////THE ParticleSystem
 
    public class ParticleSystem {int pNum; Particle[] particles;
    ParticleSystem() {particles = new Particle[maxParticles]; for(int i=0; i<maxParticles; i++) particles[i] = new Particle(); pNum = 0; }
 
    void updateAndDraw(){
       if(mMousePressed){    particleSystem.emitter(mMouseX, mMouseY,vmMouseX, vmMouseY, 10,10);   }
    for(int i=0; i<maxParticles; i++) { if(particles[i].life > 0) { particles[i].update(); particles[i].draw(); } }
     }
    void emitter(float x, float y,float vx, float vy, int count,int emitterSize ){
      for(int i=0; i<count; i++) makeParticle(x + random(-emitterSize, emitterSize), y + random(-emitterSize, emitterSize),vx,vy);
      }
    void makeParticle(float x, float y,float vx, float vy) {if(abs(vx)>30||abs(vy)>30){vx=0;vy=0;} particles[pNum].init(x, y, vx,  vy); pNum++; if(pNum >= maxParticles) pNum = 0;}
 
    public class Particle { float x, y, vx, vy,vyb,  life, mass;//    final static float MOMENTUM = 0.5f;  final static float FLUID_FORCE = 0.6f;
    public Particle() { init(0,0,0,0);}
    void init(float x, float y,float vx, float vy) { this.x = x; this.y = y;  life = random(0.3f, 1); mass = random(0.1f, 1);  this.vx = vx+random(-3, 3);/*-alpha*1-10;*/  this.vy = vy+random(-3, 3); }
    void update() { if(life == 0) return; // only update if particle is visible
 
    if(x<0||x>w)vx=-vx;
    if(y<0||y>h)vy=-vy;
    vyb+=particlesGravity;
    vyb*=particlesLifeFactor;
    x += vx; y += vy+vyb; vx*=life; vy*=life; //vy+=particlesGravity;
    if(vx * vx + vy * vy < 1) { vx = random(-1, 1); vy = random(-1, 1); } // make particles glitter when the slow down a lot
    life *= particlesLifeFactor; if(life < 0.01) life = 0; } // fade out a bit (and kill if alpha == 0);
    void  draw() {    stroke(life*(255),life*(255),255-life*100, life*200+55);
          strokeWeight( life*particlesRenderSize);  line(x-vx, y-vy,x, y);  }}}
 
 
 
 
    float heading2D(float x,float y) { float angle =  (float) (Math.atan2(-y, x)); return -angle;}//calculate heading of moving objects
    float mdist(float x1, float y1, float x2, float y2) { return msqrt(msq(x2-x1) + msq(y2-y1));}float msqrt(float a) { return (float) (Math.sqrt(a));} float msq(float a) { return a*a;}//dist() was not working for me in javascript so I replaced with this
 
 
 
    class FireWorker {  boolean creationMode=false;
      FireWorker(){this.setup();} FireWorks[] mFireWorks = new FireWorks[3];
    void setup() { for(int i=0; i < mFireWorks.length; i++) {   mFireWorks[i] = new FireWorks(); }  }
    void draw() {  for(int i=0; i < mFireWorks.length; i++) {  if (mFireWorks[i].numberE==0 && random(0,100)>99&&creationMode) mFireWorks[i].create();
        if (mFireWorks[i].numberE>0){      mFireWorks[i].flyTo();      if((random(0,height-mFireWorks[i].y)>height*.65f||mFireWorks[i].y<height*.15f) && mFireWorks[i].numberE==1){        mFireWorks[i].explodeF();      }    }  }
    }class FireWorks {  float x,y;    float Radicius;    int numberE=0;    float veloF;
    FireWorks() {      Radicius=5;      veloF=random(2,6);    } 
    void create() {      y=height;      x=random(0,width);      numberE=1;    }
    void flyTo() {      y+=-veloF;      x+=random(-1,1);
      if((y<0 && numberE==1) || (numberE==2 && particleSystem.particles[1].y-y>height)) {        numberE=0;      }
            if(numberE==1) {         textFill();        ellipse(x,y,Radicius*1,Radicius*4);         
              particleSystem.emitter(x,y,random(-1,1), random(-1,10), (int)(Radicius),(int)(Radicius));        }}
    void explodeF() {      for(int i=1;i<particleSystem.particles.length;i++) {
        particleSystem.particles[i].init(x, y, random(-veloF*2,veloF*2), random(-veloF*6,veloF*2));      }      numberE=2;    }    }}
