
int numPoints = 4000; // numero punti
float complexity = 8; // wind complexity
float maxMass = .8; // max pollen mass
float timeSpeed = .02; // wind variation speed
float phase = TWO_PI; // fase
 
float[] pollenMass;
float[][] points;

PImage background;
 
void setup() {
  size(800, 600);
  background(255);
  background = loadImage("background.jpg");
  image(background, 0, 0);
   
  points = new float[numPoints][2];
  pollenMass = new float[numPoints];
  for(int i = 0; i < numPoints; i++) {
    points[i] = new float[]{random(0, width), random(0, height)};
    pollenMass[i] = random(0, maxMass);
  }
  noiseDetail(14);  
}
 
void draw() {
  
  float t = frameCount * timeSpeed;
  
  if(mousePressed){
    
    int colore = int(map(mouseX, 0, 800, 0, 120));
    int trasparenza = int(map(mouseY, 0, 600, 5, 20));
    
    stroke(colore, trasparenza);
  
    for(int i = 0; i < numPoints; i++) {
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
       
      point(x, y);
         
      points[i][0] = x;
      points[i][1] = y;
    }
  }
}
 
void keyPressed() {
  if (key== DELETE || key== BACKSPACE) {background(255);}  
  else {saveFrame("screenshot-######.png");}
}



