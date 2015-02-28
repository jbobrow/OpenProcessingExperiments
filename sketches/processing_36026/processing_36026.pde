
//////////////////////////////////////////  
int amountlines = 400;      
float speed = 5;
float c_size = 0.1;

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
   
   float pull = 3;
   

  for (int a = 0; a < amountlines+1; a++) {
    fill(255,80);
    ellipse(x[a],y[a],c_size,c_size); 
    x[a] = x[a] + random(speed);
    y[a] = y[a] + random(speed);
  
  if (mousePressed == true)
  {  
   if (mouseButton == LEFT)
    {
      if(x[a] < mouseX){
      x[a] += pull;
    }
    else if(x[a] > mouseX){
    x[a] -= pull;
  }
 if (y[a] < mouseY){
 y[a] += pull;
 }
else if (y[a] > mouseY){
 y[a] -= pull;
} 
  }
    
    if (mouseButton == RIGHT)
    {
     if(x[a] > mouseX){
      x[a] += pull;
    }
    else if(x[a] < mouseX){
    x[a] -= pull;
  }
 if (y[a] > mouseY){
 y[a] += pull;
 }
else if (y[a] < mouseY){
 y[a] -= pull;
} 
    }
  }
  
    if(x[a] > width) {
      x[a] = 0;
    }
    if(y[a] > height) {
      y[a] = 0;
      
    }
  
stroke(255,50);
    
    for (int b = a; b < amountlines; b++) {
      if (dist(x[b], y[b], x[a], y[a]) < 80) {
        line(x[b], y[b], x[a], y[a]);
      }
    }
  
  }
}



