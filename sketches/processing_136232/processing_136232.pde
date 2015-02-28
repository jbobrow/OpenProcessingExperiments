
////
// Matrix homework HW #5
// Bump on a log
// Patrick O'donnel
// Feb 25, 2013
////

void setup () {
  size (300,300);
  background (255);
  noLoop();
  
}

void draw () {

  for (int i = 0; i<=width; i+=3) {
    
    for (int j = 0; j <=height; j+=3) {
  pushMatrix();
  
  
  translate(i,j);
  
    if (log(i)>=log(j)) {
    point(i,i/2,i,j,j);
    }
    
    if (log(j)>log(i)) {
      point(j,j,j/2,i,i);
    }
    
  popMatrix(); 
   
    }
  }
  
  for (int k = 0; k < width; k+=4) {
      
      translate (16/(k+.1)-k/9,5);
        
      point(5,0,0,0,255);
            
      
  }

}
void point (int s, int r, int g, int b, int t) {
  noStroke();
  fill(r,g,b,t);
  ellipse (0,0,s,s);
}

