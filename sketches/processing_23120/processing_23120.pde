
//time functions to get different noise characteristics
float t1 = 0.0;
float t2 = 0.2;
float t3 = 0.4;
float tX = 0.0;
float tY = 0.3;
float theta = 0;
float n;
float[] positions = new float[125];
float[] positions2 = new float[125];
int i = 3;
int start = 1;

//increments, the overall movement and the circle size vary in different ways
float incrementX = 0.01;
float increment = 0.1;

int pulse = 0;



void setup(){
  frameRate(30);
  size(900, 900);
  background(0);
  smooth();
  
}
  
  
void draw(){
  noStroke();
   
  //thi rectangle "fades" the drawing slowly
  fill(0, 0, 0, 2);
  strokeWeight(1);
  rect(0, 0, width, height);
  
  incrementX += abs(sin(theta)*.000001);
  theta += .1;
   
  //\/\/\/\/\/MOVIE MAKER STUFF\/\/\/\/\/\/\/\\
  //loadPixels();
  //mm.addFrame(pixels,width,height);
   
   // Get a noise value at "time" and scale it for each dot.
  float m = noise(t2)*16;
  
   
  //get a noise value at time and scale it for movement
  float x = noise(tX)*width;
  float y = noise(tY)*height;
   
  // With each cycle, increment the " time "
  t1 += increment;
  t2 += increment;
  t3 += increment;
  tX += incrementX;
  tY += incrementX;
   
  // Draw the ellipse with size determined by Perlin noise
  stroke(251,158,83);
  fill(160, 50, 80);
  //rect(x-m, y-m, m, m);
  positions[i] = (x-m);
  positions2[i] = (y-m);
  if (i > 0 && i != 2 && start > 1) {
    
    //strokeWeight(1.2);
    noStroke();
    ellipse(positions[i]-10, positions2[i]-10, (positions[i-1]-10) * .2, (positions2[i-1]-10) * .2);
    if (positions[i]-positions[i-1] < 0){
      
    }
  }
  
  if (i == 2) {
    noStroke();
    ellipse(positions[2]-10, positions2[2]-10, (positions[124]-10) * .2, (positions2[124]-10) * .2); 
  }
  
  i++;
  start++;
    
  if (i > 124) {
   i = 2;
  }
  
  /*
  if (pulse < 500) {
    pulse += 1;
  }
    else {
     background(0,0,0,50);
     pulse = 0; 
     noStroke();
     fill(255,255,255);
     rect((x-m) - 10, (y-m) - 10, m + 10, m + 10);
  }
  */
}
  
