
//Kim Sipkens
//PS3 Q3
//the changes I made work because it takes the simple code and
//adds to its complexity while still keeping it straightforward and simple


float spin = 0.0; 

void setup() 
{
  size(640, 360, P3D);
  noStroke();
}


void draw() 
{
   background(255);
    translate(width / 2, height / 2);  //places cube in the middle of the window

  spin += 0.03; //controls the spin/rotation speed
  rotate(spin); //sets the cubes rotation
 
// controls the light and the color dependant on the angle of the cube
  pointLight(255, 255, 70,
             200, -150, 0); 

  
  directionalLight(68, 136, 204, 
                   1, 0, 0); 

 
  spotLight(187, 51, 34, 
            0, 40, 200,
            0, -0.5, -0.5, 
            PI / 2, 2); 
            
  //controls the x and y rotation based on the mouse position 
  rotateY(map(mouseX, 0, height, 0, PI));
  rotateX(map(mouseY, 0, width, 0, PI));
  box(150);
}





