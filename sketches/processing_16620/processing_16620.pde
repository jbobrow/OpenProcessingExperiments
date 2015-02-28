
import processing.opengl.*;

void setup(){
   smooth();
  size(1024, 768, OPENGL);
  noStroke();
}

void draw() {
 
 defineLights();
  background(0);
  
  for (int x = 0; x < width; x += 100) {
    for (int y = 0; y < height; y += 100) {
      pushMatrix();
      translate(x, y);
      rotateY(map(mouseX, mouseY, millis()/0.3,350, PI));
      rotateX(map(mouseX, mouseY, millis()/0.3,350, PI));
      box(40);
      popMatrix();
    }
  }
}

void defineLights() {

  pointLight ( 250, random (110), random (200),   // Color
             0, 0, 0); // Position

  directionalLight(random (80), random(7), 134, // Color
                   1, 3, 0);    // The x-, y-, z-axis direction

  // Yellow spotlight from the front
 spotLight(110, 255, 200,  // Color
           mouseX, 0,mouseY,     // Position
            mouseX,0 , mouseY,  // Direction
            PI / mouseX,mouseY);     // Angle, concentration
}

