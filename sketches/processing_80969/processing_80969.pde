
import processing.opengl.*;
 
int xspacing = 8; 
int w;             
int maxwaves = 5;  
 
float theta = 0.0f;
float[] amplitude = new float[maxwaves];  
float[] dx = new float[maxwaves];        
float[] yvalues;                          
float rectColorArray[][][][]; 
 
 
 
void setup() {
  size(900, 420);
  colorMode(HSB);
  smooth();
  noStroke();
  w = width+16;
 
  reset(); 
 
  yvalues = new float[w/xspacing];
 
  rectColorArray = new float[maxwaves][w/xspacing][3][2];
 
  for(int x=0; x < maxwaves; x++){
    for(int y=0; y < w/xspacing; y++){

      rectColorArray[x][y][0][0] = (abs(x-6) + abs(y-6))*2;
      rectColorArray[x][y][0][1] = -2;
      rectColorArray[x][y][1][0] = (abs(x-2) + abs(y-2))*2;
      rectColorArray[x][y][1][1] = 1;
      rectColorArray[x][y][2][0] = (abs(x-5) + abs(y-10))*2;
      rectColorArray[x][y][2][1] = 5;
    }
  }
}
 
void draw() {
  fill(255,120,20);
  rect(0,0,width,height);
  calAndRender();
}
 
void calAndRender() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.04;
 
  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0.0f;
  }
 
  // Accumulate wave height values
  for (int x = 0; x < maxwaves; x++) {
    float t = theta;
    for (int y = 0; y < yvalues.length; y++) {
 
 
      if(rectColorArray[x][y][0][0] > 0 && rectColorArray[x][y][0][0] < 255){
        rectColorArray[x][y][0][0]+= rectColorArray[x][y][0][1];
        // rectColorArray[x][y][0][0]+= 1;      
      }
      else {
        rectColorArray[x][y][0][1] *= -1;
        rectColorArray[x][y][0][0]+= rectColorArray[x][y][0][1];
      }
 
      if(rectColorArray[x][y][1][0] > 0 && rectColorArray[x][y][1][0] < 255){
        rectColorArray[x][y][1][0]+= rectColorArray[x][y][1][1];
      }
      else {
        rectColorArray[x][y][1][1] *= -1;
        rectColorArray[x][y][1][0]+= rectColorArray[x][y][1][1];
      }
 
      if(rectColorArray[x][y][2][0] > 0 && rectColorArray[x][y][2][0] < 255){
        rectColorArray[x][y][2][0]+= rectColorArray[x][y][2][1];
      }
      else {
        rectColorArray[x][y][2][1] *= -1;
        rectColorArray[x][y][2][0]+= rectColorArray[x][y][2][1];
      }
 
      fill(rectColorArray[x][y][0][0],rectColorArray[x][y][1][0],rectColorArray[x][y][2][0],2);
 
 
    
      if (x % 2 == 0) {
 
        yvalues[y] += sin(t)*amplitude[x];
        //println(amplitude[j]);
        float x1 = y*xspacing;
        float y1 = height/2+yvalues[y];
        float xScale = yvalues[(y+y)%77];
        float yScale = yvalues[(y+x+y)%77];
 
        ellipseMode(CENTER);
        ellipse(x1, y1, xScale,yScale);
 
      }
      else {
 
        yvalues[y] += cos(t)*amplitude[x];
 
        float x2 = y*xspacing;
        float y2 = height/2+yvalues[y];
        float xScale = yvalues[(x+x)%77];
        float yScale = yvalues[(y+x+y)%77];
 
        ellipseMode(CENTER);
        ellipse(x2, y2, xScale,yScale);
      }
      t+=dx[x];
    }
  }
}
 
 
void mousePressed() {
  reset();
}
 
void reset() {
  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(10,50)*i;
    float period = random(100,300); // How many pixels before the wave repeats
    // float period = random(10,30); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing;
  }
}


