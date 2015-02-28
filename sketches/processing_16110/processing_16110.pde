
//By Bhavya Kashyap

int x = 0;
int y = 0;

void setup() {
  size(640, 360, P3D);
  fill(204);
}

void draw() {
  lights();
  background(50,50,50);
  pointLight(150, 100, 255, // Color
             200, -150, 0); // Position
  
  // Change height of the camera with mouseY 
  camera(mouseX, mouseY, 0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  
  noStroke();
  x = x + 1;
  y = y + 20;
  fill(1,y,x);
  
  //ball #1
  translate(0, 70, -200+mouseX*0.5);
  sphere(60);
  
  //ball #2
  translate(20, -200+mouseY*0.5, mouseX*0.7);
  sphere(50);
  
  //ball #3
  translate(-60, -150-mouseY*0.5, mouseX*0.4);
  sphere(40);
}

