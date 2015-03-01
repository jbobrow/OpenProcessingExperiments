

//Basic 3D Space Example
//basic definitions and reference from
//https://www.processing.org/reference/sphere_.html
//https://www.processing.org/reference/camera_.html

void setup() {
  smooth();
  size(600, 600, P3D); //calls P3D render
  
  //hides 3D obj's wireframes
  noStroke();
}

void draw() {
  background(255);
  
  //adding a point light
  pointLight(255, 255, 255, //light color (R,G,B)
  width/2, height/2, 0); //X, Y, Z position
  
  //adding a camera to our 3D space
  //camera function requires: X,Y,Z position for the 'eye'
  //X,Y,Z position for the 'target' (or center)
  //and what is called the up-vector:
  //a value (0, 1 or -1) must to be assigned to each dimension (XYZ)
  //(0,1,0) means Y axis is pointing UP.
  camera(
  //eye XYZ:
  width/2 + map(mouseX, 0, width, -400, 400), height/2 + map(mouseY, 0, height, 400, -400), 0,
  //center XYZ
  width/2, height/2, 1000,
  0, 1, 0); //Up-vector
  
 //Here the camera eye is placed at Z=0; Z increases as it goes FAR back; Decreases as it comes NEAR the camera.
  
  //3D Object (Sphere)
  pushMatrix();
  translate(width/2, height/2, 300); //positions sphere front 300px far from camera(X,Y,Z)
  sphere(30); //creates sphere of radius 30
  
  //sphere in the middle
  translate(0, 0, 300);  //displaces the position of elements below this line (inside push/pop)
  sphere(30); //creates sphere of radius 30
  
  //sphere far back
  translate(0, 0, 300); //displaces again
  sphere(30);
  
  popMatrix();
 
 //2D Shapes in 3D space
  pushMatrix();
  fill(200);
  translate(width/2, height/2, 400);
  ellipse(0, 0, 100,100);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2, 700);
  rotateX(radians(90)); //rotates in relation to X axis
  ellipse(0, 0, 100,100);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2, 1000);
  rotateY(radians(90)); //rotates in relation to Y axis
  ellipse(0, 0, 100,100);
  popMatrix();
  
}


