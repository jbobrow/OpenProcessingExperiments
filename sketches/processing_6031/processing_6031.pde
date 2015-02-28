
//SET ONE
int nPoints = 4096; // points to draw 
float complexity = 8; // wind complexity 
float maxMass = .8; // max pollen mass 
float timeSpeed = .02; // wind variation speed 
float phase = TWO_PI; // separate u-noise from v-noise 
 
float windSpeed = 23; // wind vector magnitude for debug 
int step = 12; // spatial sampling rate for debug 
 
float[] pollenMass; 
float[][] points; 

boolean debugMode = false;

//SET TWO
int nPoints2 = 4096; // points to draw 
float complexity2 = 15; // wind complexity 
float maxMass2 = .8; // max pollen mass 
float timeSpeed2 = .02; // wind variation speed 
float phase2 = TWO_PI; // separate u-noise from v-noise 
 
float windSpeed2 = 23; // wind vector magnitude for debug 
int step2 = 12; // spatial sampling rate for debug 
 
float[] pollenMass2; 
float[][] points2; 
 
boolean debugMode2 = false; 
 
//SET ONE 
  void setup() { 
  size(512, 427, P2D); 
   
  points = new float[nPoints][2]; 
  pollenMass = new float[nPoints]; 
  for(int i = 0; i < nPoints; i++) { 
    points[i] = new float[]{random(0, width), random(0, height)}; 
    pollenMass[i] = random(0, maxMass); 
  } 
  noiseDetail(67); 
  background(4,20,80); 

//SET TWO
  points2 = new float[nPoints2][2]; 
  pollenMass2 = new float[nPoints2]; 
  for(int i = 0; i < nPoints2; i++) { 
    points2[i] = new float[]{random(0, width), random(0, height)}; 
    pollenMass2[i] = random(0, maxMass2); 
  } 
  noiseDetail(67); 
  background(4,20,80); 
} 
 
//SET ONE
void draw() {  
 
  ellipse (540, 65, 17, 17);
  fill (240, 219,58,20);
  stroke (237, 187, 48);
  
  ellipse (470, 75, 100,100);
  fill (237, 187, 48);
  stroke (240,219,58);
  
  ellipse (55,30,23,23);
  fill (240, 219,58);
  stroke (240,219,58);
  
  ellipse (120,20,15,15);
  fill (240, 219,58);
  stroke (240,219,58);
  
  ellipse (185,17,12,12);
  fill (240, 219,58);
  stroke (240,219,58);
  
  ellipse (213,30,17,17);
  fill (240, 219,58);
  stroke (240,219,58);
  
  ellipse (325,40,27,27);
  fill (240, 219,58);
  stroke (240,219,58);
  
  ellipse (365,90,25,25);
  fill (240, 219,58);
  stroke (240,219,58);
  
  float t = frameCount * timeSpeed; 
   
  if(debugMode) { 
    background(4,20,80); 
    stroke(80,128,209); 
    float s = windSpeed; 
    for(int i = 0; i < width; i += step) { 
      for(int j = 0; j < height; j += step) { 
        float normx = map(i, 0, width, 0, 1); 
        float normy = map(j, 0, height, 0, 1); 
        float u = noise(t + phase, normx * complexity + phase, normy * complexity + phase); 
        float v = noise(t - phase, normx * complexity - phase, normy * complexity + phase); 
        pushMatrix(); 
        translate(i, j); 
        line(0, 0, lerp(-windSpeed, windSpeed, u), lerp(-windSpeed, windSpeed, v)); 
        popMatrix(); 
      } 
    }     
    stroke(80, 128, 209); 
  } else { 
    stroke(80, 128,209); 
  } 
   
  for(int i = 0; i < nPoints; i++) { 
    float x = points[i][0]; 
    float y = points[i][1]; 
     
    float normx = norm(x, 0, width); 
    float normy = norm(y, 0, height); 
    float u = noise(t + phase, normx * complexity + phase, normy * complexity + phase); 
    float v = noise(t - phase, normx * complexity - phase, normy * complexity + phase); 
    float speed = (1 + noise(t, u, v)) / pollenMass[i]; 
    x += lerp(-speed, speed, u); 
    y += lerp(-speed, speed, v); 
     
    if(x < 0 || x > width || y < 0 || y > height) { 
      x = random(0, width); 
      y = random(0, height); 
    } 
     
    if(debugMode) 
      rect(x, y, 10, 10); 
    else 
      point(x, y); 
       
    points[i][0] = x; 
    points[i][1] = y; 
  } 
  
  //float t = frameCount * timeSpeed2; 
   
  if(debugMode) { 
    background(4,20,80); 
    stroke(181, 204,242); 
    float s = windSpeed2; 
    for(int i = 0; i < width; i += step2) { 
      for(int j = 0; j < height; j += step2) { 
        float normx = map(i, 0, width, 0, 1); 
        float normy = map(j, 0, height, 0, 1); 
        float u = noise(t + phase2, normx * complexity2 + phase2, normy * complexity2 + phase2); 
        float v = noise(t - phase2, normx * complexity2 - phase2, normy * complexity2 + phase2); 
        pushMatrix(); 
        translate(i, j); 
        line(0, 0, lerp(-windSpeed2, windSpeed2, u), lerp(-windSpeed2, windSpeed2, v)); 
        popMatrix(); 
      } 
    }     
    stroke(181, 204, 242); 
  } else { 
    stroke (181, 204,242); 
  } 
   
  for(int i = 0; i < nPoints2; i++) { 
    float x = points2[i][0]; 
    float y = points2[i][1]; 
     
    float normx = norm(x, 0, width); 
    float normy = norm(y, 0, height); 
    float u = noise(t + phase2, normx * complexity2 + phase2, normy * complexity2 + phase2); 
    float v = noise(t - phase2, normx * complexity2 - phase2, normy * complexity2 + phase2); 
    float speed = (1 + noise(t, u, v)) / pollenMass2[i]; 
    x += lerp(-speed, speed, u); 
    y += lerp(-speed, speed, v); 
     
    if(x < 0 || x > width || y < 0 || y > height) { 
      x = random(0, width); 
      y = random(0, height); 
    } 
     
    if(debugMode2) 
      rect(x, y, 10, 10); 
    else 
      point(x, y); 
       
    points2[i][0] = x; 
    points2[i][1] = y; 
  } 
} 
 
//SET ONE 
 void mousePressed() { 
  setup(); 
} 
 
//SET ONE 
 void keyPressed() { 
  debugMode = !debugMode; 
  background(4,20, 80); 
} 

