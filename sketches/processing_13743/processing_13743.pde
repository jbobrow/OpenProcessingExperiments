
// drawing machines & generative systems @ sci-arc
// week 04: ribbon drawing


int pointCount = 0;
int maxPoints = 800;
int drawMode = 0;
boolean isRecording = true;

// keep track of coordinates and vectors
float[] xPositions = new float[maxPoints];
float[] yPositions = new float[maxPoints];
float[] xDirections = new float[maxPoints];
float[] yDirections = new float[maxPoints];
float lastDX, lastDY;

void setup(){
  
   size(600, 400);
   smooth();
   strokeWeight(1);
   
   
   for(int i=0; i<maxPoints; i++){
     
       xPositions[i] = 0;
       yPositions[i] = 0;
       xDirections[i] = 0; 
       yDirections[i] = 0;
   }
}

void draw(){
  
   background(0); 
   
   if(isRecording && frameCount > 10){
      
     // add to the array at the current position (average a little to make things smoother)
     
     xPositions[pointCount] = (mouseX + pmouseX)/2;
     yPositions[pointCount] = (mouseY + pmouseY)/2;
     xDirections[pointCount] = ((mouseX - pmouseX) + lastDX)/2;
     yDirections[pointCount] = ((mouseY - pmouseY) + lastDY)/2;
     lastDX = mouseX - pmouseX;
     lastDY = mouseY - pmouseY;
      
      // increment the point count
     pointCount++;
     
     // test if array is filled
     if(pointCount >= maxPoints){
      
        isRecording = false;
     }
   }
   
   // draw the shape
   
   stroke(255, 33);
   
   
   // see processing's begin shape reference for more info on quad strips
   // http://processing.org/reference/beginShape_.html
   
   beginShape(QUAD_STRIP);
   
   for(int i=1; i<pointCount-2; i++){
       
       if(i%2==0) { fill(255); } else { fill(0); }
      
       // record points based on the position and vector
       vertex(xPositions[i]+yDirections[i], yPositions[i]-xDirections[i]); 
       vertex(xPositions[i]-yDirections[i], yPositions[i]+xDirections[i]);
   }
   
   endShape();
}

void mousePressed(){
 
   // clear and start from scratch
  
   pointCount = 0;
   lastDX = 0;
   lastDY = 0;
   isRecording = true;
}
                                
