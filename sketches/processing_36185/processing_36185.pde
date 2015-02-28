
int maxDots = 5000;
float [] xPos = new float [maxDots];
float [] yPos = new float [maxDots];
int dotDiameter = 1;
int count = 0;

void setup(){
  size(700,400);
  background (0);
  noStroke();
  
  for (int i = 0; i < maxDots; i++){
    xPos[i] = random(width);
    yPos[i] = random (height);
    float colour = random (3);
      if (colour <= 1){
       fill(255,0,0); 
      }
      else if (colour >1 && colour <=2){
      fill(0,255,0);
      }
      else if (colour > 2 && colour <=3){
       fill(0,0,255); 
      }
    ellipse(xPos[i],yPos[i], dotDiameter, dotDiameter);
  }
  
}

void draw(){
  for (int i = 0; i < maxDots; i++){
    xPos[i] = random(width);
    yPos[i] = random (height);
  
    
    if (count <=500){
      float colour = random (3);
      if (colour <= 1){
       fill(255,0,0); 
      }
      else if (colour >1 && colour <=2){
      fill(0,255,0);
      }
      else if (colour > 2 && colour <=3){
       fill(0,0,255); 
      }
    }
    else if (count >500 && count <5000){
     fill(0);
    }
ellipse(xPos[i],yPos[i], dotDiameter, dotDiameter);
count++;
}
if (count == 5000){
count = 0;  
}

}

