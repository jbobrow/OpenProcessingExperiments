
int radius = 300;  
float [] xPos = new float [360];  
float [] yPos = new float [360];
float [] xPos2 = new float [360];  
float [] yPos2 = new float [360];
float[] r = new float [360];
float[] g = new float [360];
float[] b = new float [360];

void setup() {    
  size(800,800);     
  smooth();          
  background(0); 
  for (int i = 0; i < 360; i++) {
    int deg = i;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
    int j = (int)random(i);
    xPos2[i] = xPos[j];
    yPos2[i] = yPos[j];
  }  
}


void draw() {    
  translate(width/2, height/2);   
  for (int i = 0; i < 360; i++) {
    stroke(r[i], g[i], b[i]); 
    line(xPos2[i], yPos2[i], xPos[i], yPos[i]);    
  }
}


