
//Robot .SAB
// this robot follows the mouse 
// while the motor and ear phone buzzes
//
 int bodyX = 144;
 int bodyY = 151;
 int bodyWidth = 86;
 int bodyHeight = 176;


 
  void setup(){
       //Draw the display window 480 pixels wide and 320 pixels high
   size(480,320); 
       //smooth all edges
   smooth();
   frameRate(10);
 
  }
 
  //info for the rotating ear/headphone piece & the jett propellers
  float angle;
  float jitter;

 void draw()
 {
   
 //never changes - light grey
   background(205);
 
 //jitter funtions
  if(second()%2 == 0){
    jitter = (random(-0.1, 0.1));
    
 //keyPressed functions
  
    
  }
  angle = angle + jitter;
  ellipseMode(CENTER);
 
    //ellipse body
    fill(255);
    strokeWeight(5);
    ellipse(bodyX,bodyY,bodyWidth,bodyHeight);
 
 
      //head ellipse shape
    ellipse (bodyX - 3, bodyY - 59, bodyWidth + 64, bodyHeight - 51);
    fill(255);
    strokeWeight(5);
 
     // left ear/headphone
    fill(255);
    stroke(0);
    strokeWeight(5);
    float rx = random(-2,2);
    ellipse(bodyX - 65 + rx, bodyY - 59, bodyWidth - 62, bodyHeight - 151);


    

    // eyes/visor black
    fill(0);
    rect(bodyX - 38, bodyY-69, bodyWidth +34, bodyHeight - 134);
  
 
    //arm
    fill(255);
    strokeWeight(5);
    stroke(0);
    ellipse(bodyX - 31 , bodyY + 37, bodyWidth - 58, bodyHeight - 108);
 
    frameRate(40);
   
    //legs/propelled motion!
    fill(0);
    strokeWeight(2);
    float ry = random(-2,2);
    ellipse(bodyX -1 + ry ,bodyY +95 ,26,4);
    float rt = random(-2,2);
    ellipse(bodyX -1 + rt,bodyY +101 ,20,4);
    float rh = random(-2,2);
    ellipse(bodyX -1 +rh ,bodyY +107 ,14,4);
   
  }
 
  void mouseMoved() {
  
    bodyX = mouseX;
    bodyY = mouseY;
  
   
  }

   	
	

  

