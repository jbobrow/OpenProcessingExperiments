
//RULES:
//Left and right keys must change the rotation
//Mouse movement must have an effect on size of shapes (x) 
//Mouse movement must change color (y)

float rect1;
float rotation = 0;

void setup(){
 size (1000, 600);
background (0); 
  
}

void draw(){
  
  //makes the rotation point the center of the background
 translate(width/2, height/2);
 //rotates based on the keypressed code (the LEFT and RIGHT arrows)
rotate(rotation);

//creates the blue base color
fill(0, 0, 255);
smooth();

//Next 5 lines of code change the color of the squares when the mouse is moved along the Y axis
if(mouseY > 100) {
  fill(0, 0, 190);
}
if(mouseY > 200) {
  fill(0, 0, 120);
}
if(mouseY > 300) {
 fill(0, 0, 70); 
}
if(mouseY > 400) {
 fill(0, 0, 30); 
}
if(mouseY > 500) {
 fill(0, 0, 0); 
}

//Next 5 sections of code create a map that limits how large the scale of the squares can be
//This maximum scale is determined by the location of the mouse along the X axis
float rect1 = map(mouseX, 0, width, 0, 10);
for(int i=0; i<rect1; i++){
rect (2, 2, rect1, rect1);
}
float rect2 = map(mouseX, 0, width, 0, 25);
for(int i=0; i<rect1; i++){
rect(25, 25, rect2, rect2);
}
float rect3 = map(mouseX, 0, width, 0, 50);
for(int i=0; i<rect1; i++){
rect(75, 75, rect3, rect3);
}
float rect4 = map(mouseX, 0, width, 0, 80);
for(int i=0; i<rect1; i++){
rect(150, 150, rect4, rect4);
}
float rect5 = map(mouseX, 0, width, 0, 150);
for(int i=0; i<rect1; i++){
rect(250, 250, rect5, rect5);
}
  
}

  //This creates the keypressed code in order to give a value to the rotation
  void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      rotation = rotation+1;
    } else if (keyCode == RIGHT) {
      rotation = rotation-1;
    } 
  } else {
    rotation = 0;
  }
}                               
