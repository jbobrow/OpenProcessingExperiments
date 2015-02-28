
class Particle {
  int id ;
  public PVector loc ;
  PVector vel ;
  PVector acc ;
  float particleWidth ;
  float particleHeight ;
  color particleColor ;
  float particleTransparency = 255;
  float localStrokeWeight = 1;
  
  public int particleState = 0 ; 
  boolean stateChanging = false ;
  float stateChangingCounter = 0 ;
  float meltingRate = 0.2 ;
  float evaporationRate = 0.34 ;
  float dispersionRate = 0.2 ;
  float combustionRate = 0.2 ;


  
   
  Particle(int j, float lx, float ly, float diameter, color c) {
    id = j ;
    loc = new PVector(lx, ly) ;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    particleWidth = diameter ;
    particleHeight = diameter ;
    particleColor = c ;
  } // end particle contructor
  
  void tick(){
    incrementState();
    vel.add(acc);
    loc.add(vel);
  } // end tick
  
  void setChangeState(){
    stateChanging = true ;
  }
  
  void incrementState(){
    if(stateChanging){
      
      //melting
      if (particleState == SOLID){ //melting
        stateChangingCounter = stateChangingCounter + meltingRate;
        particleTransparency = map(min(stateChangingCounter,1), 0, 1, 255, 30);

        if(stateChangingCounter >= 1){
          particleState = LIQUID;
          stateChanging = false ;
          stateChangingCounter = 0 ;
          return;
        }
      } // end melting
      
      //evaporating
      if(particleState == LIQUID){ 
        stateChangingCounter = stateChangingCounter + evaporationRate;
        
        particleTransparency = map(min(stateChangingCounter,1), 0, 1, 30, 0);
        localStrokeWeight = 1-min(stateChangingCounter,1); 
        particleWidth = map(stateChangingCounter, 0, 1, particleSize, particleSize*3) ;
        particleHeight = particleWidth ;
        
        
        if (stateChangingCounter >= 1){   
          particleState = GAS ;
          particleTransparency = 0 ;
          float tempx = random(-10,10);
          vel.add(new PVector(tempx, -0.5*(15-abs(tempx))));//todo magic number//todo use noise not random
          //vel.add(new PVector(tempx*tempd, 0));//todo magic number//todo use noise not random
          acc.add(new PVector(-tempx/10, 0));
          stateChangingCounter = 0 ;
          return;
        }
      }
      
      //dispersion 
      if(particleState == GAS){ 
        stateChangingCounter = stateChangingCounter + dispersionRate;
        if (stateChangingCounter >= 1){
          particleState = COMBUSTION_INCREASE ;
          stateChangingCounter = 0 ;
          return;
        }
      }
      
      // combustion //todo fix mess
      if(particleState == COMBUSTION_INCREASE){
        acc.add(GRAVITY);
        stateChangingCounter = stateChangingCounter + combustionRate;

        particleTransparency = map(min(stateChangingCounter,1), 0, 1, 100, 255);
        localStrokeWeight = map(min(stateChangingCounter,1), 0, 1, .5, 1);
        particleColor = lerpColor(COMBUSTIONCOLORSTART, COMBUSTIONCOLORFINISH, stateChangingCounter);
        particleHeight = particleWidth*map(min(stateChangingCounter,1), 0, 1, 1, 2);      

        if (stateChangingCounter >= 1){
          particleState = COMBUSTION_DECREASE ;
          stateChangingCounter = 0 ;   
          return;

        }
      }
      
      // combustion decrease //todo fix mess
      if(particleState == COMBUSTION_DECREASE){ 
        acc.add(GRAVITY);
        stateChangingCounter = stateChangingCounter + combustionRate;
        particleTransparency = map(min(stateChangingCounter,1), 0, 1, 255, 0);
        particleColor = lerpColor(COMBUSTIONCOLORFINISH, COMBUSTIONCOLORSTART, stateChangingCounter);
     
        if (stateChangingCounter >= 1){
          particleState = COMBUSTED ;
          stateChanging = false ;
          stateChangingCounter = 0 ;
          return;
        }
      } // end combustion decrease
    } //end if statechanging
  } // end incrementState
  
  

   
  void draw() {
      
    fill(particleColor, particleTransparency );
    pushMatrix() ;
    translate(loc.x, loc.y) ; 
    noStroke();
    ellipse(0, 0, particleWidth, particleHeight) ;
    stroke(0);
    //draw smiley
    strokeWeight(particleWidth/7*localStrokeWeight) ;
    point(-particleWidth/7, -particleHeight/7) ;
    point(+particleWidth/7, -particleHeight/7) ;
    line(-particleWidth/7,particleHeight/7, particleWidth/7,particleHeight/7) ;

    popMatrix() ;
  }
}

