
float rotation = 0;
float grid_size = 15;

void setup() {
  size(400, 400);
  background(50);
  smooth();
  noStroke();
  ellipseMode(CORNER);
}

//Shape creator function
void rotating_shape(float x, float y, float shape_size, float r) {
  translate(x, y);
  rotate(r);
  ellipse(0, 0, shape_size, shape_size);
  resetMatrix(); 
}

void draw() {
  //Motion Blur effect. Adds a rect() every frame with 10% opacity
  fill(50, 10);
  rect(0, 0, width, height);
  
  //The Main Loop. 
  float x = 0;
  while(x < grid_size) {
    float y = 0;
    while(y < grid_size) {
      //Fills an ellipse with light or dark blue. 1% chance
      if(random(100) > 99) {
        fill(#A9F6FA);
      } else if(random(100) > 99) {
        fill(#34B6CE);
      } else {
        fill(#00E1EA);
      }
      //Creates the shape
      rotating_shape(x * 30, y * 30, 30, rotation + x + y);
      y = y + 1;
    }
    x = x + 1;
  }
  
  //adds rotation factor
  rotation = rotation + 0.2;
  
}
