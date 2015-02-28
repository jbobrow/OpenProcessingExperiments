
//RULES:
//Left and right keys must change the rotation
//Mouse movement must have an effect on size of shapes (x) 
//Mouse movement must change color (y)

float rotation = 0;

void setup(){
 size (600, 600);
background (0); 
  
}

void draw(){
  background (0);
  
 //The movement of the mouse on the Y axis controls the color change of the different squares
   fill(255, 0, 0); 
   
  if(mouseY > 100) {
   fill(255, 0, 230); 
  }
  if(mouseY > 200) {
   fill(0, 0, 255); 
  }
  if(mouseY > 300) {
   fill(0, 255, 255); 
  }
  if(mouseY > 400) {
   fill(0, 255, 30); 
  }
  if(mouseY > 500) {
   fill(255, 255, 0); 
  }
  
  
  //For the squares:
       //Upper is the higher squares in the middle section
       //Lower is the lower squares in the middle section
       //Top, bottom, left, and ride are the respective areas of the background
  
  //The pushMatrix and popMatrix make it so that each section of code is individual
  //This allows each square to rotate on its own axis
  //The map allows for the mouse to control the square size when moves along the X axis
  
  //square top left
   pushMatrix();
   translate(175, -75);
  rotate (rotation);
  smooth();
     float rect1 = map(mouseX, 0, width, 0, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
  popMatrix();
  //square top right
  pushMatrix();
 translate(425, -75);
 rotate(rotation);
 smooth();
    float rect2 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
 popMatrix();
 //square upper left
  pushMatrix();
   translate(175, 175);
  rotate (rotation);
  smooth();
    float rect3 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
  popMatrix();
  //square upper right
  pushMatrix();
 translate(425, 175);
 rotate(rotation);
 smooth();
     float rect4 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
 popMatrix();
 //square lower left
 pushMatrix();
 translate(175, 425);
 rotate(rotation);
 smooth();
     float rect5 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
  popMatrix();
 //square lower right
 pushMatrix();
 translate(425, 425);
 rotate(rotation);
 smooth();
     float rect6 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
  popMatrix();
  //square bottom left
   pushMatrix();
 translate(175, 675);
 rotate(rotation);
 smooth();
     float rect7 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
  popMatrix();
 //square bottom right
 pushMatrix();
 translate(425, 675);
 rotate(rotation);
 smooth();
     float rect8 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
  popMatrix();
  //square left top
   pushMatrix();
 translate(-75, 175);
 rotate(rotation);
 smooth();
     float rect9 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
  popMatrix();
 //square left bottom
 pushMatrix();
 translate(-75, 425);
 rotate(rotation);
 smooth();
     float rect10 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
  popMatrix();
   //square right top
  pushMatrix();
 translate(675, 175);
 rotate(rotation);
 smooth();
     float rect11 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
 popMatrix();
    //square right bottom
  pushMatrix();
 translate(675, 425);
 rotate(rotation);
 smooth();
     float rect12 = map(mouseX, 0, width, 5, 150);
for(int i=0; i<rect1; i++){
rect (-75, -75, rect1, rect1);
}
 popMatrix();
  
}

  //This creates the keypressed code in order to give a value to the rotation
  
  void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      rotation = rotation+.1;
    } else if (keyCode == RIGHT) {
      rotation = rotation-.1;
    } 
  } else {
    rotation = 0;
  }
}                                               
