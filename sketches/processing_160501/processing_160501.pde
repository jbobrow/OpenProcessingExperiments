
/**
 * Mixture
 * by Simon Greenwold. 
 * 
 * Display a box with three different kinds of lights. 
 */

void setup() {
  size(640, 360, P3D);
  noStroke();
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  
  // Orange point light on the right
  pointLight(190, 20, 0, // Color
             200, -150, 0); // Position

  // Blue directional light from the left
  directionalLight(0, 12, 255, // Color
                   1, 0, 0); // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  spotLight(5, 225, 9, // Color
            0, 40, 200, // Position
            0, -0.5, -0.5, // Direction
            PI / 2, 2); // Angle, concentration
  
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateX(map(mouseY, 0, height, 0, PI));
  box(150);
}


