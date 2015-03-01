


//void setup () {
 // size (300, 550);
  //rectMode(CENTER);
  noFill ();
//}

size (300,550);


//void draw () {
  background (255);
  
  //float r= 0.05;
  
  for (int i = 0; i<width; i = i+25) {
    for (int j = 0; j<height; j = j+25) {
      
      
      float r = random (10-20);
    rect (i+r, j, 25, 25);
   
   float m = 0;
while (m >height/2) {
  rotate(m);
  m = m + 0.5;
} 
    
  //for (int m = 0; m<width; m = m+1) {
    //rotate (r);
  }
  }
  //}
  
  

