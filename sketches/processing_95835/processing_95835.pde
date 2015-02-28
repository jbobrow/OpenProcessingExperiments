
void setup(){
  size (440,440); // Size of Canvas
}
  
void draw(){
  noStroke(); // No Outline
  background(0); // Background color
  for(int yPos = 0; yPos <500; yPos += 50){ // Sequence of Repetitions
  for(int xPos = 0; xPos < 500; xPos += 50){ //  Sequence of Repetitions
  fill(random(0,255),random(0,255),random(255,255)); // Fill in Color
  rect(xPos,yPos,100,100);}// Shape
  }
  delay(100); // Speed of Color Change 
}

