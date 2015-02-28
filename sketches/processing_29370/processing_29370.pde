

  import processing.video.*;
  Capture myCapture;
  
  
  
  void setup() {
    size(640, 480);
    smooth();
  
  rectMode (CENTER);
    
    myCapture = new Capture(this, width, height, 15);
  }
  
  int circleSize = 15;
  
  
  
  
  void draw() {
    randomSeed(0);
    translate(circleSize/2,circleSize/2);
    background(0);
  noStroke();
    for (int i = 0; i<width/circleSize;i++) {
      for (int j = 0; j<height/circleSize;j++) {
  
      
        float circleSize2 = green(myCapture.get(i*circleSize, j*circleSize));
         
        fill(myCapture.get(i*circleSize, j*circleSize) );
        
        pushMatrix();
       translate(i*circleSize, j*circleSize);
       
        rect(0,0, circleSize2/20, circleSize2/10);
        popMatrix(); 
        
            pushMatrix();
       translate(i*circleSize, j*circleSize);
       
        rect(0,0, circleSize2/10, circleSize2/20);
        popMatrix(); 
       
     
        
        
   
    }
    }
  }
  
  
  void captureEvent(Capture myCapture) {
    myCapture.read();
  }


