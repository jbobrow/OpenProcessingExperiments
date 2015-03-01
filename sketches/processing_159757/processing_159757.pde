
void setup(){
    size(630,700); // 
    background(30, 20, 25); // 
    smooth(); 
    }
  
void draw(){
    float x = 500; // command x axis to move randomly
    for (int i = 0; i<width; i+=200){ 
        fill(100, 25, 50, 5); 
        ellipse(i, noise(i*0.4f, frameCount*0.2f)*height, 3, 800); 
        }
    
   }

