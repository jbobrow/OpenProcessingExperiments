
int rad = 60;                            
int numBalls = 30;                       
float[] xpos = new float[numBalls];     
float[] ypos = new float[numBalls];      
float[] velX = new float [numBalls];     
float[] velY = new float [numBalls];     
 
void setup(){
  size(800,800);
  stroke(255);
  smooth();
  for (int i = 0; i < numBalls; i++){
    xpos[i]= random(rad, width-rad);
    ypos[i]= random(rad, height-rad);  
    velX[i] = random(5,40);
    velY[i] = random(3,60);
  }
}
 
void draw(){
  frameRate(20);
  background(0);
  for(int i = 0; i < numBalls; i++){
    fill(255, random(255), random(250));
    ellipseMode(CENTER);
    ellipse(xpos[i], ypos[i], rad, rad);
    xpos[i] += velX[i];
    ypos[i] += velY[i];
    
    if(xpos[i] <= rad || xpos[i] > width-rad){
      velX[i] *= -1;
    }
    if(ypos[i] <= rad || ypos[i] > height-rad){
      velY[i] *= -1;
  }
  }
}



