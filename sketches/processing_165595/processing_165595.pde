
float[] xRay = new float [15];
float[] yRay = new float [15];
float[] xMov = new float [15];
float[] yMov = new float [15];
float xPos, yPos;

void setup(){
  noStroke();
  size(800,800);
  //get data
  for (int i = 0; i < 15; i++) {
    for(int j = 0; j < 15; j++) {
    xRay[i] = (width/15) * i  + ((width/15)/2);
    xPos = xRay[i];
    yRay[j] = (height/15) * j + ((height/15)/2);
    yPos = yRay[j];
    rect(xPos, yPos, random(5), random(5));
    
    
    
  }
  }
}
  // make shapes
//  for (int i =0; i < 15; i++) { 
//    for(int j = 0; j<15; j++)
//    rect(xPos/15, yPos, random(5), random(5));
//  }
//  
//}
  



// 50 100 150  




void draw(){
  
  
  
  
  for (int i = 0; i <15; i++) {
     for(int j = 0; j<15; j++){
    xMov[i] = random(-3, 3);
    yMov[j] = random(-3, 3);
    
    xPos = xPos + xMov[i];
    yPos = yPos + yMov[j];
    rect(xPos, yPos, random(5), random(5));
  }}
  
   
  
  
  // get movment
// for (int i =0; i < 15; i++) { 
//    for(int j = 0; j<15; j++){
//      
//    rect(xRay[i], yRay[j], random(5), random(5));
//  }
//  
  
  
//   for (int i = 0; i <15; i++) {
//     for(int j = 0; j<15; j++)
//    xMov[i] = random(-3, 3) ;
//    yMov[j] = random(-3, 3);
//  }}

// for (int i =0; i < 15; i++) { 
//    rect(xRay[i], yRay[i], random(25), random(1, 3),xRay[i]*19, yRay[i]*19, random(25), random(1, 3));
//  }
  
}
