
int radius = 300;  

int oneArray, twoArray;

float [] xPos = new float [360];  
float [] yPos = new float [360];


void setup() {       
  size(800,800);   
  smooth();         
  background(0);   

  for (int i = 0; i < 360; i++) {
    int deg = i;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
  

   stroke (255);
  translate(width/2, height/2);
    
    for (int i = 0; i < 700; i++) {
    
    stroke (random(255), random(255), random(255));
      
       (random (360));
      twoArray = int (random (360));
    
    line (xPos[oneArray], yPos[oneArray], xPos[twoArray], yPos[twoArray]);    
  
    }
}
