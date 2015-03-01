
//variables

float ballx = 0;

float bally = -50;

float ballz = 0;

float rx = 0;

float ry = 0;

float rz = 0;

 

//setup

void setup() {

  size(1000, 500, P3D);

  background(0);

  strokeWeight(.7);

  smooth();

}

 

//draw

void draw() {

  background(0, 0, 0);

  camera(mouseX-250, mouseY-125, mouseX-250, 500 + ballx, 350 + bally, 0 + ballz, 0, 1, 0); //CAMERA ROTATION WITH MOUSE

 

  //OBJECTS

  translate(500, 350, 0);

  translate(ballx, bally, ballz); //BALL SETUP

  rotateX(rx); //BALL

  rotateY(ry);

  rotateZ(rz);
  fill(246, 246, 246); 
  sphere(150);

translate(100, 350, 0);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
  
  translate(20, 150, 355);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
  
  
  translate(200, -500, 46);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
  
  
  translate(0, 520, 500);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
  
  
  translate(300, -100, -100);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
  
  
  translate(-100, 400, -460);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
  
  
  translate(-500, -800, 46);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
  
 
 translate(350, 33, -226);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
  
  translate(-50, 70, -46);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
  
  translate(40, -70, -146);
  fill(255, 251, 0); 
  stroke(255,251,0);
  sphere(50);
  
}

 
