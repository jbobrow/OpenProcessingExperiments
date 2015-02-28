
void setup () {
  size (500, 500);
  smooth ();
}

void draw () {
  background (255);
  noStroke ();
 
  
  float x;
  float y;
  
 if (mousePressed) {
  for (int i=0; i <= width; i = i + 1) {
   for (int j=0; j <= height; j = j + 1) {
   
       x = i * 20;
       y = j * 20;
      
        fill (0, 0, 0);
        ellipse (x, y, 30, 30);
        fill (255, 255, 255);
        ellipse (x, y, 10, 10);       
    }
  }
 }else{
     for (int i=0; i <= width; i = i + 1) {
       for (int j=0; j <= height; j = j + 1) {
   
  
        x = i * 20;
        y = j * 20;
 
     
        fill (255, 255, 255);
        ellipse (x, y, 27, 27);
        fill (0);
        ellipse (x, y, 10, 10);    
        }
      }
    }
  }
              
                
