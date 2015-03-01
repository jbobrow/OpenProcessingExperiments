
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
int time = 0;

float sinkX = 0;
float sinkY = 0;

float sink2X = 0;
float sink2Y = 0;

void setup() {
  size(900, 600, P3D);
  //size(720, 820, P3D);
  noStroke();
  fill(204);
}

void draw() {
  time += 1;
  noStroke(); 
  background(0);
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  
  directionalLight(204, 204, 204, -dirX, -dirY, -1); 
  pointLight(255, 0, 0, mouseX, mouseY, 400);
  pointLight(0, 255, 0, mouseX, mouseY, 0);
  pointLight(0, 0, 255, mouseX, mouseY, -400);
    
    
  sinkX = width/2 + width/2 * cos(time*0.01); //mouseX;
  sinkY = height/2 + height/2 * sin(time*0.01);//mouseY;
  
  // sink2 is reflected across the origin
  sink2X = width/2 - width/2 * cos(time*0.01);
  sink2Y = width/2 - height/2 * sin(time*0.01);
  
  //sinkX = sinkX + 1.0; //mouseX;
  //sinkY = sinkY + 1.0;//mouseY;
    
  for (int r = 0; r < rows; r++){
    
    pushMatrix();
    
    translate(0, (r+1) * height/(rows+1), 0); 
    
    for (int c = 0; c < columns; c++){
      
      float x = (c+1) * width/(columns+1);
      float y = (r+1) * height/(rows+1);
      float distToSink = sqrt( (sinkX-x)*(sinkX-x) + (sinkY-y)*(sinkY-y) );
      float distToSink2 = sqrt( (sink2X-x)*(sink2X-x) + (sink2Y-y)*(sink2Y-y) );
      
      translate(width/(columns+1), 0, 0);
      pushMatrix();
      // z is translated separately so it can be reset for each sphere
      translate(0,0,400-0.01*(distToSink*distToSink)+0.01*(distToSink2*distToSink2));
      sphere(sphereBaseRadius/max(rows,columns));
      popMatrix();
      
    }
    
    popMatrix();
  }
}



