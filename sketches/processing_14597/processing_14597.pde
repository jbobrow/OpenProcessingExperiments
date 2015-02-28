
class CandleImage{
  int LIGHTCOUNTDOWN = 10;
  int MATCHINITIALLENGTH = 50;
  float matchLength = MATCHINITIALLENGTH;
  
  int NUMPARTICELSPERFRAME = 3 ;
  int PARTICLESIZE = 8;
  
  int SOLID = 0;
  int LIQUID = 1 ;
  int GAS = 2 ;
  int COMBUSTION_INCREASE = 3;
  int COMBUSTION_DECREASE = 4;
  int COMBUSTED = 5;
  
  int NOSMILEY = 0 ;
  int SMILEY = 1 ;
  
  PImage candle, candle_no_flame, shadow, flame ; 
  boolean matchIsLit = false ;
  boolean candleIsLit = false ;
  int lightCountdown = LIGHTCOUNTDOWN;
  int zoomCountdown = 20 ;
  
  public float candleHeight = 1;
  float candleBurnRate = 0.001;
  
  

  float currentScale = 1;
  float currentTraslate = 0;
  
  ArrayList matchFlameParticles;
  ArrayList candleFlameParticles;
  


  
  
  CandleImage(){
    //empty constructor
  }

  void setup() {
    
    
    candleFlameParticles = new ArrayList(); 
    matchFlameParticles = new ArrayList(); 
    
    noCursor(); // doesn't work when viewed in a webbrowser
    
    
    candle = loadImage("data/candle.gif") ; 
    candle_no_flame = loadImage("data/candle_no_flame.jpg") ;
    shadow = loadImage("data/shadow.gif") ;
    flame = loadImage("data/flame.gif") ;
    


     
  }
  
  void draw() {
    
    if(candleHeight < 0.3){
      candleIsLit = false;
    }
    
    if(zoomIn){
      scale(currentScale);
      currentScale = currentScale + 0.01 ;
      translate(-currentTraslate, 0);
      currentTraslate++ ;
      if (currentTraslate == 150)
      {
        showDots = true ;
        zoomIn = false ;
      }
    }
    
    if(zoomOut){
      scale(currentScale);
      currentScale = currentScale - 0.01 ;
      translate(-currentTraslate, 0);
      currentTraslate-- ;
      if (currentTraslate == 0)
      {
        zoomOut = false ;
      }
    }
    
    if(!matchIsLit){
      background(0) ;
      tint(255,20);
    }else{
      background(15) ;     
      noTint();
    }
        
    if (!candleIsLit){
      image(candle, width/10, height/4, width*9/10, height*3/4) ;
      
      stroke(0);
      strokeWeight(6);
      line(width/2,height/4, width/2,(height/4)-15);
      if (( (abs((mouseX-matchLength) - (width/2) ) < 30) && (abs((mouseY-matchLength) - (height/4) ) < 30))
        &&(matchIsLit))
      {
        lightCountdown--;
        if(lightCountdown == 0)
          candleIsLit = true ;
      }else{
        lightCountdown = LIGHTCOUNTDOWN ;
      }
    }else{
      background(15);

      

      noTint();
      image(candle, width/10, height/4, width*9/10, height*3/4) ;
      
      pushMatrix();
      translate(width/2, height-(height*3/4*candleHeight));
      
      fill(15);
      ellipse(0,-200, 400, 400);
      
      stroke(0);
      strokeWeight(6/currentScale);
      line(0,0, 0,-15);
      drawFlame(0, -15);
      popMatrix();
      
      candleHeight = candleHeight - candleBurnRate;
      
      zoomCountdown--;
      if(zoomCountdown == 0)
        zoomIn = true;
        
    }


   
    // concentric rings of increasing shadow

    
    
    
    if ((candleIsLit == false)&&(matchIsLit) ){
      pushMatrix(); 
      translate(mouseX, mouseY); 
      tint(255, 100) ;
      for(float i = 1 ; i < 2; i= i+0.1){
        image(shadow, -((width+matchLength)*i), -(((height+matchLength)*i)+50), width*2*i, height*2*i) ;
      }   
      popMatrix() ;
    }

    
    //match
    if((matchIsLit)&&(matchLength > 30 )){
      matchLength--;
      stroke(0) ; 
      strokeWeight(6) ; 
      line(mouseX, mouseY, mouseX-matchLength, mouseY-matchLength) ;
      drawFlame(mouseX-matchLength, mouseY-matchLength);
      
    }
    else{
      matchIsLit = false ;
    }
    


  } // end draw
  
  void drawFlame(float x, float y){

    noStroke();
    fill(#FF0000) ;
    float ran = random(10,20);
    ellipse(x,y-ran, 5,ran*2);
    
  } // end drawFlame
  
  void lightMatch(){
    matchIsLit = true;
    matchLength = MATCHINITIALLENGTH ;
  }  
}







