
int numBoxes = 200;

int[] boxX = new int[numBoxes];
int[] boxY = new int[numBoxes];

int boxSize = 20;


void setup(){
  size(500, 500);
  
  
  for(int i = 0; i < numBoxes; i++){
    boxX[i] = int (random(width)); 
    boxY[i] = int (random(height));
    
  }
  
  
}


void draw(){
  background(0);
  stroke(0);
  fill(175, 238, 238);
  
  //detect which box the mouse is in and move it with the mouse if its pressed
  for(int i = 0; i < numBoxes; i++){
    if(mouseX > boxX[i] - boxSize/2 && mouseX < boxX[i] + boxSize/2){
      if(mouseY > boxY[i] - boxSize/2 && mouseY < boxY[i] + boxSize/2){
        if(mousePressed){
          boxX[i] = mouseX;
          boxY[i] = mouseY;
        } 
      } 
    }
    
  }
  //draw boxes
  for(int i = 0; i < numBoxes; i++){
   rect(boxX[i], boxY[i], boxSize, boxSize); 
    
  }


}

void keyPressed(){
  for(int i = 0; i < numBoxes; i++){
    boxX[i] = width/2; 
    boxY[i] = 25 + 50*i;
  }
  
}
