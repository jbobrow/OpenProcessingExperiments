
int ballCount= 100;
float[] ballSize = new float[ballCount];
float [] xPosition= new float[ballCount];
float [] yPosition= new float[ballCount];
float [] xSpeed= new float[ballCount];
float [] ySpeed= new float[ballCount];


void setup(){
  size (800, 600);
  background(255);
  
  for(int i=0; i<ballCount; i++){
ballSize[i] = random(20,150);
xPosition[i] = random(0,width); 
yPosition[i] = random(0,height); 
xSpeed[i] = random(-2,5);
ySpeed[i] = random (-2,5);

}
}

void draw(){
  background(255);
  for(int i=0; i<ballCount; i++){
    xPosition[i] += xSpeed[i];
    yPosition[i]+= ySpeed[i];
smooth();
fill(0);
noStroke();
ellipse(xPosition[i],yPosition[i],ballSize[i],ballSize[i]);
  }
}


