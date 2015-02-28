
void setup(){
size (900, 600, P3D);}
  
  

void draw(){
background(255);
translate(mouseX, mouseY);
rotateX(float(millis())/500);
rotateZ(float(millis())/742);
noFill();
sphere(200);
sphere(100);
sphere(50);
sphere(25);
}

