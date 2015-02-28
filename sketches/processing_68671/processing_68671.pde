
int radius = 300;  

float [] xPos = new float [360];  
float [] yPos = new float [360];
float [] xPos2 = new float [360];  
float [] yPos2 = new float [360];

void setup() {       
  size(800,800);     
  smooth();           
  background(0);    
  
  
}

void draw() {     
 
  translate(width/2, height/2);
  
  for (int i = 0; i < 360; i++) {
    int deg = i * 1;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
    xPos2[i] = cos(angle) * radius;
    yPos2[i] = sin(angle) * radius;
    int r1 = (int)random(360);
    int r2 = (int)random(360);

    
    stroke(random(255),random(255),random(255));
    line(xPos[r1], yPos[r1], xPos[r2], yPos[r2]);
        
    
  }
  
   
}


