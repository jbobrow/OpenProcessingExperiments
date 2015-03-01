
float redLightAngle = 0;
float blueLightAngle = 50;

float angleY = 0;
float angleZ = 0;
float angleX = 0;
float midBoxAngle = 0;
float boxNoise = 0;
float rotateYNoise = 0;
float rotateZNoise = 0;
float rotateXNoise = 0;


void setup()
{
  size(1000, 1000, OPENGL);
  noiseSeed(400);
}

void draw()
{
  
  background(0);
  renderLights();
  
  renderBox(-100);
  renderBox(0);
  renderBox(100);
    
  
}

void renderBox(float p_z){
  noStroke();
  colorMode(RGB, 255);
  fill(255, 255, 255, 100);
  
  pushMatrix();
  translate(width / 2, height / 2, 0);
  rotateY(angleY);
  angleY += map(noise(rotateYNoise), 0, 1, -0.001, 0.001);
  rotateYNoise += 0.05;
  
  rotateZ(angleZ);
  angleZ += map(noise(rotateZNoise), 0, 1, -0.0001, 0.0001);
  rotateZNoise += 0.1;
  
  rotateX(angleX);
  angleX += map(noise(rotateXNoise), 0, 1, -0.003, 0.003);
  rotateXNoise += 0.09;
  
  
    pushMatrix();
      translate(-50, -150, p_z);
      box(300, 100, 10);
    popMatrix();
    
    pushMatrix();
      translate(-150, -50, p_z);
      box(100, 100, 10);
    popMatrix();
    
    pushMatrix();
      translate(50, -50, p_z);
      box(100, 100, 10);
    popMatrix();
    
    pushMatrix();
      translate(50, -50, p_z);
      box(100, 100, 10);
    popMatrix();
    
    pushMatrix();
      translate(-50, 50, p_z);
      box(300, 100, 10);
    popMatrix();
    
    
    pushMatrix();
    fill(255, 255, 255, 100);
      float boxZ = map (sin(midBoxAngle), -1, 1, -150, 150);
      translate(-50, -50, boxZ);
      box(100);
      midBoxAngle += map(noise(boxNoise), 0, 1, -0.01, 0.01);
      boxNoise += 0.003;
     popMatrix();
    
  popMatrix();
  
}

void renderLights(){
  colorMode(HSB, 100);
  redLightAngle += 0.01;
  float z = map(sin(redLightAngle), -1, 1, -100, 200);
  pointLight(50, 100, 100, width-400, width/2, z*0.5); 
  
  blueLightAngle += 0.005;
  z = map(sin(blueLightAngle), -1, 1, 0, 200);
  pointLight(100, 50, 50, 100, height/2, z*0.5);
  
  
}
