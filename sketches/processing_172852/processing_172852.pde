
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

float sinkX = 0;
float sinkY = 0;

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
  pointLight(255, 0, 0, mouseX, mouseY, 400);
  pointLight(0, 255, 0, mouseX, mouseY, 0);
  pointLight(0, 0, 255, mouseX, mouseY, -400);
    
    
  sinkX = mouseX;
  sinkY = mouseY;
  
  //sinkX = sinkX + 1.0; //mouseX;
  //sinkY = sinkY + 1.0;//mouseY;
    
  for (int r = 0; r < rows; r++){
    
    pushMatrix();
    
    translate(0, (r+1) * height/(rows+1), 0); 
    
    for (int c = 0; c < columns; c++){
      
      float x = (c+1) * width/(columns+1);
      float y = (r+1) * height/(rows+1);
      float distToMouse = sqrt( (sinkX-x)*(sinkX-x) + (sinkY-y)*(sinkY-y) );
      
      translate(width/(columns+1), 0, 0);
      pushMatrix();
      // z is translated separately so it can be reset for each sphere
      translate(0,0,0.100-0.01*(distToMouse*distToMouse));
      sphere(sphereBaseRadius/max(rows,columns));
      popMatrix();
      
    }
    
    popMatrix();
  }
}



