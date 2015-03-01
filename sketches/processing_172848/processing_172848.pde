
/**
 * Directional. 
 * 
 * Move the mouse the change the direction of the light.
 * Directional light comes from one direction and is stronger 
 * when hitting a surface squarely and weaker if it hits at a 
 * a gentle angle. After hitting a surface, a directional lights 
 * scatters in all directions. 
 */

int columns = 8;
int rows = 5;
float sphereBaseRadius = 200.0;

void setup() {
  size(900, 600, P3D);
  noStroke();
  fill(204);
}

void draw() {
  noStroke(); 
  background(0); 
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  
  directionalLight(204, 204, 204, -dirX, -dirY, -1);   
  pointLight(255, 255, 255, mouseX, mouseY, -400);
    
  for (int r = 0; r < rows; r++){
    
    pushMatrix();
    translate(0, (r+1) * height/(rows+1), 0); 
    
    for (int c = 0; c < columns; c++){
      
      float x = (c+1) * width/(columns+1);
      float y = (r+1) * height/(rows+1);
      float distToMouse = sqrt( (mouseX-x)*(mouseX-x) + (mouseY-y)*(mouseY-y) );
      
      translate(width/(columns+1), 0, 0.1*distToMouse);
      sphere(sphereBaseRadius/max(rows,columns)); 
    }
    
    popMatrix();
  }
}



