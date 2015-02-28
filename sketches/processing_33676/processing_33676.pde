
int numCircles = 100;
float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];

int [] rad = new int[numCircles];

void setup(){
  size(500,500);
  smooth();
  noStroke();
  
  for(int i=0; i< numCircles; i++){
    rad[i] = round(random(10,50));
    circleX[i] = round(random(rad[i], width-rad[i]));
    circleY[i] = round(random(rad[i], height-rad[i]));
  }
}

void draw(){
  background(121,181,200);
  for(int j=0; j< numCircles; j++){
    ellipse(circleX[j], circleY[j],rad[j],rad[j]);
  }
}

                
                
