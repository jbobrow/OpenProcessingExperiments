
float spin = 0.0;

void setup() {
  size(320, 240, P3D);
  noStroke();
}

void draw() {
  defineLights();
  background(0);
  spin += 0.1;
  
  for (int x = 0; x <= width; x += 15) {
    for (int y = 0; y <= height; y += 15) {
      
       if (mousePressed) {
      pushMatrix();
      translate(x, y);
      rotateY(map(mouseX, 0, width, 0, PI));
      rotateX(map(mouseY, 0, height, 0, PI));
      box(20);
      popMatrix(); 
         
        } else {
            
      pushMatrix();
      translate(x, y);
      rotateY(map(height*3, 0, width*4, 0, PI/5 + spin));
      rotateX(map(width*5, 0, height*8, 0, PI/5 + spin));
      box(65);
      popMatrix(); 
      
    }
    }
}
}

void defineLights() {

  pointLight(160,160,160,   // Color
             200, -150, 0); // Position

  directionalLight(100,100,100, // Color
                   1, 0, 0);    // The x-, y-, z-axis direction

  spotLight(235,235,235, // Color
            0, 40, 200,     // Position
            0, -0.5, -0.5,  // Direction
            PI / 2, 2);     // Angle, concentration
}


