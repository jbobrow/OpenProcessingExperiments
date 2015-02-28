
//KESHIA KINGSLEY. PS1. Question 4. 8x8 grid
void setup(){
 size(400, 400);
 smooth();
 strokeWeight(1);
 stroke(255);
 }


 void draw() {
  for(int y = 0; y <height; y +=50){
  for(int x = 0; x < width; x +=50) {
    
    rect(x, y, 50, 50);
    fill(73, 175, 211);
  }
  }
 }
 
 


