
//////////////////////////////////////////  
int amountlines = 150;      

float[] pointsX = new float[1000];          
float[] pointsY = new float[1000];          
float[] x = new float[1000];          
float[] y = new float[1000]; 
//float[] speed = new float [amountlines];

//////////////////////////////////////////  



void setup() {

  size(700, 400);
  smooth();
  frameRate(10);
 
  for (int a = 0; a < amountlines; a++) {
    pointsX[a] = random(0, 700);         
    pointsY[a] = random(0, 400);         
    x[a] = pointsX[a];                    
    y[a] = pointsY[a]; 
  }
}
  
void draw(){
   background(0);
  

  for (int a = 0; a < amountlines+1; a++) {
    fill(255,80);
    ellipse(x[a],y[a],6,6); 
    x[a] = x[a] + random(0,10);
    
    if(x[a] > width) {
      x[a] = 0;
    }
strokeWeight(1);
stroke(255,50);
    
    for (int b = a; b < amountlines; b++) {
      if (dist(x[b], y[b], x[a], y[a]) < 80) {
        line(x[b], y[b], x[a], y[a]);
      }
    }
  
  }
}


