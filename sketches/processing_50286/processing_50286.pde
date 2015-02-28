
float[] xCoords = new float[1000];
float[] yCoords = new float[1000];
float[] xMove = new float [1000];
float[] yMove = new float [1000];

void setup(){
  size(1280,800);
  for(int i = 0;i<1000; i++){
    xCoords[i]= random(width);
    yCoords[i] = random(height);
    xMove[i] = random(-2,5);
    yMove[i] = random(-2,5);
  }
}

void draw() {
  background (random(0,255));
  fill(0,20);
  rect(0,0,width,height);
  stroke(255);
  for (int i = 0; i<1000; i++){
    fill (mouseY,0,mouseX);
    point (xCoords[i],yCoords[i]);
    xCoords[i]+= xMove[i];
    yCoords[i]+= xMove[i];
  if (xCoords[i] > width|| xCoords[i] <0){
    xMove[i] *=-1;
  }
   if (yCoords[i] > height|| yCoords[i] <0){
    yMove[i] *=-1;
  
  
   }
  }
}



