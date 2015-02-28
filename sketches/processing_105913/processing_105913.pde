
//orange circles

int numCircles = 200;

int[] circleX = new int[numCircles];
int[] circleY = new int[numCircles];

int rad1 = 20;
int rad2 = 30;

void setup(){
  size(700,700);
  smooth();
  for(int i = 0; i < numCircles; i++){
    circleX[i] = int(random(width));
    circleY[i] = int(random(height));
  }
}

void draw(){
  background(0,0,255,50);
  noStroke();
  fill(255, 167, 3);
  
  //checking
  
  for(int i=0; i<numCircles; i++){
    if (mouseX > circleX[i] - rad1 && mouseX< circleX[i] + rad1){
      if(mouseY > circleY[i] - rad2 && mouseY < circleY[i] + rad2){
        if(mousePressed){
          circleX[i] = mouseX;
          circleY[i] = mouseY;
        }
      }
    }
  }
  //circles
  
  for(int i = 0; i< numCircles; i++){
    ellipse(circleX[i], circleY[i], rad1, rad2);
  }
}

void keyPressed(){
  for(int i = 0; i<numCircles; i++){
    circleX[i] = width-(i*2);
    circleY[i] = height-(i*2);}
}
