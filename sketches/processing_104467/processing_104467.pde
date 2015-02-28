
float x = 30;
void setup() {  
  size(450, 450, P3D);
  background(0, 255, 0);
}

void draw() {
if(mousePressed){ 
 translate(mouseX, mouseY, 60);
 rotate(x);
 box(50, 25, 50);
 x = x + 0.1;
 }
 sphere(24); 
 box(50, 57, 54);
}
