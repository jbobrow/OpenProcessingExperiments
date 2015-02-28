
float Tick = 0;  // gets incremented every frame

float Rotation = 0.01;
float RotationalSpeed = 0.01;
float RotationalAccel = 0.001; // Acceleration

float Scale = 1; 

void setup() {
  size(450,450, P2D);
  background(0);
  smooth();
  colorMode(HSB);
  fill(color(random(255),255,200));  // Change intial color
}

void draw() {
  ++Tick;
  
  translate(width/2, height/2); //have the rotation and scale in the middle
  
  Rotation += (RotationalSpeed += RotationalAccel);    // Accelerate the Rotation
  rotate(Rotation);
  
  Scale = 1+sin(Tick/15);  //Calculate the scale
  if (Scale<.01) {        // Is it a new Cycle?
    fill(color(random(255),255,200));  // Change color
  }
  scale(.4*Scale);    // Scale it with the sin equasion but keep it in the screen 
  strokeWeight(.5 + 1/Scale);    // Adjust Border thickness for scaling (remove if run in the API)
    
  translate(-width/2, -height/2);  //Translate back
  
  DrawShape();
}

void DrawShape() {
  rect(width/8,height/8,width/4,height/4);
}
