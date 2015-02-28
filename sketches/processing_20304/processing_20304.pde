
void setup ()   {

  size(500, 500);  
  background(0);  
  noStroke();  
  smooth();
}


void draw ()   {
  
  for (int i=5; i < width; i+=5) {
    
    for (int j=5; j < height; j+=5) {
      
     fill(random(255));

     rect(i , j , random(10), random(10)); 
   
    }
    
  }

}
                
                
