
// vars for 3d navigation
int boundingBox = 200;
int pointerPosX = 0, pointerPosY = 0, offsetX = 0, offsetY = 0;
float rotationX = 0, rotationY = 0, targetRotationX = 0, targetRotationY = 0; 
float camPos = 0;

void camaraControls () {
  translate(width/2, height/2, camPos); 
  if (mousePressed) {
    pointerPosX = mouseX-offsetX;
    pointerPosY = mouseY-offsetY;
    targetRotationX = pointerPosX/float(width) * TWO_PI;
    targetRotationY = pointerPosY/float(height) * TWO_PI;
    rotationX += (targetRotationX-rotationX)*0.25; 
    rotationY += (targetRotationY-rotationY)*0.25;  
  }
  rotateX(-rotationY); 
  rotateY(rotationX); 
  noFill();
  stroke(240);
  strokeWeight(1); 
  box(boundingBox*2,boundingBox*2,boundingBox*2);
}

