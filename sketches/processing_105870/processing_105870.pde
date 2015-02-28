
int numPos = 50;
int[] xPos = new int[numPos];
int[] yPos = new int[numPos];
float[] xSpd = new float[numPos];
float[] ySpd = new float[numPos];

void setup(){
  size(500, 500);
  noStroke();
  
  fill(240);

  for(int i = 0; i < numPos; i++){
    xPos[i] = int(10);
    yPos[i] = int(10);
    xSpd[i] = random(3,15);
    ySpd[i] = random(3,15);
  }
}

void draw(){
  background(255);
  
  
  for(int i = 0; i < numPos; i++){
    ellipse(xPos[i], yPos[i], 20, 20);

    if(xPos[i] > width - 10 || xPos[i] < 10){
    xSpd[i] = xSpd[i] * (-1);    
    }
    
    if(yPos[i] > height - 10 || yPos[i] < 10){
    ySpd[i] = ySpd[i] * (-1);
    }  

    xPos[i] += xSpd[i];
    yPos[i] += ySpd[i];
  }
 
}

//changeing colors
void mouseClicked(){
  fill(random(255), random(255), random(255), 40);
}
