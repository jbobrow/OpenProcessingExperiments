
int circleX[] = new int [100];
int circleY[] = new int [100];
int ballSize[] = new int[100];

void setup(){
  background(255);
  size(600,600);
  noStroke();
  
  for (int i = 0; i < 100; i++){
    circleX[i] = int(random(0, width));
    circleY[i] = int(random(0,height));
    ballSize[i] = int(random(10, 50));
  }
}

void draw(){
  background(0);
  
  for(int i = 0; i < 100; i++){
   fill(255,0,255);
   ellipse(circleX[i], circleY[i], ballSize[i], ballSize[i]);
  }
}


