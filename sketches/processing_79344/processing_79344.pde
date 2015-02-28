
PImage A;
PImage B;
float offset = 0;
float easing = 0.05;

float t = 0.;

void setup()
{
  size(800, 400);
  background(255);
  A = loadImage("shuttle.png");
  B = loadImage("space.png");
    image(B, 0, 0);  // Display at full opacity
}

void draw(){

   
    tint(255, 8);  // Display at half opacity
  float dx = (mouseX-B.width/2) - offset;
  offset += dx * easing; 
image(B, offset, 0);
  
  
  tint(255, 255);
  float ypos = map(noise(t), 0., 1., 0, height);
  image(A,frameCount % width, ypos, 200, 100); 
  t = t + 0.01;

 

  
}

