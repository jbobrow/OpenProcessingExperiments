


void setup(){
  
  size(600,200);
  background(0);
  noFill();
  
  smooth();
  

  
  stroke(162);  
  rectBuilder(-5,50,10,20,30,40);
  rectBuilder(-5,110,10,20,30,40); 
  stroke(255);
  strokeWeight(2);
  
  rectBuilder(-5,80,5,20,30,40); 
  
  //add block of color for reflected cityscape
  fill(0,120);
  rect(-5,100,650,100);
  

}


void draw(){
   
}


void rectBuilder(float theX,float theY,float theWidth,float theHeight,float lowerLimit,float upperLimit){
  
    // exit if over edge
    if(theX > width){
      return;
    }
    
    // draw what is passed in
    strokeWeight(random (0,3));
    
    rect(theX,theY,theWidth,theHeight);
    
    float newHeight = random(lowerLimit,upperLimit);
    
    float midPoint = theY + (theHeight / 2);
    
    float newY = midPoint - (newHeight / 2);
    
    float newX = theX + theWidth;
    
    // call the function recursively
    rectBuilder( newX, newY, theWidth, newHeight, lowerLimit, upperLimit);
}
