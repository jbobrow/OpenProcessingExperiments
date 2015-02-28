
float Tick = 0;  // gets incremented every frame
 
float Rotation = 0.01;
float RotationalSpeed = 0.001;
float RotationalAccel = 0.0001; // Acceleration
 
float Scale = 1;


void setup() {
  size(800,800);
  background(0);
  smooth();
  colorMode(RGB);
  fill(color(255,190,70));  // Change intial color
}
 
void draw() {

  ++Tick;
   
  translate(width/2, height/2); //have the rotation and scale in the middle
   
  Rotation += (RotationalSpeed += RotationalAccel);    // Accelerate the Rotation
  rotate(Rotation);
   
  Scale = 1+sin(Tick/15);  //Calculate the scale
  if (Scale<.01) {        // Is it a new Cycle?
    fill(color(12,44,240));  // Change color
  }
  scale(.4*Scale);    // Scale it with the sin equasion but keep it in the screen
     // Adjust Border thickness for scaling (remove if run in the API)
     
  translate(-width/2, -height/2);  //Translate back
   
  DrawShape();
}
 
void DrawShape() {
  ellipse(width/12,height/12,width/8,height/8);
   if (mousePressed == true) {
    fill(4,27,222);
  } else {
    fill(255,171,3);
  }
}

