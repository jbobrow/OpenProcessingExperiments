
//Jessey Schwartz
//Introduction to Digital Media Fall 2012
//Section B
//9.13.12

int randomColorOne=0;
int randomColorTwo=0;
int value = 215;
float randomWeight = 100;

void setup() {
   size(1220, 600, P3D); 
}

void draw() {
 
randomWeight = int(random(10));
smooth();
    background(0);
    frameRate(.5);
strokeWeight(randomWeight);
  frameRate(10);
  stroke(255,value,0);
  translate(width/2, height/2, 0);
rotateY(mouseY);
rotateX(mouseX);
pointLight(200, 202, 0, 35, 40, 36);
sphere(225);

stroke(0,100,170);
  translate(width/4, height/4, 0);
rotateY(mouseY);
rotateX(mouseX);
rotateZ(0.5);
pointLight(0, 200, 0, 35, 40, 36);
sphere(6);
 
  }
  
  
void mouseClicked() {
if (value == 215) {
value = 100;
} else {
value = 215;
}
}
