


void setup(){
  background (255);
  noStroke();
  smooth();
  
  size (500, 500);
  for (int i=0; i < 500; i= i+25){
    
    fill (0, 255, 0, 100);
    ellipse(250, i, i/5, i/5);
    
    fill (0, 0, 255, 100);
    ellipse(i, 250, (500-i)/5, (500-i)/5); 
  
  }
  
}



void draw() {



}

