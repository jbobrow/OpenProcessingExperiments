
 // blinking eye variables
float eye = 70;

void setup () {
  size(600,400);
}

void draw () {
  background(100, 20, 20);
  noStroke();
  smooth();
  fill(255);
 
    
  // eyes left/right
  noStroke();
  ellipse(width/2-100, height/2, 100, eye);
  ellipse(width/2+100, height/2, 100, eye);
  
  // eye colour
  noStroke();
  fill(150,200,150);
  
  ellipse(width/2-100, height/2, 70, eye);
  ellipse(width/2+100, height/2, 70, eye);
 
  // -- MAPPING -- \\ 
  fill(0);
  noStroke();
  
  if(mousePressed) {
    eye = 0;
    // Closed eyes
    ellipse((width/2)+100, height/2, 100, 5);
    ellipse((width/2)-100, height/2, 100, 5);
  }
  
  if(!mousePressed) {
    eye = 70;
    // Right pupil
    float rightPupilX = map(mouseX, 0, width, (width/2)+85, (width/2)+115);
    float rightPupilY = map(mouseY, 0, width, (height/2)-15, (height/2)+30);
    ellipse (rightPupilX, rightPupilY, 20, 20);
    // Left pupil
    float leftPupilX = map(mouseX, 0, width, (width/2)-115, (width/2)-85);
    float leftPupilY = map(mouseY, 0, width, (height/2)-15, (height/2)+30);
    ellipse (leftPupilX, leftPupilY, 20, 20);
  }
   
}
  


